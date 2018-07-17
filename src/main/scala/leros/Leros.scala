/*
 * Leros, a Tiny Microprocessor
 *
 * Author: Martin Schoeberl (martin@jopdesign.com)
 */

package leros

import chisel3._

/**
 * Leros top level
 */
class Leros() extends Module {
  val io = IO(new Bundle {
    val dout = Output(UInt(32.W))
  })

  println("Generating Leros")
  io.dout := 42.U
}

object Leros extends App {

  Driver.execute(Array("--target-dir", "generated"), () => new Leros())
}
