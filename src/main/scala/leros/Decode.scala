package leros

import chisel3._
import chisel3.util._

import leros.shared.Constants._
import leros.Types._

class DecodeOut extends Bundle {
  val ena = Bool()
  val func = UInt()
  val imm = Bool()
  val enahi = Bool()
  val enah2i = Bool()
  val enah3i = Bool()
  val nosext = Bool()
  val exit = Bool()
}

object DecodeOut {
  def default: DecodeOut = {
    val v = Wire(new DecodeOut)
    v.ena := false.B
    v.func := nop
    v.imm := false.B
    v.enahi := false.B
    v.enah2i := false.B
    v.enah3i := false.B
    v.nosext := false.B
    v.exit := false.B
    v
  }
}

class Decode() extends Module {
  val io = IO(new Bundle {
    val din = Input(UInt(8.W))
    val dout = Output(new DecodeOut)
  })

  val d = DecodeOut.default

  // Branch uses only 4 bits for decode
  val isBranch = WireDefault(false.B)
  /* this is broken, why?
  switch (io.din >> 4.U) {
    is (BR.U >> 4.U) { isBranch := true.B }
    is (BRZ.U >> 4.U) { isBranch := true.B }
    is (BRNZ.U >> 4.U) { isBranch := true.B }
    is (BRP.U >> 4.U) { isBranch := true.B }
    is (BRN.U >> 4.U) { isBranch := true.B }
  }
   */
  def mask(i: Int) = ((i >> 4) & 0x0f).asUInt

  val field = io.din(7, 4)
  when (field === mask(BR)) { isBranch := true.B }
  when (field === mask(BRZ)) { isBranch := true.B }
  when (field === mask(BRNZ)) { isBranch := true.B }
  when (field === mask(BRP)) { isBranch := true.B }
  when (field === mask(BRN)) { isBranch := true.B }

  val instr = Mux(isBranch, io.din & BRANCH_MASK.U, io.din)

  switch(instr) {
    is(ADD.U) {
      d.func := add
      d.ena := true.B
    }
    is(ADDI.U) {
      d.func := add
      d.imm := true.B
      d.ena := true.B
    }
    is(SUB.U) {
      d.func := sub
      d.ena := true.B
    }
    is(SUBI.U) {
      d.func := sub
      d.imm := true.B
      d.ena := true.B
    }
    is(SHR.U) {
      d.func := shr
      d.ena := true.B
    }
    is(LD.U) {
      d.func := ld
      d.ena := true.B
    }
    is(LDI.U) {
      d.func := ld
      d.imm := true.B
      d.ena := true.B
    }
    is(AND.U) {
      d.func := and
      d.ena := true.B
    }
    is(ANDI.U) {
      d.func := and
      d.imm := true.B
      d.ena := true.B
      d.nosext := true.B
    }
    is(OR.U) {
      d.func := or
      d.ena := true.B
    }
    is(ORI.U) {
      d.func := or
      d.imm := true.B
      d.ena := true.B
      d.nosext := true.B
    }
    is(XOR.U) {
      d.func := xor
      d.ena := true.B
    }
    is(XORI.U) {
      d.func := xor
      d.imm := true.B
      d.ena := true.B
      d.nosext := true.B
    }
    is(LDHI.U) {
      d.func := ld
      d.imm := true.B
      d.ena := true.B
      d.enahi := true.B
    }
    // Following only useful for 32-bit Leros
    is(LDH2I.U) {
      d.func := ld
      d.imm := true.B
      d.ena := true.B
      d.enah2i := true.B
    }
    is(LDH3I.U) {
      d.func := ld
      d.imm := true.B
      d.ena := true.B
      d.enah3i := true.B
    }
    is(SCALL.U) {
      d.exit := true.B
    }
  }
  io.dout := d
}
