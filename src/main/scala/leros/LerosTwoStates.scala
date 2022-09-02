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
  dec.io.din := instr(15, 8)
  val decout = dec.io.dout

  // Operand
  val operand = Wire(UInt(size.W))
  val instrSignExt = Wire(SInt(32.W))
  instrSignExt := instr(7, 0).asSInt
  when(decout.nosext) {
    operand := instr(7, 0)
  } .elsewhen(decout.enahi) {
    operand := instrSignExt(23, 0).asUInt ## accu(7, 0)
  } .elsewhen(decout.enah2i) {
    operand := instrSignExt(15, 0).asUInt ## accu(15, 0)
  } .elsewhen(decout.enah3i) {
    operand := instr(7, 0) ## accu(23, 0)
  } .otherwise {
    operand := instrSignExt.asUInt
  }

  val effAddr = (addrReg.asSInt + instrSignExt).asUInt
  val effAddrWord = (effAddr >> 2).asUInt

  val address = Mux(decout.isLoadInd, effAddrWord, instr(7, 0))
  val dataRead = dataMem.read(address)

  alu.io.op := decReg.op
  alu.io.ena := decReg.ena & (stateReg === exe)
  alu.io.enaByte := decReg.isLoadIndB
  alu.io.enaHalf := false.B
  alu.io.off := RegNext(effAddr(1, 0))
  alu.io.din := Mux(decReg.isLoadInd || decReg.isRegOpd, dataRead, opdReg)

  switch(stateReg) {
    is (feDec) {
      decReg := decout
      opdReg := operand
    }

    is (exe) {
      pcReg := pcNext
      when (decReg.isLoadAddr) {
        addrReg := accu
      }
      when (decReg.isLoadInd) {
        // nothing to be done here
      }
      when (decReg.isStore || decReg.isStoreInd) {
        val writeAddress = Mux(decReg.isStoreInd, effAddrWord, instrLowReg)
        dataMem.write(writeAddress, accu)
      }
    }

  }

  exit := RegNext(decReg.exit)
}

object LerosTwoStates extends App {
  (new chisel3.stage.ChiselStage).emitVerilog(new LerosTwoStates(32, 10, args(0), true), Array("--target-dir", "generated"))
}