package leros

import chisel3._
import chisel3.util._
import chisel3.experimental.ChiselEnum

/**
 * Leros top level.
 *
 * Sequential implementation with two states.
 */
class LerosTwoStates(size: Int, memSize: Int, prog: String, fmaxReg: Boolean) extends Leros(size, memSize, prog, fmaxReg) {

  object State extends ChiselEnum {
    val feDec, exe = Value
  }
  import State._

  val stateReg = RegInit(feDec)

  switch (stateReg) {
    is (feDec) { stateReg := exe }
    is (exe) { stateReg := feDec }
  }

  val decReg = RegInit(DecodeOut.default)

  // Decode
  val dec = Module(new Decode())
  dec.io.din := instr
  val decout = dec.io.dout

  val effAddr = (addrReg.asSInt + instrSignExt).asUInt
  val effAddrWord = (effAddr >> 2).asUInt

  val address = Mux(decout.isLoadInd, effAddrWord, instr(7, 0))
  val dataRead = dataMem.read(address)

  alu.io.op := decReg.op
  alu.io.enaMask := 0.U
  alu.io.enaByte := decReg.isLoadIndB
  alu.io.off := RegNext(effAddr(1, 0))
  // this should be a single signal from decode
  alu.io.din := Mux(decReg.useDecOpd, decReg.operand, dataRead)

  switch(stateReg) {
    is (feDec) {
      decReg := decout
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
    }

  }

  exit := RegNext(decReg.exit)
}

object LerosTwoStates extends App {
  emitVerilog(new LerosTwoStates(32, 10, args(0), true), Array("--target-dir", "generated"))
}