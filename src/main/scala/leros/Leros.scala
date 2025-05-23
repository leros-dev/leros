package leros

import chisel3._
import chisel3.util._
import leros.shared.Constants._
import leros.State._

/**
 * Leros top level.
 *
 * Sequential implementation with two states.
 */
class Leros(size: Int = 32, memAddrWidth: Int = 8) extends Module {

  val imemIO = IO(Flipped(new InstrMemIO(memAddrWidth)))
  val dmemIO = IO(Flipped(new DataMemIO(16)))

  val alu = Module(new AluAccu(size))

  val accu = alu.io.accu

  // The main architectural state
  val pcReg = RegInit(-1.S(memAddrWidth.W).asUInt)
  val addrReg = RegInit(0.U(16.W))

  val firstClockReg = RegInit(true.B)
  firstClockReg := false.B

  val pcNext = WireDefault(pcReg + 1.U)

  // Ignore first instruction read from instruction memory
  imemIO.addr := pcNext
  val instr = Mux(firstClockReg, 0.U, imemIO.instr)


  // Decode
  val dec = Module(new Decode())
  dec.io.din := instr
  val decout = dec.io.dout
  val decReg = RegInit(DecodeOut.default)



  val effAddr = (addrReg.asSInt + decout.off).asUInt
  val effAddrWord = (effAddr >> 2).asUInt
  val effAddrOff = Wire(UInt(2.W))
  effAddrOff := effAddr & 0x03.U
  val vecAccu = Wire(Vec(4, UInt(8.W)))
  for (i <- 0 until 4) {
    vecAccu(i) := accu(i*8 + 7, i*8)
  }
  // printf("%x %x %x %x %x\n", addrReg, effAddr, effAddrWord, effAddrOff, decout.off)

  // Data memory, including the register memory
  // read in fetch, write in execute

  val memAddr = Mux(decout.isDataAccess, effAddrWord, instr(7, 0))
  val memAddrReg = RegNext(memAddr)
  val effAddrOffReg = RegNext(effAddrOff)
  dmemIO.rdAddr := memAddr
  val dataRead = dmemIO.rdData
  dmemIO.wrAddr := memAddrReg
  dmemIO.wrData := accu
  dmemIO.wr := false.B
  dmemIO.wrMask := "b1111".U

  // ALU connection
  alu.io.op := decReg.op
  alu.io.enaMask := 0.U
  // TODO: Maybe this should be in the state machine, instead of decode?
  // Maybe not.
  alu.io.enaByte := decReg.enaByte
  alu.io.enaHalf := decReg.enaHalf
  alu.io.off := effAddrOffReg
  alu.io.din := Mux(decReg.useDecOpd, decReg.operand, dataRead)

  // connection to the external world (for testing)
  val exit = RegInit(false.B)

  val stateReg = RegInit(fetch)

  when (stateReg =/= fetch) {
    stateReg := fetch
    pcReg := pcNext
    alu.io.enaMask := decReg.enaMask
  }

  switch(stateReg) {
    is (fetch) {
      stateReg := decout.nextState
      decReg := decout
    }

    // where is the "normal" ALU operation?

    is (loadAddr) {
      addrReg := dataRead
    }

    is (loadInd) {
      // nothing to be done here
    }

    is (store) {
      dmemIO.wr := true.B
    }

    is (storeInd) {
      dmemIO.wr := true.B
    }

    is (storeIndB) {
      // wr and wrMask could be set in decode and registered
      dmemIO.wr := true.B
      dmemIO.wrMask := "b0001".U << effAddrOffReg
      vecAccu(effAddrOffReg) := accu(7, 0)
      dmemIO.wrData := vecAccu(3) ## vecAccu(2) ## vecAccu(1) ## vecAccu(0)
    }

    is (storeIndH) {
      dmemIO.wr := true.B
      dmemIO.wrMask := "b0011".U << effAddrOffReg
      vecAccu(effAddrOffReg) := accu(7, 0)
      vecAccu(effAddrOffReg | 1.U) := accu(15, 8)
      dmemIO.wrData := vecAccu(3) ## vecAccu(2) ## vecAccu(1) ## vecAccu(0)
    }

    is (branch) {
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

    is (jal) {
      pcNext := accu
      dmemIO.wr := true.B
      dmemIO.wrData := pcReg + 1.U
    }

    is (scall) {
      exit := RegNext(true.B)
    }
  }
}

object Leros extends App {
  emitVerilog(new Leros, Array("--target-dir", "generated"))
}