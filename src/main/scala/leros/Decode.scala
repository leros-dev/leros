package leros

import chisel3._
import chisel3.util._

import leros.shared.Constants._

class DecodeOut extends Bundle {
  val operand = UInt(32.W)
  val enaMask = UInt(4.W)
  val op = UInt()
  val off = SInt(10.W)
  val brOff = SInt(12.W)
  val isRegOpd = Bool()
  val useDecOpd = Bool()
  val isStore = Bool()
  val isStoreInd = Bool()
  val isStoreIndB = Bool()
  val isStoreIndH = Bool()
  val isLoadInd = Bool()
  val isLoadIndB = Bool()
  val isLoadIndH = Bool()
  val isDataAccess = Bool()
  val isLoadAddr = Bool()
  val isBranch = Bool()
  val brType = UInt(4.W)
  val exit = Bool()
}

object DecodeOut {

  val MaskNone = "b0000".U
  val MaskAll = "b1111".U

  def default: DecodeOut = {
    val v = Wire(new DecodeOut)
    v.operand := 0.U
    v.enaMask := MaskNone
    v.op := nop.U
    v.off := 0.S
    v.brOff := 0.S
    v.isRegOpd := false.B
    v.useDecOpd := false.B
    v.isStore := false.B
    v.isStoreInd := false.B
    v.isStoreIndB := false.B
    v.isStoreIndH := false.B
    v.isLoadInd := false.B
    v.isLoadIndB := false.B
    v.isLoadIndH := false.B
    v.isDataAccess := false.B
    v.isLoadAddr := false.B
    v.isBranch := false.B
    v.brType := 0.U
    v.exit := false.B
    v
  }
}

class Decode() extends Module {
  val io = IO(new Bundle {
    val din = Input(UInt(16.W))
    val dout = Output(new DecodeOut)
  })

  import DecodeOut._

  val d = DecodeOut.default

  // Branch uses only 4 bits for decode
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
  when (field === mask(BR)) { d.isBranch := true.B }
  when (field === mask(BRZ)) { d.isBranch := true.B }
  when (field === mask(BRNZ)) { d.isBranch := true.B }
  when (field === mask(BRP)) { d.isBranch := true.B }
  when (field === mask(BRN)) { d.isBranch := true.B }

  val instr = io.din
  d.brType := field
  d.brOff := instr(11, 0).asSInt

  val noSext = WireDefault(false.B)
  val sigExt = Wire(SInt(32.W))
  sigExt := instr(7, 0).asSInt
  d.operand := sigExt.asUInt
  when (noSext) { d.operand := instr(7, 0) }

  switch(instr(15, 8)) {
    is(ADD.U) {
      d.op := add.U
      d.enaMask := MaskAll
      d.isRegOpd := true.B
    }
    is(ADDI.U) {
      d.op := add.U
      d.enaMask := MaskAll
      d.useDecOpd := true.B
    }
    is(SUB.U) {
      d.op := sub.U
      d.enaMask := MaskAll
      d.isRegOpd := true.B
    }
    is(SUBI.U) {
      d.op := sub.U
      d.enaMask := MaskAll
      d.useDecOpd := true.B
    }
    is(SRA.U) {
      d.op := sra.U
      d.enaMask := MaskAll
    }
    is(LD.U) {
      d.op := ld.U
      d.enaMask := MaskAll
      d.isRegOpd := true.B
    }
    is(LDI.U) {
      d.op := ld.U
      d.enaMask := MaskAll
      d.useDecOpd := true.B
    }
    is(AND.U) {
      d.op := and.U
      d.enaMask := MaskAll
      d.isRegOpd := true.B
    }
    is(ANDI.U) {
      d.op := and.U
      d.enaMask := MaskAll
      noSext := true.B
      d.useDecOpd := true.B
    }
    is(OR.U) {
      d.op := or.U
      d.enaMask := MaskAll
      d.isRegOpd := true.B
    }
    is(ORI.U) {
      d.op := or.U
      d.enaMask := MaskAll
      noSext := true.B
      d.useDecOpd := true.B
    }
    is(XOR.U) {
      d.op := xor.U
      d.enaMask := MaskAll
      d.isRegOpd := true.B
    }
    is(XORI.U) {
      d.op := xor.U
      d.enaMask := MaskAll
      noSext := true.B
      d.useDecOpd := true.B
    }
    is(LDHI.U) {
      d.op := ld.U
      d.enaMask := "b1110".U
      d.operand := sigExt(23, 0).asUInt ## 0.U(8.W)
      d.useDecOpd := true.B
    }
    is(LDH2I.U) {
      d.op := ld.U
      d.enaMask := "b1100".U
      d.operand := sigExt(15, 0).asUInt ## 0.U(16.W)
      d.useDecOpd := true.B
    }
    is(LDH3I.U) {
      d.op := ld.U
      d.enaMask := "b1000".U
      d.operand := instr(7, 0) ## 0.U(24.W)
      d.useDecOpd := true.B
    }
    is (ST.U) {
      d.isStore := true.B
    }
    is (LDADDR.U) {
      d.isLoadAddr := true.B
    }
    is (LDIND.U) {
      d.isDataAccess := true.B
      d.isLoadInd := true.B
      d.op := ld.U
      d.enaMask := MaskAll
    }
    is (LDINDB.U) {
      d.isDataAccess := true.B
      d.isLoadIndB := true.B
      d.op := ld.U
      d.enaMask := MaskAll
    }
    is(LDINDH.U) {
      d.isDataAccess := true.B
      d.isLoadIndH := true.B
      d.op := ld.U
      d.enaMask := MaskAll
    }
    is (STIND.U) {
      d.isDataAccess := true.B
      d.isStoreInd := true.B
    }
    is (STINDB.U) {
      d.isDataAccess := true.B
      d.isStoreIndB := true.B
    }
    is(STINDH.U) {
      d.isDataAccess := true.B
      d.isStoreIndH := true.B
    }
    is(SCALL.U) {
      d.exit := true.B
    }
  }

  // TODO: here is code duplication, should be merged with code above
  val instrSignExt = Wire(SInt(32.W))
  instrSignExt := instr(7, 0).asSInt
  val off = Wire(SInt(10.W))
  off := instrSignExt << 2 // default word
  when(d.isLoadIndH || d.isStoreIndH) {
    off := instrSignExt << 1
  }.elsewhen(d.isLoadIndB || d.isStoreIndB) {
    off := instrSignExt
  }
  d.off := off

  io.dout := d
}
