/*
 * Software simulator of Leros
 *
 * Author: Martin Schoeberl (martin@jopdesign.com)
 */

package leros.sim

import leros.util._
import leros.shared.Constants._

class LerosSim(prog: String) {


  val code = Assembler.getProgram(prog)

  val UseRegMem = false
  // The complete processor state.
  // We ignore for now which size we are working with (16, 32, or even 64 bits).
  // We will mask out the bits later when it matters.
  var pc = 0
  var accu = 0
  var ar = 0
  // This implementation has different areas for reg and data memory
  var mem = new Array[Int](512)
  var reg = new Array[Int](256)

  def dumpMem() = {
    for (i <- 0 until 8) {
      printf("%08x %08x ", i * 4, mem(i))
      for (j <- 0 until 4) {
        printf("%02x ", (mem(i) >> (8 * j)) & 0xff)
      }
      println()
    }
  }

  // communicate with main
  var run = true

  def step(): Unit = {

    val instr = code(pc)
    val opcode = (instr >> 8) & 0xff
    val opd = instr & 0x00ff
    val opd12 = instr & 0x0fff

    var doBranch = false
    var doJal = false

    def sext(v: Int) = (v << 24) >> 24

    def sext12(v: Int) = (v << 20) >> 20

    def sext16(v: Int) = (v << 16) >> 16


    // mask out 4 bits on a branch for matching the opcode
    val opcodeMask = opcode & 0xf0 match {
      case BR => opcode & 0xf0
      case BRZ => opcode & 0xf0
      case BRNZ => opcode & 0xf0
      case BRP => opcode & 0xf0
      case BRN => opcode & 0xf0
      case _ => opcode
    }

    val regVal = if (UseRegMem) reg(opd) else mem(opd)

    opcodeMask match {
      case NOP =>
      case ADD => accu = accu + regVal
      case ADDI => accu = accu + sext(opd)
      case SUB => accu = accu - regVal
      case SUBI => accu = accu - sext(opd)
      case SHR => accu = accu >>> 1
      case LD => accu = regVal
      case LDI => accu = sext(opd)
      case LDHI => accu = (accu & 0xff) + ((opd << 24) >> 16)
      case LDH2I => accu = (accu & 0xffff) + ((opd << 24) >> 8)
      case LDH3I => accu = (accu & 0xffffff) + (opd << 24)
      case AND => accu = accu & regVal
      case ANDI => accu = accu & opd
      case OR => accu = accu | regVal
      case ORI => accu = accu | opd
      case XOR => accu = accu ^ regVal
      case XORI => accu = accu ^ opd
      case ST => if (UseRegMem) reg(opd) = accu else mem(opd) = accu
      case OUT => // TODO: define a device that maps to stdout
      case IN => // TODO: a device for reading from stdin
      case JAL => {
        if (UseRegMem) reg(opd) = pc + 1 else mem(opd) = pc + 1
        doJal = true
      }
      case BR => doBranch = true
      case BRZ => if (accu == 0) doBranch = true
      case BRNZ => if (accu != 0) doBranch = true
      case BRP => if (accu >= 0) doBranch = true
      case BRN => if (accu < 0) doBranch = true
      case LDADDR => ar = accu
      case LDIND => accu = mem(ar / 4 + sext(opd))
      case LDINDB => {
        val addr = ar + sext(opd)
        accu = sext((mem(addr / 4) >> ((addr & 0x03) * 8)) & 0xff)
        // dumpMem()
      }
      case LDINDH => {
        val addr = ar + (sext(opd) << 1)
        accu = sext16((mem(addr / 4) >> ((addr & 0x03) * 8)) & 0xffff)
      }
      case STIND => {
        mem(ar / 4 + sext(opd)) = accu
        // dumpMem()
      }
      case STINDB => {
        val addr = ar + sext(opd)
        var v = mem(addr / 4)
        val boff = addr & 0x03
        val mask = ~(0xff << boff * 8)
        v = v & mask
        v = v | ((accu & 0xff) << boff * 8)
        mem(addr / 4 ) = v
        // dumpMem()
      }
      case STINDH => {
        val addr = ar + (sext(opd) << 1)
        var v = mem(addr / 4)
        val boff = addr & 0x03
        val mask = ~(0xffff << boff * 8)
        v = v & mask
        v = v | ((accu & 0xffff) << boff * 8)
        mem(addr / 4) = v
      }
      case SCALL => if (opd == 0) run = false
    }

    if (doBranch) {
      pc = pc + sext12(opd12)
    } else if (doJal) {
      pc = accu
    } else {
      pc += 1
    }
    run = run && pc < code.length
  }
}

object LerosSim extends App {

  val lsim = new LerosSim(args(0))

  while (lsim.run) {
    printf("pc: 0x%04x instr: 0x%04x ", lsim.pc, lsim.code(lsim.pc))
    lsim.step()
    printf("accu: 0x%08x\n", lsim.accu)
  }
  assert(lsim.accu == 0, "Accu shall be zero at the end of a test/program")
  println()

}