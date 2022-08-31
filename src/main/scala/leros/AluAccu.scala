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
    val ena = Input(Bool())
    val enaByte = Input(Bool())
    val enaHalf = Input(Bool())
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
    is (shr) {
      res := a >> 1
    }
    is(ld) {
      res := b
    }
  }

  val byte = WireDefault(res(7, 0))
  when (io.off === 1.U) {
    byte := res(15, 8)
  } .elsewhen(io.off === 2.U) {
    byte := res(23, 16)
  } .elsewhen(io.off === 3.U) {
    byte := res(31, 24)
  }
  // printf("%d\n", io.off)

  when (io.ena) {
    when (io.enaByte) {
      accuReg := 0.U ## byte
    } .elsewhen (io.enaHalf) {
      accuReg := 0.U ## res(15, 0)
    } .otherwise {
      accuReg := res
    }
  }

  io.accu := accuReg
}
