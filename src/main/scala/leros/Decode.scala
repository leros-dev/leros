package leros

import chisel3._
import chisel3.util._

import leros.shared.Constants._
import leros.State._

class DecodeOut extends Bundle {
  val operand = UInt(32.W)
  val enaMask = UInt(4.W)
  val op = UInt()
  val off = SInt(10.W)
  val brOff = SInt(12.W)
  val isRegOpd = Bool()
  val useDecOpd = Bool()
  val nextState = State()
  val enaByte = Bool()
  val enaHalf = Bool()
  val isDataAccess = Bool()
  val brType = UInt(4.W)
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
    v.nextState := init
    v.enaByte := false.B
    v.enaHalf := false.B
    v.isDataAccess := false.B
    v.brType := 0.U
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
  when (field === mask(BR) || field === mask(BRZ) || field === mask(BRNZ) ||
    field === mask(BRP) || field === mask(BRN)) {
    d.nextState := branch
  }

  val instr = io.din
  d.brType := field
  d.brOff := instr(11, 0).asSInt

  val noSext = WireDefault(false.B)
  val sigExt = Wire(SInt(32.W))
  sigExt := instr(7, 0).asSInt
  d.operand := sigExt.asUInt
  when (noSext) { d.operand := instr(7, 0) }

  // TODO: here is code duplication, should be merged with code above
  val instrSignExt = Wire(SInt(32.W))
  instrSignExt := instr(7, 0).asSInt
  val off = Wire(SInt(10.W))
  off := instrSignExt << 2 // default word

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
      d.nextState := store
    }
    is (LDADDR.U) {
      d.nextState := loadAddr
    }
    is (LDIND.U) {
      d.nextState := loadInd
      d.isDataAccess := true.B
      d.op := ld.U
      d.enaMask := MaskAll
    }
    is (LDINDB.U) {
      d.nextState := loadInd
      d.enaByte := true.B
      d.isDataAccess := true.B
      d.op := ld.U
      d.enaMask := MaskAll
      off := instrSignExt
    }
    is(LDINDH.U) {
      d.nextState := loadInd
      d.enaHalf := true.B
      d.isDataAccess := true.B
      d.op := ld.U
      d.enaMask := MaskAll
      off := instrSignExt << 1
    }
    is (STIND.U) {
      d.nextState := storeInd
      d.isDataAccess := true.B
    }
    is (STINDB.U) {
      d.nextState := storeIndB
      d.isDataAccess := true.B
      off := instrSignExt
    }
    is(STINDH.U) {
      d.nextState := storeIndH
      d.isDataAccess := true.B
      off := instrSignExt << 1
    }
    is(JAL.U) {
      d.nextState := jal
    }
    is(SCALL.U) {
      d.nextState := scall
    }
  }


  d.off := off

  io.dout := d
}
