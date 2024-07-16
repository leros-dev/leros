/*
 * Leros, a Tiny Microprocessor
 *
 * Author: Martin Schoeberl (martin@jopdesign.com)
 */

package leros

import chisel3._

/**
  * Leros top level as abstract class.
  * Basically empty. Maybe we can/shall share code between different implementations.
  */
abstract class LerosBase(prog: String, size: Int =32, memAddrWidth: Int = 8) extends Module {
  val io = IO(new Bundle {
    // val dout = Output(UInt(32.W))
    // val sw = Input(UInt(4.W))
    val led = Output(UInt(4.W))
  })
  io.led := 5.U
}


