package leros

import chisel3._
import chisel3.util._
import chisel3.experimental.ChiselEnum

/**
 * Leros top level.
 *
 * Sequential implementation with two states.
 */
class Leros(size: Int, memAddrWidth: Int, prog: String, fmaxReg: Boolean) extends LerosBase(size, memAddrWidth, prog, fmaxReg) {

  val alu = Module(new AluAccu(size))

  val accu = alu.io.accu

  // The main architectural state
  val pcReg = RegInit(0.U(memAddrWidth.W))
  val addrReg = RegInit(0.U(memAddrWidth.W))

  val pcNext = WireDefault(pcReg + 1.U)

  // Instruction memory with an address register that is reset to 0
  val mem = Module(new InstrMem(memAddrWidth, prog))
  mem.io.addr := pcNext
  val instr = mem.io.instr
  // the following should probably go into Decode
  val instrSignExt = Wire(SInt(32.W))
  instrSignExt := instr(7, 0).asSInt

  val instrLowReg = RegNext(instr(7, 0))

  // Data memory
  // TODO: shall be byte write addressable
  val dataMem = Module(new DataMem((memAddrWidth)))

  // Register file memory
  val registerMem = SyncReadMem(256, UInt(32.W))

  val exit = RegInit(false.B)

  val outReg = RegInit(0.U(32.W))
  io.dout := outReg

  object State extends ChiselEnum {
    val feDec, exe = Value
  }
  import State._

  val stateReg = RegInit(feDec)

  switch (stateReg) {
    is (feDec) { stateReg := exe }
    is (exe) { stateReg := feDec }
  }

  val decReg = RegInit(DecodeOut.default)

  // Decode
  val dec = Module(new Decode())
  dec.io.din := instr
  val decout = dec.io.dout

  // TODO: address computation (document it)
  // AR points into byte addressable
  // instruction offset depends on type
  //   for byte ld and st it counts in bytes
  //   for word ld and st is counts in words
  // the memory as an address in words and byte masks
  // we need to do the right routing
  // We could hide this in the memory component...
  val off = Wire(SInt(10.W))
  off := instrSignExt << 2 // default word
  when (decout.isHalfOff) {
    off := instrSignExt << 1
  } .elsewhen(decout.isByteOff) {
    off := instrSignExt
  }
  val effAddr = (addrReg.asSInt + off).asUInt
  val effAddrWord = (effAddr >> 2).asUInt
  val effAddrOff = effAddr & 0x03.U

  // read in feDec, write in exe
  dataMem.io.rdAddr := effAddrWord
  val dataRead = dataMem.io.rdData
  dataMem.io.wrAddr := RegNext(effAddrWord)
  dataMem.io.wrData := accu
  dataMem.io.wr := false.B
  // TODO: use mask
  dataMem.io.wrMask := "b1111".U

  val regRead = registerMem.read(instr(7, 0))
  val data = Mux(decReg.isLoadInd || decReg.isLoadIndB || decReg.isStoreIndH, dataRead, regRead)
  // printf("ar = %x address = %x data = %x\n", addrReg, effAddr, dataRead)

  alu.io.op := decReg.op
  alu.io.enaMask := 0.U
  alu.io.enaByte := decReg.isLoadIndB
  alu.io.off := RegNext(effAddrOff)
  // this should be a single signal from decode (what did I mean?)
  alu.io.din := Mux(decReg.useDecOpd, decReg.operand, data)

  switch(stateReg) {
    is (feDec) {
      decReg := decout
    }

    is (exe) {
      pcReg := pcNext
      alu.io.enaMask := decReg.enaMask
      when (decReg.isLoadAddr) {
        addrReg := accu
        alu.io.enaMask := 0.U
      }
      when (decReg.isLoadInd) {
        // nothing to be done here
      }
      when(decReg.isLoadIndB) {
        // nothing to be done here
        // probably sign extend then
      }
      when (decReg.isStore) {
        registerMem.write(instrLowReg, accu)
        alu.io.enaMask := 0.U
      }
      when(decReg.isStoreInd) {
        dataMem.io.wr := true.B
        alu.io.enaMask := 0.U
      }
      when(decReg.isStoreIndB) {
        dataMem.io.wr := true.B
        // TODO shift according to lower address bits
        dataMem.io.wrMask := "b0001".U
        alu.io.enaMask := 0.U
      }
    }

  }

  exit := RegNext(decReg.exit)

  if (fmaxReg) {
    io.dbg.acc := RegNext(RegNext((accu)))
    io.dbg.pc := RegNext(RegNext((pcReg)))
    io.dbg.instr := RegNext(RegNext((instr)))
    io.dbg.exit := RegNext(RegNext((exit)))
  } else {
    io.dbg.acc := accu
    io.dbg.pc := pcReg
    io.dbg.instr := instr
    io.dbg.exit := exit
  }
}

object Leros extends App {
  emitVerilog(new Leros(32, 10, args(0), true), Array("--target-dir", "generated"))
}