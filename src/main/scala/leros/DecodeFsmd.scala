package leros

import chisel3._
import chisel3.experimental.ChiselEnum
import chisel3.util._
import leros.Types._
import leros.shared.Constants._

object StateFsmd extends ChiselEnum {
  val sFeDec, exe, sAlu, sAluI = Value
}

import StateFsmd._

class DecodeFsmdOut extends Bundle {
  val next = StateFsmd()
  val operand = UInt(32.W)
  val enaMask = UInt(4.W)

  val op = UInt()
  val isStore = Bool()
  val isStoreInd = Bool()
  val isLoadInd = Bool()
  val isLoadIndB = Bool()
  val isLoadIndH = Bool()
  val isLoadAddr = Bool()
  val exit = Bool()
}

object DecodeFsmdOut {

  val MaskNone = "b0000".U
  val MaskAll = "b1111".U

  def default: DecodeFsmdOut = {
    val v = Wire(new DecodeFsmdOut)
    v.next := exe
    v.operand := 0.U
    v.enaMask := MaskNone
    v.op := nop

    v.isStore := false.B
    v.isStoreInd := false.B
    v.isLoadInd := false.B
    v.isLoadIndB := false.B
    v.isLoadIndH := false.B
    v.isLoadAddr := false.B
    v.exit := false.B
    v
  }
}

class DecodeFsmd() extends Module {
  val io = IO(new Bundle {
    val din = Input(UInt(16.W))
    val dout = Output(new DecodeFsmdOut)
  })

  import DecodeFsmdOut._

  val d = DecodeFsmdOut.default

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

  val field = io.din(15, 12)
  when (field === mask(BR)) { isBranch := true.B }
  when (field === mask(BRZ)) { isBranch := true.B }
  when (field === mask(BRNZ)) { isBranch := true.B }
  when (field === mask(BRP)) { isBranch := true.B }
  when (field === mask(BRN)) { isBranch := true.B }

  val instr = Mux(isBranch, io.din & (BRANCH_MASK.U << 8), io.din)

  val noSext = WireDefault(false.B)
  val sigExt = Wire(SInt(32.W))
  sigExt := instr(7, 0).asSInt
  d.operand := sigExt.asUInt
  when (noSext) { d.operand := instr(7, 0) }
  // printf("instr: %x, sigExt: %x, d.operand: %x\n", instr, sigExt, d.operand)

  switch(instr(15, 8)) {
    is(ADD.U) {
      d.next := sAlu
      d.op := add
      d.enaMask := MaskAll
    }
    is(ADDI.U) {
      d.next := sAluI
      d.op := add
      d.enaMask := MaskAll
    }
    is(SUB.U) {
      d.next := sAlu
      d.op := sub
      d.enaMask := MaskAll
    }
    is(SUBI.U) {
      d.next := sAluI
      d.op := sub
      d.enaMask := MaskAll
    }
    is(SHR.U) {
      d.op := shr
      d.enaMask := MaskAll
    }
    is(LD.U) {
      d.next := sAlu
      d.op := ld
      d.enaMask := MaskAll
    }
    is(LDI.U) {
      d.next := sAluI
      d.op := ld
      d.enaMask := MaskAll
    }
    is(AND.U) {
      d.next := sAlu
      d.op := and
      d.enaMask := MaskAll
    }
    is(ANDI.U) {
      d.next := sAluI
      d.op := and
      noSext := true.B
      d.enaMask := MaskAll
    }
    is(OR.U) {
      d.next := sAlu
      d.op := or
      d.enaMask := MaskAll
    }
    is(ORI.U) {
      d.op := or
      d.next := sAluI
      noSext := true.B
      d.enaMask := MaskAll
    }
    is(XOR.U) {
      d.next := sAlu
      d.op := xor
      d.enaMask := MaskAll
    }
    is(XORI.U) {
      d.op := xor
      d.next := sAluI
      noSext := true.B
      d.enaMask := MaskAll
    }
    is(LDHI.U) {
      d.op := ld
      d.next := sAluI
      d.enaMask := "b1110".U
      d.operand := sigExt(23, 0).asUInt ## 0.U(8.W)
    }
    // Following only useful for 32-bit Leros
    is(LDH2I.U) {
      d.op := ld
      d.next :=sAluI
      d.enaMask := "b1100".U
      d.operand := sigExt(15, 0).asUInt ## 0.U(16.W)
    }
    is(LDH3I.U) {
      d.op := ld
      d.next :=sAluI
      d.enaMask := "b1000".U
      d.operand := instr(7, 0) ## 0.U(24.W)
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
      d.enaMask := MaskAll
    }
    is (LDINDBU.U) {
      d.isLoadInd := true.B
      d.isLoadIndB := true.B
      d.op := ld
      d.enaMask := MaskAll
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
