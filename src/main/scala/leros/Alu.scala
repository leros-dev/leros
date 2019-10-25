package leros

import chisel3._
import chisel3.util._

import leros.Types._

class Alu(size: Int) extends Module {
  val io = IO(new Bundle {
    val op = Input(UInt(3.W))
    val a = Input(SInt(size.W))
    val b = Input(SInt(size.W))
    val result = Output(SInt(size.W))
  })

  val op = io.op
  val a = io.a
  val b = io.b
  val res = WireInit(0.S(size.W))

  switch(op) {
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
      // the following does NOT result in an unsigned shift
      // res := (a.asUInt >> 1).asSInt
      // maybe it would be >> 1.U?
      // work around
      res := (a >> 1) & 0x7fffffff.S
    }
    is(ld) {
      res := b
    }
  }

  io.result := res
}



/**
  * ALU including the accumulator register.
  *
  * @param size
  */
/*
class AluOpt(size: Int) extends Module {
  val io = IO(new Bundle {
    val decin = Input(new DecodeOut)
    val din = Input(UInt(size.W))
    val dout = Output(UInt(size.W))
  })

  val accuReg = RegInit(0.U(size.W))

  // TODO: decide where the pipeline registers are placed
  // now we have a mix between here for the decode and outside for operand

  val sel = Wire(UInt(2.W))
  sel := 0.U

  switch(io.decin.func) {
    is(add) {
      // res := accuReg + op
    }
    is(sub) {
      // res := accuReg - op
    }
    is(and) {
      // res := accuReg & op
      sel := 0.U
    }
    is(or) {
      // res := accuReg | op
      sel := 1.U
    }
    is(xor) {
      // res := accuReg ^ op
      sel := 2.U
    }
    is (shr) {
      // res := accuReg >> 1
    }
    is(ld) {
      // res := op
      sel := 3.U
    }
  }

  val selReg = RegNext(sel)

  val funcReg = RegNext(io.decin.func)
  // Disable accu on reset to avoid executing the first instruction twice (visible during reset).
  val enaReg = RegInit(false.B)
  enaReg := io.decin.ena

  val res = Wire(UInt())
  res := 0.U(size.W)

  val op = io.din.asUInt

  // This generates 2 LEs per bit
  accuReg := MuxLookup(selReg, accuReg & op, Array(1.U -> (accuReg | op), 2.U -> (accuReg ^ op), 3.U -> op))

//  def logic(sel: UInt, a: UInt, b: UInt = {
//    sel(0) // TODO: write logic function
//  }

  // Mux(selReg, accuReg | op, accuReg & op)

  io.dout := accuReg
}

*/

class AluBase(size: Int) extends Module {
  val io = IO(new Bundle {
    val decin = Input(new DecodeOut)
    val din = Input(UInt(size.W))
    val dout = Output(UInt(size.W))
  })

  val alu = Module(new Alu(size))
  alu.io <> io
}