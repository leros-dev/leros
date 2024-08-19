package leros.wrmem

import chisel3._
import chisel3.util._
import leros.uart.UARTRx
import leros.uart.UARTRx

class WrInstrMem(memAddrWidth : Int, clockFreq : Int, uartBaudrate : Int) extends Module {
    val io = IO(new Bundle {
    val uartRX = Input(UInt(1.W))    
    val wrMemInterface = new WrInstrMemInterface(memAddrWidth)
    val coreReset = Output(Bool())
})
  val progFSM = Module(new ProgFSM(memAddrWidth))
  val uartRx = Module(new UARTRx(clockFreq, uartBaudrate))

  val wrAddr = WireDefault(0.U(memAddrWidth.W))
  val wrData = WireDefault(0.U(16.W))
  val wrEna = WireDefault(false.B)
  val rdAddr = RegInit(0.U(memAddrWidth.W))
  
  uartRx.io.out <> progFSM.io.channel
  uartRx.io.rxd := io.uartRX

  wrAddr := progFSM.io.wrAddr
  wrData := progFSM.io.wrData
  wrEna := progFSM.io.wrEna
  rdAddr := Mux(progFSM.io.busy, 0.U, io.wrMemInterface.pc)
  
  val mem = SyncReadMem(scala.math.pow(2, memAddrWidth).toInt, UInt(16.W))
  
  io.wrMemInterface.instr := mem.read(rdAddr)
  when(wrEna) {
    mem.write(wrAddr , wrData)
  }

  io.coreReset := progFSM.io.busy

}