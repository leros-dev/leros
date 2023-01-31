/*
 * Author: Martin Schoeberl (martin@jopdesign.com)
 * 
 * Tester for Leros.
 * 
 */

package leros

import chisel3._
import chiseltest._
import org.scalatest.flatspec.AnyFlatSpec

class LerosTest extends AnyFlatSpec with ChiselScalatestTester {

  val progs = leros.shared.Util.getProgs()
  progs.foreach(p => {
    val program = p + ".s"

    def testFun(dut: LerosBase): Unit = {
      var run = true
      var maxCycles = 10000
      while (run) {
        val pc = dut.io.dbg.pc.peekInt()
        val accu = dut.io.dbg.acc.peekInt()
        val instr = dut.io.dbg.instr.peekInt()
        Predef.printf("pc: 0x%04x instr: 0x%04x accu: 0x%08x\n", pc, instr, accu)
        dut.clock.step(1)
        maxCycles -= 1
        run = dut.io.dbg.exit.peekInt() == 0 && maxCycles > 0
        assert(maxCycles > 0, "Running out of cycles")
      }
      val res = dut.io.dbg.acc.expect(0.U, "Accu shall be zero at the end of a test case.\n")
    }

    "Leros HW " should s"pass $program" in {
      test(new Leros(32, 10, program, false))
        .withAnnotations(Seq(WriteVcdAnnotation)) { dut =>
        testFun(dut)
      }
    }

  }
  )
}

