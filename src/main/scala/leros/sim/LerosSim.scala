/*
 * Software simulator of Leros
 *
 * Author: Martin Schoeberl (martin@jopdesign.com)
 */

package leros.sim

import leros.util._

class LerosSim {

  // The complete processor state.
  // We ignore for now which size we are working with (16, 32, or even 64 bits).
  // We will mask out the bits later when it matters.

  val prog = Assembler.getProgramFix()

  var pc = 0
  var accu = 0
  var mem = new Array[Int](512)

  // communicate with main
  var run = true

  def step(): Unit = {

    val instr = prog(pc)
    val opcode = (instr >> 8) & 0xff
    // TODO check imm flag
    val opd = instr & 0xff

    opcode & 0xfe match {
      case 0x00 => // nop
      case 0x20 => accu = opd
    }

    if (false) { //doBranch && !delayOne) {
      // pc = mem(pc)
    } else {
      pc += 1
    }
    run = pc < prog.length
  }
}

object LerosSim extends App {

  val lsim = new LerosSim()

  while (lsim.run) {
    printf("pc: 0x%04x instr: 0x%04x ", lsim.pc, lsim.prog(lsim.pc))
    lsim.step
    printf("accu: 0x%04x\n", lsim.accu)
  }
  println

}