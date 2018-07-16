/*
 * Leros, a Tiny Microprocessor
 *
 * Author: Martin Schoeberl (martin@jopdesign.com)
 */

package leros

import Chisel._

/**
 * Create and connect a n x n NoC.
 */
class Leros() extends Module {
  val io = new Bundle {
    val dout = UInt(width = 32).asOutput
  }

  println("Generating Leros")
  // single output for the synthesizer results
  // val or = dout.fold(UInt(0))(_ | _)
  // io.dout := Reg(next = or)

}

object Leros extends App {

  chiselMain(Array("--backend", "v", "--targetDir", "generated"),
    () => Module(new Leros()))
}
