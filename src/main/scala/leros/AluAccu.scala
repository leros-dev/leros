package leros

import chisel3._
import chisel3.util._

import leros.Types._

object Types {
  val nop :: add :: sub :: and :: or :: xor :: ld :: shr :: Nil = Enum(8)
}

/**
 * Leros ALU including the accumulator register.
 *
 * @param size
 */
class AluAccu(size: Int) extends Module {
  val io = IO(new Bundle {
    val op = Input(UInt(3.W))
    val din = Input(UInt(size.W))
    val enaMask = Input(UInt(4.W))
    val enaByte = Input(Bool())
    val off = Input(UInt(2.W))
    val accu = Output(UInt(size.W))
  })

  val accuReg = RegInit(0.U(size.W))

  val op = io.op
  val a = accuReg
  val b = io.din
  val res = WireDefault(a)

  switch(op) {
    is(nop) {
      res := a
    }
    is(add) {
      res := a + b
    }
    is(sub) {
      res := a - b
    }
    is(and) {
      res := a & b
    }
    is(or) {
      res := a | b
    }
    is(xor) {
      res := a ^ b
    }
    is(shr) {
      res := a >> 1
    }
    is(ld) {
      res := b
    }
  }

  val byte = WireDefault(res(7, 0))
  when(io.off === 1.U) {
    byte := res(15, 8)
  }.elsewhen(io.off === 2.U) {
    byte := res(23, 16)
  }.elsewhen(io.off === 3.U) {
    byte := res(31, 24)
  }
  // printf("%d\n", io.off)

  // TODO: find the conversion in Chisel and document it also in the Chisel book
  val mask = Wire(Vec(4, Bool()))
  for (i <- 0 until 4) mask(i) := io.enaMask(i)

  // Workaround for missing subword assignments
  class Split extends Bundle {
    val bytes = Vec(4, UInt(8.W))
  }

  val split = Wire(new Split())
  for (i <- 0 until 4) {
    split.bytes(i) := Mux(mask(i), res(8 * i + 7, 8 * i), accuReg(8 * i + 7, 8 * i))
  }

  when(io.enaByte & io.enaMask.andR) {
    // should be constructed out of the ALU
    accuReg := 0.U ## byte
  }.otherwise {
    accuReg := split.asUInt
  }

  io.accu := accuReg
}
