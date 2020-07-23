/*
 * Author: Martin Schoeberl (martin@jopdesign.com)
 * 
 * Tester for Leros.
 * 
 */

package leros

import chisel3.iotesters.PeekPokeTester
import org.scalatest._

class LerosTester(dut: Leros) extends PeekPokeTester(dut) {

  var run = true
  var maxCycles = 100
  while(run) {
// Looks like peeking elements is gone in Chisel 3
//    peek(dut.pc)
//    peek(dut.accuReg)
//    peek(dut.instr)
    val pc = peek(dut.io.dbg.pc)
    val accu = peek(dut.io.dbg.acc).toInt
    val instr = peek(dut.io.dbg.instr)
    printf("pc: 0x%04x instr: 0x%04x accu: 0x%08x\n", pc, instr, accu)
    step(1)
    maxCycles -= 1
    run = peek(dut.io.dbg.exit) == 0 && maxCycles > 0
    // poke(dut.io.din, maxInstructions)
  }
  val res = expect(dut.io.dbg.acc, 0, "Accu shall be zero at the end of a test case.\n")
  // exit(-1) does not dump the waveform
  // if (!res) System.exit(-1)
}

class LerosSpec extends FlatSpec with Matchers {

  "Leros" should "pass" in {
    val program = sys.props.getOrElse("program", "asm/base.s")
    println("Testing: " + program)
    chisel3.iotesters.Driver(() => new Leros(32, 10, program, false)) { c =>
      new LerosTester(c)
    } should be (true)
  }
}
