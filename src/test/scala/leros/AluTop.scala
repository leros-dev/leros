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

  val alu = Module(new Alu(size))
  alu.io.a := a
  alu.io.b := b
  alu.io.op := op


  io.dout := RegNext(RegNext(alu.io.y))
}
object AluTop extends App {
  Driver.execute(Array("--target-dir", "generated"), () => new AluTop(32))
}