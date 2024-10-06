package leros

import chisel3._
import chisel3.util._
import leros.shared.Constants._
import leros.State._
import wrmem.WrInstrMem

/**
 * Leros top level.
 *
 * Sequential implementation with two states.
 */
class Leros(prog: String, size: Int = 32, memAddrWidth: Int = 8) extends Module {
  val io = IO(new Bundle {
    val led = Output(UInt(16.W))
    val pc = Output(UInt(memAddrWidth.W))
    val instr = Input(UInt(16.W))
  })
  
  val alu = Module(new AluAccu(size))
    
  val accu = alu.io.accu

  // The main architectural state
  val pcReg = RegInit(0.U(memAddrWidth.W))
  val addrReg = RegInit(0.U(memAddrWidth.W))

  val pcNext = WireDefault(pcReg + 1.U)
  
  io.pc := pcNext
  val instr = io.instr

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
  // printf("%x %x %x %x\n", effAddr, effAddrWord, effAddrOff, decout.off)

  // Data memory, including the register memory
  // read in fetch, write in execute
  val dataMem = Module(new SramSim(size, math.pow(2, memAddrWidth.toDouble).toInt))

  val memAddr = Mux(decout.isDataAccess, effAddrWord, instr(7, 0))
  val memAddrReg = RegNext(memAddr)
  val effAddrOffReg = RegNext(effAddrOff)
  dataMem.io.rdAddr := memAddr
  val dataRead = dataMem.io.rdData
  dataMem.io.wrAddr := memAddrReg
  dataMem.io.wrData := accu
  dataMem.io.we := false.B
  dataMem.io.wrMask := "b1111".U
  dataMem.io.req := true.B

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
  val ledReg = RegInit(0.U(16.W))
  io.led := ledReg
  
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
      dataMem.io.we := true.B
    }

    is (storeInd) {
      dataMem.io.we := true.B
      // TODO: am I missing here something? See the other store indirect      
    }

    is (storeIndB) {
      // wr and wrMask could be set in decode and registered
      dataMem.io.we := true.B
      dataMem.io.wrMask := "b0001".U << effAddrOffReg
      vecAccu(effAddrOffReg) := accu(7, 0)
      dataMem.io.wrData := vecAccu(3) ## vecAccu(2) ## vecAccu(1) ## vecAccu(0)
    }

    is (storeIndH) {
      dataMem.io.we := true.B
      dataMem.io.wrMask := "b0011".U << effAddrOffReg
      vecAccu(effAddrOffReg) := accu(7, 0)
      vecAccu(effAddrOffReg | 1.U) := accu(15, 8)
      dataMem.io.wrData := vecAccu(3) ## vecAccu(2) ## vecAccu(1) ## vecAccu(0)
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
      dataMem.io.we := true.B
      dataMem.io.wrData := pcReg + 1.U
    }

    is (scall) {
      switch(decReg.scallArg) {
        is(SCALL_EXIT.U) {
            exit := true.B
            ledReg := accu
        }
      }
    }
  }

  when(exit) {
    exit := false.B
  }
}

object Leros extends App {
  emitVerilog(new Leros(args(0)), Array("--target-dir", "generated"))
}