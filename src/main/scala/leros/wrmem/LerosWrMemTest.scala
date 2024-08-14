package leros.wrmem

import chisel3._
import chisel3.util._
import leros._
import leros.uart.Sender
import leros.uart.Sender


class LerosWrMemTest(clockFreq : Int = 100000000, uartBaudrate : Int = 115200, txFile : String) extends Module {
  val io = IO(new Bundle {
    val instr = Output(UInt(16.W))
  })

  val programmer = Module(new Sender(clockFreq, uartBaudrate, txFile))
  val wrInstrMem = Module(new WrInstrMemory(8, clockFreq, uartBaudrate))

  val idle :: programming :: readout :: Nil = Enum(3)
  val state = RegInit(idle)

  val pc = RegInit(0.U(8.W))
  wrInstrMem.io.instrAddr := pc

  wrInstrMem.io.uartRX := programmer.io.txd

  switch(state) {
    is(idle) {
      pc := 0.U

      when(wrInstrMem.io.busy) {
        state := programming
      }
    }
    is(programming) {      
      when(~wrInstrMem.io.busy) {
        pc := pc + 1.U
      }
    }
  }

  io.instr := wrInstrMem.io.instr
}