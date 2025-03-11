package leros

import chisel3._
import chisel3.util._
import leros.util.Assembler

class InstrMemIO(memAddrWidth: Int) extends Bundle {
  val addr = Input(UInt(memAddrWidth.W))
  val instr = Output(UInt(16.W))
}

/**
 * Instruction memory.
 * Contains the register for using the on-chip ROM.
 * Uses Chisel synchronous reset to also execute the first instruction.
 *
 * FIXME: Verilog generation from Chisel results in logic, not in a ROM.
 */
class InstrMem(memAddrWidth: Int, prog: String) extends Module {
  val io = IO(new InstrMemIO(memAddrWidth))
  val code = Assembler.getProgram(prog)
  assert(scala.math.pow(2, memAddrWidth) >= code.length, "Program too large")
  val progMem = VecInit(code.toIndexedSeq.map(_.asUInt(16.W)))
  val memReg = RegInit(0.U(memAddrWidth.W))
  memReg := io.addr
  val index = log2Ceil(code.length)
  io.instr := progMem(memReg(index - 1, 0))
}
