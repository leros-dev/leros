/*
 * Leros, a Tiny Microprocessor
 *
 * Author: Martin Schoeberl (martin@jopdesign.com)
 */

package leros

import chisel3._
import chisel3.util._
import chisel3.experimental.ChiselEnum

import leros.util._

class Debug extends Bundle {
  val acc = Output(UInt())
  val pc = Output(UInt())
  val instr = Output(UInt())
  val exit = Output(Bool())
}


object State extends ChiselEnum {
  val feDec, exe = Value
}

/**
  * Leros top level.
  *
  * For now do a first sequential implementation.
  * Later have Leros as abstract class with base state and several implementations (different pipelines).
  */
class Leros(size: Int, memSize: Int, prog: String, fmaxReg: Boolean) extends Module {
  val io = IO(new Bundle {
    val dout = Output(UInt(32.W))
    val dbg = new Debug
  })

  import State._

  val alu = Module(new AluAccu(size))

  val accu = alu.io.accu

  // The main architectural state
  val pcReg = RegInit(0.U(memSize.W))
  val addrReg = RegInit(0.U(memSize.W))

  val stateReg = RegInit(feDec)

  switch (stateReg) {
    is (feDec) { stateReg := exe }
    is (exe) { stateReg := feDec }
  }

  val pcNext = WireDefault(pcReg + 1.U)

  // Instruction memory with an address register that is reset to 0
  val mem = Module(new InstrMem(memSize, prog))
  mem.io.addr := pcNext
  val instr = mem.io.instr

  val decReg = RegInit(DecodeOut.default)
  val opdReg = RegInit(0.U(size.W))


  val registerMem = SyncReadMem(256, UInt(32.W))
  val registerRead = registerMem.read(instr(15, 0))

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

  // printf("accu: %x address register: %x\n", accu, addrReg)

  val exit = RegInit(false.B)
  exit := RegNext(decReg.exit)

  io.dout := 42.U

  if (fmaxReg) {
    io.dbg.acc := RegNext(RegNext((accu)))
    io.dbg.pc := RegNext(RegNext((pcReg)))
    io.dbg.instr := RegNext(RegNext((instr)))
    io.dbg.exit := RegNext(RegNext((exit)))
  } else {
    io.dbg.acc := ((accu))
    io.dbg.pc := ((pcReg))
    io.dbg.instr := ((instr))
    io.dbg.exit := ((exit))
  }
}

object Leros extends App {
    (new chisel3.stage.ChiselStage).emitVerilog(new Leros(32, 10, args(0), true), Array("--target-dir", "generated"))
}
