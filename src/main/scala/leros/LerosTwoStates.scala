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
  // TODO: shall we rewrite this to use UInt per default?
  val operand = Wire(SInt(size.W))
  val op16sex = Wire(SInt(16.W))
  op16sex := instr(7, 0).asSInt
  val op24sex = Wire(SInt(24.W))
  op24sex := instr(7, 0).asSInt
  when(decout.nosext) {
    operand := (0.U(24.W) ## instr(7, 0)).asSInt // no sign extension
  } .elsewhen(decout.enahi) {
    operand := (op24sex.asUInt ## accu(7, 0)).asSInt
  } .elsewhen(decout.enah2i) {
    operand := (op16sex.asUInt ## accu(15, 0)).asSInt
  } .elsewhen(decout.enah3i) {
    operand := (instr(7, 0) ## accu(23, 0)).asSInt
  } .otherwise {
    operand := instr(7, 0).asSInt
  }

  val effAddr = (addrReg.asSInt + op16sex).asUInt
  val effAddrWord = (effAddr >> 2).asUInt

  // Data memory
  // TODO: shall be byte write addressable
  val dataMem = SyncReadMem(1 << memSize, UInt(32.W))
  // TODO: what is accu as address? probably register file, but we have a dedicated register file
  val address = Mux(decReg.isLoadAddr && stateReg === exe, accu, effAddrWord)
  val dataRead = dataMem.read(address)

  alu.io.op := decReg.op
  alu.io.ena := decReg.ena & (stateReg === exe)
  alu.io.enaByte := decReg.isLoadIndB
  alu.io.enaHalf := false.B
  alu.io.off := RegNext(effAddr(1, 0))
  alu.io.din := Mux(decReg.isLoadInd, dataRead, Mux(decReg.isRegOpd, registerRead, opdReg))

  switch(stateReg) {
    is (feDec) {
      decReg := decout
      opdReg := operand.asUInt
    }

    is (exe) {
      pcReg := pcNext
      when (decReg.isStore) {
        registerMem.write(opdReg(15, 0), accu)
      }
      when (decReg.isLoadAddr) {
        addrReg := accu
      }
      when (decReg.isLoadInd) {
        // nothing to be done here
      }
      when (decReg.isStoreInd) {
        dataMem.write(effAddrWord, accu)
      }
    }

  }

  exit := RegNext(decReg.exit)
}

object LerosTwoStates extends App {
  (new chisel3.stage.ChiselStage).emitVerilog(new LerosTwoStates(32, 10, args(0), true), Array("--target-dir", "generated"))
}