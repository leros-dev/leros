/*
 * Leros, a Tiny Microprocessor
 *
 * Author: Martin Schoeberl (martin@jopdesign.com)
 */

package leros

import chisel3._
import chisel3.util._
// Try our ChiselEnum
import chisel3.experimental._

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
class InstrMem(memAddrWidth: Int, prog: String) extends Module {
  val io = IO(new Bundle {
    val addr = Input(UInt(memAddrWidth.W))
    val instr = Output(UInt(16.W))
  })
  val progMem = VecInit(Assembler.getProgram(prog).map(_.asUInt(16.W)))
  val memReg = RegInit(0.U(memAddrWidth.W))
  memReg := io.addr
  io.instr := progMem(memReg)
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

  // The main architectural state
  val accuReg = RegInit(0.S(size.W))
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
  val opdReg = RegInit(0.S(size.W))


  // Register file (could share data memory)
  val registerMem = SyncReadMem(256, UInt(32.W))
  // read takes one clock cycle
  val registerRead = registerMem.read(instr(15, 0))

  // Data memory
  // TODO: shall be byte write addressable
  val dataMem = SyncReadMem(1 << memSize, UInt(32.W))
  val dataRead = dataMem.read(Mux(decReg.isLoadAddr, accuReg.asUInt, addrReg))

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

  // For now do a sequential version of Leros.
  // Later decide where the pipeline registers are placed.

  val alu = Module(new Alu(size))

  alu.io.op := decReg.func
  alu.io.a := accuReg
  // TODO: maybe the input should be unsigned?
  // Probably the accu should be UInt
  alu.io.b := Mux(decReg.isLoadInd, dataRead.asSInt, Mux(decReg.isRegOpd, registerRead.asSInt, opdReg))

  switch(stateReg) {
    is (feDec) {
      decReg := decout
      opdReg := operand
    }

    is (exe) {
      pcReg := pcNext
      when (decReg.ena) {
        accuReg := alu.io.result
      }
      when (decReg.isStore) {
        registerMem.write(opdReg(15, 0).asUInt, accuReg.asUInt)
      }
      when (decReg.isLoadAddr) {
        addrReg := accuReg.asUInt
      }

      // TODO
      when (decReg.isLoadInd) {
        // nothing to be done here
      }
      when (decReg.isStoreInd) {
        dataMem.write(addrReg, accuReg.asUInt())
      }
    }

  }

  printf("accu in: %x, accuReg: %x\n", alu.io.result, accuReg)
  printf("address register: %x\n", addrReg)

  val exit = RegInit(false.B)
  exit := RegNext(decReg.exit)

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
