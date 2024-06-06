package leros

import chisel3._
import chisel3.util._

import leros.shared.Constants._

/**
 * Leros top level.
 *
 * Sequential implementation with two states.
 */
class Leros(prog: String, size: Int = 32, memAddrWidth: Int = 8) extends LerosBase(prog) {

  object State extends ChiselEnum {
    val fetch, execute = Value
  }
  import State._

  val stateReg = RegInit(fetch)
  switch(stateReg) {
    is(fetch) {
      stateReg := execute
    }
    is(execute) {
      stateReg := fetch
    }
  }

  val alu = Module(new AluAccu(size))

  val accu = alu.io.accu

  // The main architectural state
  val pcReg = RegInit(0.U(memAddrWidth.W))
  val addrReg = RegInit(0.U(memAddrWidth.W))

  val pcNext = WireDefault(pcReg + 1.U)

  // Fetch from instruction memory with an address register that is reset to 0
  val instrMem = Module(new InstrMem(memAddrWidth, prog))
  instrMem.io.addr := pcNext
  val instr = instrMem.io.instr

  // Decode
  val dec = Module(new Decode())
  dec.io.din := instr
  val decout = dec.io.dout

  val decReg = RegInit(DecodeOut.default)
  when (stateReg === fetch) {
    decReg := decout
  }

  val effAddr = (addrReg.asSInt + decout.off).asUInt
  val effAddrWord = (effAddr >> 2).asUInt
  val effAddrOff = Wire(UInt(2.W))
  effAddrOff := effAddr & 0x03.U
  val vecAccu = Wire(Vec(4, UInt(8.W)))
  for (i <- 0 until 4) {
    vecAccu(i) := accu(i*8 + 7, i*8)
  }
  // printf("%x %x %x %x\n", effAddr, effAddrWord, effAddrOff, decout.off)

  // Data memory, including the register memory
  // read in fetch, write in execute
  val dataMem = Module(new DataMem((memAddrWidth)))

  val memAddr = Mux(decout.isDataAccess, effAddrWord, instr(7, 0))
  val memAddrReg = RegNext(memAddr)
  val effAddrOffReg = RegNext(effAddrOff)
  dataMem.io.rdAddr := memAddr
  val dataRead = dataMem.io.rdData
  dataMem.io.wrAddr := memAddrReg
  dataMem.io.wrData := accu
  dataMem.io.wr := false.B
  dataMem.io.wrMask := "b1111".U

  // ALU connection
  alu.io.op := decReg.op
  alu.io.enaMask := 0.U
  alu.io.enaByte := decReg.isLoadIndB
  alu.io.enaHalf := decReg.isLoadIndH
  alu.io.off := effAddrOffReg
  alu.io.din := Mux(decReg.useDecOpd, decReg.operand, dataRead)

  // connection to the external world (test)
  val exit = RegInit(false.B)
  val outReg = RegInit(0.U(32.W))
  outReg := accu
  io.dout := outReg

  switch(stateReg) {
    is (fetch) {
      // nothing here
    }

    is (execute) {
      pcReg := pcNext
      alu.io.enaMask := decReg.enaMask
      when(decReg.isLoadAddr) {
        addrReg := dataRead
        alu.io.enaMask := 0.U
      }
      when(decReg.isLoadInd) {
        // nothing to be done here
      }
      when(decReg.isLoadIndB) {
        // nothing to be done here
      }
      when(decReg.isLoadIndH) {
        // nothing to be done here
      }
      when(decReg.isStore) {
        dataMem.io.wr := true.B
        alu.io.enaMask := 0.U
      }
      when(decReg.isStoreInd) {
        dataMem.io.wr := true.B
        alu.io.enaMask := 0.U
      }
      when(decReg.isStoreIndB) {
        dataMem.io.wr := true.B
        dataMem.io.wrMask := "b0001".U << effAddrOffReg
        alu.io.enaMask := 0.U
        vecAccu(effAddrOffReg) := accu(7, 0)
        dataMem.io.wrData := vecAccu(3) ## vecAccu(2) ## vecAccu(1) ## vecAccu(0)
      }
      when(decReg.isStoreIndH) {
        dataMem.io.wr := true.B
        dataMem.io.wrMask := "b0011".U << effAddrOffReg
        alu.io.enaMask := 0.U
        vecAccu(effAddrOffReg) := accu(7, 0)
        vecAccu(effAddrOffReg | 1.U) := accu(15, 8)
        dataMem.io.wrData := vecAccu(3) ## vecAccu(2) ## vecAccu(1) ## vecAccu(0)
      }
      when(decReg.isBranch) {
        val doBranch = WireDefault(false.B)
        switch(decReg.brType) {
          is ((BR >> 4).U) { doBranch := true.B }
          is ((BRZ >> 4).U) { doBranch := accu === 0.U }
          is ((BRNZ >> 4).U) { doBranch := accu =/= 0.U }
          is ((BRP >> 4).U) { doBranch := accu(31) === 0.U }
          is ((BRN >> 4).U) { doBranch := accu(31) =/= 0.U }
        }
        when (doBranch) {
          pcNext := (pcReg.asSInt + decReg.brOff).asUInt
        }
      }
    }
  }

  exit := RegNext(decReg.exit)

}

object Leros extends App {
  emitVerilog(new Leros(args(0)), Array("--target-dir", "generated"))
}