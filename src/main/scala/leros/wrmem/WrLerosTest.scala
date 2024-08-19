package leros.wrmem

import chisel3._
import chisel3.util._
import leros._
import leros.uart.Sender
import leros.uart.Sender


class WrLerosTest(file : String) extends Module {
  val io = IO(new Bundle {
    val led = Output(UInt(8.W))
  })

  val programmer = Module(new Sender(100000000, 10000000, file))
  val leros = Module(new LerosTop(file))
  

  leros.io.rx := programmer.io.txd
  io.led := leros.io.led
}