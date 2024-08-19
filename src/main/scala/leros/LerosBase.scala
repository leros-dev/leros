/*
 * Leros, a Tiny Microprocessor
 *
 * Author: Martin Schoeberl (martin@jopdesign.com)
 */

package leros

import chisel3._
import wrmem.WrInstrMemInterface

/**
  * Leros top level as abstract class.
  * Basically empty. Maybe we can/shall share code between different implementations.
  */
abstract class LerosBase(prog: String, size: Int =32, memAddrWidth: Int = 8) extends Module {
  val io = IO(new Bundle {
    val led = Output(UInt(8.W))
    val wrMemInterface = Flipped(new WrInstrMemInterface(memAddrWidth))
  })
}


