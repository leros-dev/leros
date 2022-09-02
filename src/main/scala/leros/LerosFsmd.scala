package leros

import chisel3._
import chisel3.experimental.ChiselEnum
import chisel3.util._

import StateFsmd._

/**
 * Leros top level.
 *
 * Sequential implementation with two states.
 */
class LerosFsmd(size: Int, memSize: Int, prog: String, fmaxReg: Boolean) extends Leros(size, memSize, prog, fmaxReg) {


  val stateReg = RegInit(feDec)


  val decReg = RegInit(DecodeFsmdOut.default)

  // Decode
  val dec = Module(new DecodeFsmd())
  dec.io.din := instr(15, 8)
  val decout = dec.io.dout

  switch (stateReg) {
    is (feDec) { stateReg := decout.next }
    is (exe) { stateReg := feDec }
  }

  // Operand
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

    is (sAlu) {
      pcReg := pcNext
      alu.io.ena := true.B
      alu.io.din := dataRead
      stateReg := feDec
    }

    is (sAluI) {
      pcReg := pcNext
      alu.io.ena := true.B
      alu.io.din := opdReg
      stateReg := feDec
      operand := instr(7, 0)
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

