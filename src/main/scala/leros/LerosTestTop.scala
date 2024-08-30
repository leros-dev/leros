package leros

import chisel3._
import chisel3.util._
import leros._
import leros.uart.Sender
import leros.LerosConfig._


class LerosTestTop(program : String) extends Module {
  val io = IO(new Bundle {
    val led = Output(UInt(8.W))
    val lerosExit = Output(Bool())
    val accu = Output(UInt(32.W))
  })

  val programmer = Module(new Sender(CLOCK_FREQ_HZ, UART_BAUDRATE, program))
  val leros = Module(new LerosTop(" "))
  
  leros.io.rx := programmer.io.txd

  io.led := leros.io.led
  programmer.io.lerosExit := leros.io.lerosExit
  io.lerosExit := leros.io.lerosExit
  io.accu := leros.io.accu
}