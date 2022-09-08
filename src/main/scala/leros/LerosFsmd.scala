package leros

import chisel3._
import chisel3.util._

import StateFsmd._

/**
 * Leros top level.
 *
 * Sequential implementation with two states.
 */
class LerosFsmd(size: Int, memSize: Int, prog: String, fmaxReg: Boolean) extends Leros(size, memSize, prog, fmaxReg) {

  val stateReg = RegInit(sFeDec)

  val decReg = RegInit(DecodeFsmdOut.default)

  // Decode
  val dec = Module(new DecodeFsmd())
  dec.io.din := instr
  val decout = dec.io.dout

  val effAddr = (addrReg.asSInt + decout.operand.asSInt).asUInt
  val effAddrWord = (effAddr >> 2).asUInt

  val address = Mux(decout.isLoadInd, effAddrWord, instr(7, 0))
  val dataRead = dataMem.read(address)

  // defaults should be:
  alu.io.enaMask := 0.U
  alu.io.enaByte := false.B

  alu.io.op := decReg.op
  alu.io.enaByte := decReg.isLoadIndB
  alu.io.off := RegNext(effAddr(1, 0))
  val useDecOpd = WireDefault(false.B)
  alu.io.din := Mux(useDecOpd, decReg.operand, dataRead)

  switch(stateReg) {
    is (sFeDec) {
      decReg := decout
      stateReg := decout.next
    }

    is (sAlu) {
      pcReg := pcNext
      alu.io.enaMask := decReg.enaMask
      stateReg := sFeDec
    }

    is (sAluI) {
      pcReg := pcNext
      alu.io.enaMask := decReg.enaMask
      useDecOpd := true.B
      stateReg := sFeDec
    }

    is (sOut) {
      pcReg := pcNext // this duplication is redundent and can lead to errors
      outReg := accu
      stateReg := sFeDec
    }

    is (exe) {
      pcReg := pcNext
      alu.io.enaMask := decReg.enaMask
      when (decReg.isLoadAddr) {
        addrReg := accu
        alu.io.enaMask := 0.U
      }
      when (decReg.isLoadInd) {
        // nothing to be done here
      }
      when (decReg.isStore || decReg.isStoreInd) {
        val writeAddress = Mux(decReg.isStoreInd, effAddrWord, instrLowReg)
        dataMem.write(writeAddress, accu)
        alu.io.enaMask := 0.U
      }
      stateReg := sFeDec
    }

  }

  exit := RegNext(decReg.exit)
}

object LerosFsmd extends App {
  emitVerilog(new LerosFsmd(32, 10, args(0), true), Array("--target-dir", "generated"))
}