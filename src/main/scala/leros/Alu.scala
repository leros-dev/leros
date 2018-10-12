package leros

import leros.Types._

import chisel3._
import chisel3.util._

/**
  * ALU including the accumulator register.
  *
  * @param size
  */
class Alu(size: Int) extends Module {
  val io = IO(new Bundle {
    val decin = Input(new DecodeOut)
    val din = Input(UInt(size.W))
    val dout = Output(UInt(32.W))
  })

  val accuReg = RegInit(0.U(size.W))

  val funcReg = RegNext(io.decin.func)
  // Disable accu on reset to avoid executing the first instruction twice (visible during reset).
  val enaReg = RegInit(false.B)
  enaReg := io.decin.ena

  val res = Wire(UInt())
  res := 0.U(size.W)

  // TODO: decide where the pipeline registers are placed
  // now we have a mix between here for decode, outside for operand
  val op = io.din.asUInt
  switch(funcReg) {
    is(add) {
      res := accuReg + op
    }
    is(sub) {
      res := accuReg - op
    }
    is(and) {
      res := accuReg & op
    }
    is(or) {
      res := accuReg | op
    }
    is(xor) {
      res := accuReg ^ op
    }
    is (shr) {
      res := accuReg >> 1
    }
    is(ld) {
      res := op
    }
  }
  when (enaReg) {
    accuReg := res
  }

}

/**
  * Dummy top level for fmax experiments in an FPGA.
  * Should this be in test?
  * @param size
  */
class AluTop(size: Int) extends Module {
  val io = IO(new Bundle {
    val din = Input(UInt(size.W))
    val dout = Output(UInt(size.W))
  })

  val x = RegNext(io.din)
  val y = RegNext(x)

  val alu = Module(new Alu(size))
  alu.io.din := x
  alu.io.decin.func := y
  alu.io.decin.ena := y(10)
}

object Alu extends App {
  Driver.execute(Array("--target-dir", "generated"), () => new AluTop(32))
}