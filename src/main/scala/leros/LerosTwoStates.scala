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

  dataMem.io.rdAddr := effAddrWord
  val dataRead = dataMem.io.rdData
  dataMem.io.wrAddr := effAddrWord
  dataMem.io.wrData := accu
  dataMem.io.wr := false.B
  // TODO: use mask
  dataMem.io.wrMask := "b1111".U

  val regRead = registerMem.read(instr(7, 0))
  val data = Mux(decReg.isLoadInd, dataRead, regRead)
  // printf("ar = %x address = %x data = %x\n", addrReg, address, dataRead)

  alu.io.op := decReg.op
  alu.io.enaMask := 0.U
  alu.io.enaByte := decReg.isLoadIndB
  alu.io.off := RegNext(effAddr(1, 0))
  // this should be a single signal from decode (what did I mean?)
  alu.io.din := Mux(decReg.useDecOpd, decReg.operand, data)

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
      when (decReg.isStore) {
        registerMem.write(instrLowReg, accu)
        alu.io.enaMask := 0.U
      }
      when(decReg.isStoreInd) {
        dataMem.io.wr := true.B
        alu.io.enaMask := 0.U
      }
    }

  }

  exit := RegNext(decReg.exit)
}

object LerosTwoStates extends App {
  emitVerilog(new LerosTwoStates(32, 10, args(0), true), Array("--target-dir", "generated"))
}