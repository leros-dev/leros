/*
 * Leros, a Tiny Microprocessor
 *
 * Author: Martin Schoeberl (martin@jopdesign.com)
 */

package leros

import leros.util._

import chisel3._
import chisel3.util._

class Debug extends Bundle {
  val acc = Output(UInt())
  val pc = Output(UInt())
  val instr = Output(UInt())
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
  val accuReg = RegInit(0.U(size.W))
  val pcReg = RegInit(0.U(memSize.W))
  val addrReg = RegInit(0.U(memSize.W))

  val progMem = VecInit(util.Assembler.getProgram().map(_.asUInt(16.W)))

  val nop :: add :: sub :: and :: or :: xor :: ld :: Nil = Enum(7)

  val instr = progMem(pcReg)

  // Maybe decoding and sign extension into fetch
  // Play around with the pipeline registers when (1) more complete ALU and (2) longer programs (= block RAM)
  val opcode = instr(15, 8)
  val operand = Wire(SInt(size.W))
  operand := instr(7, 0).asSInt // sign extension
  // TODO: only sign extend when arithmetic
  val opReg = RegNext(operand)

  // Decode

  val funcReg = RegInit(nop)
  when (opcode === 0x09.U) {
    funcReg := add
  } .elsewhen(opcode === 0x0d.U) {
    funcReg := sub
  }

  val op = opReg.asUInt
  switch(funcReg) {
    is(add) { accuReg := accuReg + op }
    is(sub) { accuReg := accuReg - op }
    is(and) { accuReg := accuReg & op }
    is(or) { accuReg := accuReg | op }
    is(xor) { accuReg := accuReg ^ op }
    is(ld) { accuReg := op }
  }

  pcReg := pcReg + 1.U

  val exit = RegInit(false.B)

  println("Generating Leros")
  io.dout := 42.U

  io.dbg.acc := accuReg
  io.dbg.pc := pcReg
  io.dbg.instr := instr
}

object Leros extends App {
  Driver.execute(Array("--target-dir", "generated"), () => new Leros(32, 10))
}
