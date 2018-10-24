package leros

import leros.Types._

import chisel3._
import chisel3.util._

/**
  * ALU including the accumulator register.
  * The simple implementation.
  *
  * @param size
  */
class AluSimple(size: Int) extends Module {
  val io = IO(new Bundle {
    val decin = Input(new DecodeOut)
    val din = Input(UInt(size.W))
    val dout = Output(UInt(size.W))
  })


  val accuReg = RegInit(0.U(size.W))

  // TODO: decide where the pipeline registers are placed
  // now we have a mix between here for the decode and outside for operand

  val funcReg = RegNext(io.decin.func)
  // Disable accu on reset to avoid executing the first instruction twice (visible during reset).
  val enaReg = RegInit(false.B)
  enaReg := io.decin.ena

  val res = Wire(UInt())
  res := 0.U(size.W)

  // TODO: mask bits out for branch decode

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

  io.dout := accuReg
}



/**
  * ALU including the accumulator register.
  *
  * @param size
  */
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

class Alu(size: Int) extends Module {
  val io = IO(new Bundle {
    val decin = Input(new DecodeOut)
    val din = Input(UInt(size.W))
    val dout = Output(UInt(size.W))
  })

  val alu = Module(new AluSimple(size))
  alu.io <> io
}