/*
 * Copyright: 2014-2018, Technical University of Denmark, DTU Compute
 * Author: Martin Schoeberl (martin@jopdesign.com)
 * License: Simplified BSD License
 *
 * A UART is a serial port, also called an RS232 interface.
 *
 */

package leros.uart

import chisel3._
import chisel3.util._

class UartIO extends DecoupledIO(UInt(8.W)) {
}

/**
 * Receive part of the UART.
 * Use a ready/valid handshaking.
 * The following code is inspired by Tommy's receive code at:
 * https://github.com/tommythorn/yarvi
 */
class Rx(frequency: Long, baudRate: Long) extends Module {
  val io = IO(new Bundle {
    val rxd = Input(UInt(1.W))
    val channel = new UartIO()
  })

  val BIT_CNT = ((frequency + baudRate / 2) / baudRate - 1).U
  val START_CNT = ((3 * frequency / 2 + baudRate / 2) / baudRate - 1).U

  // Sync in the asynchronous RX data, reset to 1 to not start reading after a reset
  val rxReg = RegNext(RegNext(io.rxd, 1.U), 1.U)

  val shiftReg = RegInit(0.U(8.W))
  val cntReg = RegInit(0.U(20.W))
  val bitsReg = RegInit(0.U(4.W))
  val validReg = RegInit(false.B)

  when(cntReg =/= 0.U) {
    cntReg := cntReg - 1.U
  } .elsewhen(bitsReg =/= 0.U) {
    cntReg := BIT_CNT
    shiftReg := rxReg ## (shiftReg >> 1)
    bitsReg := bitsReg - 1.U
    // the last bit shifted in
    when(bitsReg === 1.U) {
      validReg := true.B
    }
  } .elsewhen(rxReg === 0.U) {
    // wait 1.5 bits after falling edge of start
    cntReg := START_CNT
    bitsReg := 8.U
  }

  when(validReg && io.channel.ready) {
    validReg := false.B
  }

  io.channel.bits := shiftReg
  io.channel.valid := validReg
}


/*
 * Buffered uart receiver
 */
class UARTRx(frequency: Long, baudRate: Long) extends Module {
  val io = IO(new Bundle {
    val rxd = Input(UInt(1.W))
    val out = new UartIO()
  })
  val rx = Module(new Rx(frequency, baudRate))
  val buf = Module(new Buffer())

  val led = RegInit(0.U(8.W))

  rx.io.rxd := io.rxd
  rx.io.channel <> buf.io.in
  
  io.out <> buf.io.out
}