package leros

import chisel3._

/**
  * Dummy top level for fmax experiments of the ALU in an FPGA.
  *
  * @param size
  */
class AluTop(size: Int) extends Module {
  val io = IO(new Bundle {
    val din = Input(UInt(size.W))
    val dout = Output(UInt(size.W))
  })

  val a = RegNext(RegNext(RegNext(io.din)))
  val b = RegNext(a)
  val op = RegNext(b)

  val alu = Module(new AluAccu(size))
  alu.io.din := b
  alu.io.op := op


  io.dout := RegNext(RegNext(alu.io.accu))
}
object AluTop extends App {
  throw new Exception("Adapt for new AluAccu")
  (new chisel3.stage.ChiselStage).emitVerilog(new AluTop(32), Array("--target-dir", "generated"))
}