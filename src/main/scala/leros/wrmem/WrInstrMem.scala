package leros.wrmem

import chisel3._
import chisel3.util._
import leros.uart.UARTRx
import leros.uart.UARTRx
import leros.SramSim
import math.pow

class WrInstrMem(memAddrWidth : Int, clockFreq : Long, uartBaudrate : Long) extends Module {
    val io = IO(new Bundle {
    val uartRX = Input(UInt(1.W))    
    val pc = Input(UInt(memAddrWidth.W))
    val instr = Output(UInt(16.W))
    val coreReset = Output(Bool())
})
  val progFSM = Module(new ProgFSM(memAddrWidth))
  val uartRx = Module(new UARTRx(clockFreq, uartBaudrate))

  // active high reset
  io.coreReset := reset.asBool | progFSM.io.busy
  
  uartRx.io.out <> progFSM.io.channel
  uartRx.io.rxd := io.uartRX

  val mem = Module(new SramSim(16, math.pow(2, memAddrWidth.toDouble).toInt))
  mem.io.req := true.B
  mem.io.rdAddr := Mux(progFSM.io.busy, 0.U, io.pc)
  io.instr := mem.io.rdData
  
  mem.io.we := progFSM.io.wrEna
  mem.io.wrAddr := progFSM.io.wrAddr
  mem.io.wrData := progFSM.io.wrData
  mem.io.wrMask := "b1111".U
}