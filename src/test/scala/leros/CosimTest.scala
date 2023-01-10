/*
 * Author: Martin Schoeberl (martin@jopdesign.com)
 *
 * Tester for Leros.
 *
 */

package leros

import chiseltest._
import org.scalatest.flatspec.AnyFlatSpec

import leros.sim._

class CosimTest extends AnyFlatSpec with ChiselScalatestTester {

  val progs = leros.shared.Util.getProgs()
  // val progs = Seq("asm/test/base")

  progs.foreach(p => {

    val program = p + ".s"
    val lsim = new LerosSim(program)

    def testFun(dut: LerosBase): Unit = {
      var run = true
      var maxCycles = 10000
      var hwAccu = 0
      var simAccu = 0
      while (run) {
        while (hwAccu == dut.io.dbg.acc.peekInt().toInt && !dut.io.dbg.exit.peekBoolean()) {
          dut.clock.step(1)
          maxCycles -= 1
        }
        hwAccu = dut.io.dbg.acc.peekInt().toInt
        while (simAccu == lsim.accu && lsim.run) {
          lsim.step()
        }
        simAccu = lsim.accu
        // Predef.printf("%08x %08x\n", hwAccu, simAccu)
        assert(hwAccu == simAccu)

        run = !dut.io.dbg.exit.peekBoolean() && lsim.run && maxCycles > 0
        assert(maxCycles > 0, "Running out of cycles")
      }
    }

    "Cosimulation " should s"pass $program" in {
      test(new Leros(32, 10, program, false)) { dut =>
        testFun(dut)
      }
    }
  })

}

