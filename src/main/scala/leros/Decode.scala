package leros

import chisel3._
import chisel3.util._

import leros.shared.Constants._
import leros.Types._

class DecodeOut extends Bundle {
  val enaMask = UInt(4.W) // should replace ena
  val op = UInt()
  val isRegOpd = Bool()
  val isStore = Bool()
  val isStoreInd = Bool()
  val isLoadInd = Bool()
  val isLoadIndB = Bool()
  val isLoadIndH = Bool()
  val isLoadAddr = Bool()
  val enahi = Bool()
  val enah2i = Bool()
  val enah3i = Bool()
  val nosext = Bool()
  val exit = Bool()
}

object DecodeOut {
  def default: DecodeOut = {
    val v = Wire(new DecodeOut)
    v.enaMask := "b0000".U
    v.op := nop
    v.isRegOpd := false.B
    v.isStore := false.B
    v.isStoreInd := false.B
    v.isLoadInd := false.B
    v.isLoadIndB := false.B
    v.isLoadIndH := false.B
    v.isLoadAddr := false.B
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
      d.op := add
      d.enaMask := "b1111".U
      d.isRegOpd := true.B
    }
    is(ADDI.U) {
      d.op := add
      d.enaMask := "b1111".U
    }
    is(SUB.U) {
      d.op := sub
      d.enaMask := "b1111".U
      d.isRegOpd := true.B
    }
    is(SUBI.U) {
      d.op := sub
      d.enaMask := "b1111".U
    }
    is(SHR.U) {
      d.op := shr
      d.enaMask := "b1111".U
    }
    is(LD.U) {
      d.op := ld
      d.enaMask := "b1111".U
      d.isRegOpd := true.B
    }
    is(LDI.U) {
      d.op := ld
      d.enaMask := "b1111".U
    }
    is(AND.U) {
      d.op := and
      d.enaMask := "b1111".U
      d.isRegOpd := true.B
    }
    is(ANDI.U) {
      d.op := and
      d.enaMask := "b1111".U
      d.nosext := true.B
    }
    is(OR.U) {
      d.op := or
      d.enaMask := "b1111".U
      d.isRegOpd := true.B
    }
    is(ORI.U) {
      d.op := or
      d.enaMask := "b1111".U
      d.nosext := true.B
    }
    is(XOR.U) {
      d.op := xor
      d.enaMask := "b1111".U
      d.isRegOpd := true.B
    }
    is(XORI.U) {
      d.op := xor
      d.enaMask := "b1111".U
      d.nosext := true.B
    }
    is(LDHI.U) {
      d.op := ld
      d.enaMask := "b1111".U
      d.enahi := true.B
    }
    // Following only useful for 32-bit Leros
    is(LDH2I.U) {
      d.op := ld
      d.enaMask := "b1111".U
      d.enah2i := true.B
    }
    is(LDH3I.U) {
      d.op := ld
      d.enaMask := "b1111".U
      d.enah3i := true.B
    }
    is (ST.U) {
      d.isStore := true.B
    }
    is (LDADDR.U) {
      d.isLoadAddr := true.B
    }
    is (LDIND.U) {
      d.isLoadInd := true.B
      d.op := ld
      d.enaMask := "b1111".U
    }
    is (LDINDBU.U) {
      d.isLoadInd := true.B
      d.isLoadIndB := true.B
      d.op := ld
      d.enaMask := "b1111".U
    }
    // TODO halfword
    is (STIND.U) {
      d.isStoreInd := true.B
    }
    is (STINDB.U) {
      // TODO byte enable
      d.isStoreInd := true.B
    }
    is(SCALL.U) {
      d.exit := true.B
    }
  }
  io.dout := d
}
