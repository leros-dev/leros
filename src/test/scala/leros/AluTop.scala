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

  val x = RegNext(RegNext(RegNext(io.din)))
  val y = RegNext(x)

  val alu = Module(new Alu(size))
  alu.io.din := x
  alu.io.decin.func := y
  alu.io.decin.ena := y(10)

  io.dout := RegNext(RegNext(alu.io.dout))
}
object AluTop extends App {
  Driver.execute(Array("--target-dir", "generated"), () => new AluTop(32))
}