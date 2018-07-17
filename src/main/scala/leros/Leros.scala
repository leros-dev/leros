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
    // val dout = Output(UInt(width = 32))
    val dout = Output(UInt(32.W)) // 32.W is Chisel 3
  })

  println("Generating Leros")
  io.dout := 42.U
}

object Leros extends App {
  Driver.execute(Array[String](), () => new Leros())
}
