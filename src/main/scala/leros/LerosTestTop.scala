package leros

import chisel3._
import chisel3.util._
import chisel3.util.experimental.BoringUtils
import leros.LerosConfig._
import leros.wrmem._

/*
 * Top level Leros intended for testing with WrLerosTest.scala
 * Includes Leros with writeable instruction memory and a programmer
 * programs: Path to binary file with all test programs 
    * (can be 1 or several test programs contained within single binary file) 
    * Each test program must end with the instruction scall 0xFF (0xFFFF in binary)
 * Each test is programmed, after which leros is released from reset allowing execution
 * Program execution continues until exit flag is raised (caused by instruction scall 0x00)
 * After exit flag is raised next test is programmed
*/

class LerosTestTop(programs : String) extends Module {
  val io = IO(new Bundle {
    val led = Output(UInt(8.W))

    val lerosExit = Output(Bool())
    val accu = Output(UInt(32.W))
    val lerosReset = Output(Bool())
  })

  val programmer = Module(new Programmer(CLOCK_FREQ_HZ, UART_BAUDRATE, programs))
  val leros = Module(new LerosTop(" "))
  
  leros.io.rx := programmer.io.txd

  programmer.io.lerosExit := BoringUtils.bore(leros.lerosCore.exit)
  
  io.led := leros.io.led  
  io.accu := BoringUtils.bore(leros.lerosCore.accu)
  io.lerosExit := BoringUtils.bore(leros.lerosCore.exit)
  io.lerosReset := BoringUtils.bore(leros.lerosCore.reset)
}
