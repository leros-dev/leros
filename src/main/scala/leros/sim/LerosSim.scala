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

  // The complete processor state.
  // We ignore for now which size we are working with (16, 32, or even 64 bits).
  // We will mask out the bits later when it matters.
  var pc = 0
  var accu = 0
  var ar = 0
  var mem = new Array[Int](512)
  var reg = new Array[Int](256)

  // communicate with main
  var run = true

  def step(): Unit = {

    val instr = code(pc)
    val opcode = (instr >> 8) & 0xff
    val opd = instr & 0x00ff
    val opd11 = instr & 0x07ff

    var doBranch = false
    var doJal = false

    def sext(v: Int) = {
      (v << 24) >> 24
    }

    def sext11(v: Int) = {
      (v << 21) >> 21
    }

    // TODO: we need to mask out 3 branch bits for matching the opcode

    opcode match {
      case ADD => accu = accu + reg(opd)
      case ADDI => accu = accu + sext(opd)
      case SUB => accu = accu - reg(opd)
      case SUBI => accu = accu - sext(opd)
      case SHR => accu = accu >> 1
      case LD => accu = reg(opd)
      case LDI => accu = sext(opd)
      case LDHI => accu = (accu & 0xff) + ((opd << 24) >> 16)
      case LDH2I => accu = (accu & 0xffff) + ((opd << 24) >> 8)
      case LDH3I => accu = (accu & 0xffffff) + (opd << 24)
      case AND => accu = accu & reg(opd)
      case ANDI => accu = accu & opd
      case OR => accu = accu | reg(opd)
      case ORI => accu = accu | opd
      case XOR => accu = accu ^ reg(opd)
      case XORI => accu = accu ^ opd
      case ST => reg(opd) = accu
      case OUT => // TODO: define a device that maps to stdout
      case IN => // TODO: a device for reading from stdin
      case JAL => {
        reg(opd) = pc + 1;
        doJal = true
      }
      case BR => doBranch = true
      case BRZ => if (accu == 0) doBranch = true
      case BRNZ => if (accu != 0) doBranch = true
      case BRP => if (accu >= 0) doBranch = true
      case BRN => if (accu < 0) doBranch = true
      case LDADDR => ar = accu
      case LDIND => accu = mem(ar / 4 + opd) // TODO: semantics changed to have opd in words, but address in bytes
      case LDINDBU => accu = (mem((ar + opd) / 4) >> ((ar + opd) & 0x03) * 8) & 0xff // TODO: decide on big or little ending
      case STIND => mem(ar / 4 + opd) = accu
      case STINDB => {
        var v = mem((ar + opd) / 4) // TODO: decide on big/little ending and test
        val boff = (ar + opd) & 0x03
        val mask = ~(0xff << boff * 8)
        v = v & mask
        v = v | (ar & 0xff) << boff * 8
        mem((ar + opd) / 4) = v
      }
      case SCALL => if (opd == 0) run = false
    }

    if (doBranch) {
      pc = pc + sext11(opd11) // or PC + 1
    } else if (doJal) {
      pc = accu
    } else {
      pc += 1
    }
    run = pc < code.length
  }
}

object LerosSim extends App {

  val lsim = new LerosSim(args(0))

  while (lsim.run) {
    printf("pc: 0x%04x instr: 0x%04x ", lsim.pc, lsim.code(lsim.pc))
    lsim.step
    printf("accu: 0x%04x\n", lsim.accu)
  }
  assert(lsim.accu == 0, "Accu shall be zero at the end of a test/program")
  println

}