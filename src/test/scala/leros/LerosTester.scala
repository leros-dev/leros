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
  var maxCycles = 100
  while(run) {
// Looks like peeking elements is gone in Chisel 3
//    peek(dut.pc)
//    peek(dut.accuReg)
//    peek(dut.instr)
    println("pc: " + peek(dut.io.dbg.pc).toString(16) + " acc: " + peek(dut.io.dbg.acc).toString(16) + " instr: " + peek(dut.io.dbg.instr).toString(16))
    step(1)
    maxCycles -= 1
    run = peek(dut.io.dbg.exit) == 0 && maxCycles > 0
    // poke(dut.io.din, maxInstructions)
  }
  val res = expect(dut.io.dbg.acc, 0, "Accu shall be zero at the end of a test case.\n")
  if (!res) System.exit(-1)
}

object LerosTester extends App {
  println("Testing Leros")
  iotesters.Driver.execute(Array("--target-dir", "generated", "--generate-vcd-output", "on"), () => new Leros(32, 10, args(0), false)) {
    c => new LerosTester(c)
  }
}
