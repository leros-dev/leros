/*
 * Leros, a Tiny Microprocessor
 *
 * Author: Martin Schoeberl (martin@jopdesign.com)
 */

package leros

import chisel3._
import chisel3.util._
import chisel3.experimental.ChiselEnum

class Debug extends Bundle {
  val acc = Output(UInt())
  val pc = Output(UInt())
  val instr = Output(UInt())
  val exit = Output(Bool())
}

/**
  * Leros top level as abstract class.
  * Base class with base state for several different implementations (different pipelines).
  */
abstract class Leros(size: Int, memSize: Int, prog: String, fmaxReg: Boolean) extends Module {
  val io = IO(new Bundle {
    val dout = Output(UInt(32.W))
    val dbg = new Debug
  })

  val alu = Module(new AluAccu(size))

  val accu = alu.io.accu

  // The main architectural state
  val pcReg = RegInit(0.U(memSize.W))
  val addrReg = RegInit(0.U(memSize.W))

  val pcNext = WireDefault(pcReg + 1.U)

  // Instruction memory with an address register that is reset to 0
  val mem = Module(new InstrMem(memSize, prog))
  mem.io.addr := pcNext
  val instr = mem.io.instr
  // the following should go into Decode
  // is not used any more in FSMD version
  val instrSignExt = Wire(SInt(32.W))
  instrSignExt := instr(7, 0).asSInt

  val instrLowReg = RegNext(instr(7, 0))

  // Data memory
  // TODO: shall be byte write addressable
  val dataMem = SyncReadMem(1 << memSize, UInt(32.W))

  // printf("accu: %x address register: %x\n", accu, addrReg)

  val exit = RegInit(false.B)

  io.dout := 42.U

  if (fmaxReg) {
    io.dbg.acc := RegNext(RegNext((accu)))
    io.dbg.pc := RegNext(RegNext((pcReg)))
    io.dbg.instr := RegNext(RegNext((instr)))
    io.dbg.exit := RegNext(RegNext((exit)))
  } else {
    io.dbg.acc := accu
    io.dbg.pc := pcReg
    io.dbg.instr := instr
    io.dbg.exit := exit
  }
}


