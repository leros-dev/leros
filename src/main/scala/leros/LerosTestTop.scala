/*
 * Leros, a Tiny Microprocessor
 *
 * Author: Martin Schoeberl (martin@jopdesign.com)
 */

package leros

import chisel3._
import chisel3.util.experimental.BoringUtils

class Debug(size: Int, memAddrWidth:Int) extends Bundle {
  val accu = Output(UInt(size.W))
  val pc = Output(UInt(memAddrWidth.W))
  val instr = Output(UInt(16.W))
  val exit = Output(Bool())
}

/**
  * Leros top level for testing.
  */
class LerosTestTop(prog: String, size: Int = 32, memAddrWidth: Int = 8) extends Module {
  val io = IO(new Bundle {
    // val dout = Output(UInt(32.W))
    val dbg = new Debug(size, memAddrWidth)
    val led = Output(UInt(8.W))
  })
  val lerosTop = Module(new LerosTop(prog))
  io.led := lerosTop.io.led

  // Boring Utils for debugging
  io.dbg.accu := DontCare
  io.dbg.pc := DontCare
  io.dbg.instr := DontCare
  io.dbg.exit := DontCare
  BoringUtils.bore(lerosTop.leros.accu, Seq(io.dbg.accu))
  BoringUtils.bore(lerosTop.leros.pcReg, Seq(io.dbg.pc))
  BoringUtils.bore(lerosTop.leros.instr, Seq(io.dbg.instr))
  BoringUtils.bore(lerosTop.leros.exit, Seq(io.dbg.exit))
}


