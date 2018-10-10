/*
 * Author: Martin Schoeberl (martin@jopdesign.com)
 * 
 * Tester for Leros.
 * 
 */

package leros

import chisel3._
import chisel3.iotesters.PeekPokeTester

class LerosTester(dut: Leros) extends PeekPokeTester(dut) {

  var run = true
  var maxInstructions = 5
  while(run) {
// Looks like peeking elements in gone in Chisel 2
//    peek(dut.pc)
//    peek(dut.accu)
//    peek(dut.instr)
    println("pc: " + peek(dut.io.dbg.pc).toString(16) + " acc: " + peek(dut.io.dbg.acc).toString(16) + " opc: " + peek(dut.io.dbg.opc).toString(16))
    step(1)
    maxInstructions -= 1
//    run = peek(dut.exit) == 0 &&
    run = maxInstructions > 0
    // poke(dut.io.din, maxInstructions)
  }
  expect(dut.io.dbg.acc, 0, "Accu shall be zero at the end of a test case.\n")
  expect(dut.io.dout, 42)
}

object LerosTester extends App {
  println("Testing Leros")
  iotesters.Driver.execute(Array[String](), () => new Leros(32, 10)) {
    c => new LerosTester(c)
  }
}
