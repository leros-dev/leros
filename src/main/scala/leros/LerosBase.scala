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
abstract class LerosBase(size: Int, memAddrWidth: Int, prog: String) extends Module {
  val io = IO(new Bundle {
    val dout = Output(UInt(32.W))
  })

}


