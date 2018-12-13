package leros

import chisel3._
import chisel3.util._

import leros.shared.Constants._
import leros.Types._

class DecodeOut extends Bundle {
  val ena = Bool()
  val func = UInt()
  val exit = Bool()
}

class Decode() extends Module {
  val io = IO(new Bundle {
    val din = Input(UInt(8.W))
    val dout = Output(new DecodeOut)
  })

  val f = WireInit(nop)
  val imm = WireInit(false.B)
  val ena = WireInit(false.B)

  io.dout.exit := false.B

  switch(io.din) {
    is(ADD.U) {
      f := add
      ena := true.B
    }
    is(ADDI.U) {
      f := add
      imm := true.B
      ena := true.B
    }
    is(SUB.U) {
      f := sub
      ena := true.B
    }
    is(SUBI.U) {
      f := sub
      imm := true.B
      ena := true.B
    }
    is(SHR.U) {
      f := shr
      ena := true.B
    }
    is(LD.U) {
      f := ld
      ena := true.B
    }
    is(LDI.U) {
      f := ld
      imm := true.B
      ena := true.B
    }
    is(AND.U) {
      f := and
      ena := true.B
    }
    is(ANDI.U) {
      f := and
      imm := true.B
      ena := true.B
    }
    is(OR.U) {
      f := or
      ena := true.B
    }
    is(ORI.U) {
      f := or
      imm := true.B
      ena := true.B
    }
    is(XOR.U) {
      f := xor
      ena := true.B
    }
    is(XORI.U) {
      f := xor
      imm := true.B
      ena := true.B
    }
    is(LDHI.U) {
      f := sub
      imm := true.B
      ena := true.B
    }
    // Following only useful for 32-bit Leros
    is(LDH2I.U) {
      f := sub
      imm := true.B
      ena := true.B
    }
    is(LDH3I.U) {
      f := sub
      imm := true.B
      ena := true.B
    }
    is(SCALL.U) {
      io.dout.exit := true.B
    }
  }
  io.dout.ena := ena
  io.dout.func := f
}