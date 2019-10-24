/*
 * Leros, a Tiny Microprocessor
 *
 * Author: Martin Schoeberl (martin@jopdesign.com)
 */

package leros

import chisel3._
import chisel3.util._

import leros.util._

object Types {
  val nop :: add :: sub :: and :: or :: xor :: ld :: shr :: Nil = Enum(8)
}


class Debug extends Bundle {
  val acc = Output(SInt())
  val pc = Output(UInt())
  val instr = Output(UInt())
  val exit = Output(Bool())
}

/**
  * Instruction memory.
  * Contains the register for using the on-chip ROM.
  * Uses Chisel synchronous reset to also execute the first instruction.
  *
  * FIXME: Verilog generation from Chisel results in logic, not in a ROM.
  */
class InstrMem(memSize: Int, prog: String) extends Module {
  val io = IO(new Bundle {
    val addr = Input(UInt(memSize.W))
    val instr = Output(UInt(16.W))
  })
  val progMem = VecInit(Assembler.getProgram(prog).map(_.asUInt(16.W)))
  val memReg = RegInit(0.U(memSize.W))
  memReg := io.addr
  io.instr := progMem(memReg)
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

  // The main architectural state
  val accuReg = RegInit(0.S(size.W))
  val pcReg = RegInit(0.U(memSize.W))
  val addrReg = RegInit(0.U(memSize.W))

  val pcNext = pcReg + 1.U
  pcReg := pcNext

  val mem = Module(new InstrMem(memSize, prog))
  mem.io.addr := pcNext
  val instr = mem.io.instr



  // Decode
  val dec = Module(new Decode())
  dec.io.din := instr(15, 8)
  val decout = dec.io.dout

  // Operand
  val operand = Wire(SInt(size.W))
  val op16sex = Wire(SInt(16.W))
  op16sex := instr(7, 0).asSInt
  val op24sex = Wire(SInt(24.W))
  op24sex := instr(7, 0).asSInt
  when(decout.nosext) {
    operand := (0.U(24.W) ## instr(7, 0)).asSInt // no sign extension
  } .elsewhen(decout.enahi) {
    operand := (op24sex.asUInt ## accuReg(7, 0)).asSInt
  } .elsewhen(decout.enah2i) {
    operand := (op16sex.asUInt ## accuReg(15, 0)).asSInt
  } .elsewhen(decout.enah3i) {
    operand := (instr(7, 0) ## accuReg(23, 0)).asSInt
  } .otherwise {
    operand := instr(7, 0).asSInt
  }


  val opReg = RegNext(operand)

  // TODO: decide where the pipeline registers are placed
  // now we have a mix between here for the decode and outside for operand

  val funcReg = RegNext(decout.func)
  val enaReg = RegInit(false.B)
  enaReg := decout.ena

  val alu = Module(new Alu(size))

  alu.io.op := funcReg
  alu.io.a := accuReg
  alu.io.b := opReg

  when (enaReg) {
    accuReg := alu.io.result
    printf("accu in: %x, accuReg: %x\n", alu.io.result, accuReg)
  }

  val exit = RegInit(false.B)
  exit := RegNext(decout.exit)

  println("Generating Leros")
  io.dout := 42.U

  if (fmaxReg) {
    io.dbg.acc := RegNext(RegNext((accuReg)))
    io.dbg.pc := RegNext(RegNext((pcReg)))
    io.dbg.instr := RegNext(RegNext((instr)))
    io.dbg.exit := RegNext(RegNext((exit)))
  } else {
    io.dbg.acc := ((accuReg))
    io.dbg.pc := ((pcReg))
    io.dbg.instr := ((instr))
    io.dbg.exit := ((exit))
  }
}

object Leros extends App {
  Driver.execute(Array("--target-dir", "generated"), () => new Leros(32, 10, args(0), true))
}
