package leros.wrmem

import chisel3._
import chisel3.util._
import leros.uart.UARTRx
import leros.uart.UARTRx

class WrInstrMemory(memAddrWidth : Int, clockFreq : Int, uartBaudrate : Int) extends Module {
    val io = IO(new Bundle {
    val uartRX = Input(UInt(1.W))
    
    val instrAddr = Input(UInt(memAddrWidth.W))
    val instr = Output(UInt(16.W))

    val busy = Output(Bool())
})
  val progFSM = Module(new ProgFSM(memAddrWidth))
  val uartRx = Module(new UARTRx(clockFreq, uartBaudrate))

  val wrAddr = WireDefault(0.U(memAddrWidth.W))
  val wrData = WireDefault(0.U(16.W))
  val wrEna = WireDefault(false.B)
  
  uartRx.io.out <> progFSM.io.channel
  uartRx.io.rxd := io.uartRX

  wrAddr := progFSM.io.wrAddr
  wrData := progFSM.io.wrData
  wrEna := progFSM.io.wrEna
  
  val mem = SyncReadMem(scala.math.pow(2, memAddrWidth).toInt, UInt(16.W))
  
  io.instr := mem.read(io.instrAddr)
  when(wrEna) {
    mem.write(wrAddr , wrData)
  }

  io.busy := progFSM.io.busy

}