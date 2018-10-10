/*
 * Leros, a Tiny Microprocessor
 *
 * Author: Martin Schoeberl (martin@jopdesign.com)
 */

package leros

import leros.util._

import chisel3._

class Debug extends Bundle {
  val acc = Output(UInt())
  val pc = Output(UInt())
  val opc = Output(UInt())
}

/**
  * Leros top level
  */
class Leros(size: Int, memSize: Int) extends Module {
  val io = IO(new Bundle {
    val dout = Output(UInt(32.W))
    val dbg = new Debug
  })

  // The main architectural state
  val accu = RegInit(0.U(size.W))
  val pc = RegInit(0.U(memSize.W))
  val ar = RegInit(0.U(memSize.W))

  val progMem = VecInit(util.Assembler.getProgram().map(_.asUInt(16.W)))

  val instr = progMem(pc)

  val opcode = instr(15, 8)

  pc := pc + 1.U

  val exit = RegInit(false.B)

  println("Generating Leros")
  io.dout := 42.U

  io.dbg.acc := accu
  io.dbg.pc := pc
  io.dbg.opc := opcode
}

object Leros extends App {

  Driver.execute(Array("--target-dir", "generated"), () => new Leros(32, 10))
}
