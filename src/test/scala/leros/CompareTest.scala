/*
 * Author: Martin Schoeberl (martin@jopdesign.com)
 *
 * Tester for Leros.
 *
 */

package leros

import chiseltest._

import sys.process._
import org.scalatest.flatspec.AnyFlatSpec
import os.FileType.File

import scala.collection.mutable.ListBuffer

class CompareTest extends AnyFlatSpec with ChiselScalatestTester {

  val simulator = "../leros-sim/build-leros-sim/leros-sim"
  if ((new java.io.File(simulator)).isFile) {

    val progs = leros.shared.Util.getProgs()
    // val progs = Seq("asm/test/base")

    progs.foreach(p => {

      def removeDuplicates(s: Seq[Int]) = {
        val n = 0
        val l = ListBuffer(s(0))
        for (e <- s) {
          if (e != l.last) {
            l.append(e)
          }
        }
        l.toList
      }

      val program = p + ".s"
      util.DumpProgram.dump(util.Assembler.getProgram(program))
      val resultSim = s"$simulator -d -f out.bin".!!
      val swsim = removeDuplicates(0 :: resultSim.split("\n").toList
        .map(java.lang.Long.valueOf(_, 16).intValue()).toList)

      def testFun(dut: LerosBase): Unit = {
        var run = true
        var maxCycles = 10000
        val l = ListBuffer(0)
        while (run) {
          val accu = dut.io.dbg.acc.peekInt()
          l.append(accu.toInt)
          // Predef.printf("%08x\n", accu)
          dut.clock.step(1)
          maxCycles -= 1
          run = !dut.io.dbg.exit.peekBoolean() && maxCycles > 0
          assert(maxCycles > 0, "Running out of cycles")
        }
        val hw = removeDuplicates(l.toSeq)
        assert(swsim.length == hw.length)
        for (v <- swsim.zip(hw)) {
          assert(v._1 == v._2)
        }
      }

      "Cosimulation with Morten's simulator" should s"pass $program" in {
        test(new Leros(32, 10, program, false)) { dut =>
          testFun(dut)
        }
      }
    })
  }


}

