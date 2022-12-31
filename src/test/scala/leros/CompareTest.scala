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
import os.Source

class CompareTest extends AnyFlatSpec with ChiselScalatestTester {

  // val progs = leros.shared.Util.getProgs()
  val progs = Seq("asm/test/base")
  progs.foreach(p => {
    val program = p + ".s"

    def testFun(dut: Leros): Unit = {
      var run = true
      var maxCycles = 10000
      val cosim = scala.io.Source.fromFile("dump.txt")
      val refs = cosim.getLines().map(java.lang.Long.valueOf(_, 16).intValue()).toVector
      var i = 0
      var simAccu = -1
      var hwAccu = -1
      while (run) {
        val accu = dut.io.dbg.acc.peekInt()
        if (accu != hwAccu && refs(i) != simAccu) {
          // assert(accu == refs(i))
        }

        Predef.printf("%08x\n", accu)
        dut.clock.step(1)
        maxCycles -= 1
        run = !dut.io.dbg.exit.peekBoolean() && maxCycles > 0
        assert(maxCycles > 0, "Running out of cycles")
      }
    }

    "LerosTwoStates HW " should s"pass $program" in {
      test(new LerosTwoStates(32, 10, program, false)) { dut =>
        testFun(dut)
      }
    }

    /*
    "LerosFsmd HW " should s"pass $program" in {
      test(new LerosFsmd(32, 10, program, false)).withAnnotations(Seq(WriteVcdAnnotation)) { dut =>
        testFun(dut)
      }
    }

     */
  }
  )
}

