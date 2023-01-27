package leros

import chisel3._
import chiseltest._
import org.scalatest.flatspec.AnyFlatSpec

import leros.shared.Constants._

class AluAccuTest extends AnyFlatSpec with ChiselScalatestTester {
  "AluAccu" should "pass" in {
    test(new AluAccu(32)) { dut =>
      // TODO: this is not the best way look at functions defined as Enum.
      // Workaround would be defining constants
      def alu(a: Int, b: Int, op: Int): Int = {

        op match {
          case 0 => a
          case 1 => a + b
          case 2 => a - b
          case 3 => a & b
          case 4 => a | b
          case 5 => a ^ b
          case 6 => b
          case 7 => a >>> 1
          case _ => -123 // This shall not happen
        }
      }
      def testOne(a: Int, b: Int, fun: Int): Unit = {
        dut.io.op.poke(ld.U)
        dut.io.enaMask.poke("b1111".U)
        dut.io.din.poke((a.toLong & 0x00ffffffffL).U)
        dut.clock.step(1)
        dut.io.op.poke(fun.U)
        dut.io.din.poke((b.toLong & 0x00ffffffffL).U)
        dut.clock.step(1)
        dut.io.accu.expect((alu(a, b, fun.toInt).toLong & 0x00ffffffffL).U)
      }

      def test(values: Seq[Int]) = {
        // for (fun <- add to shr) {
        for (fun <- 0 to 7) {
          for (a <- values) {
            for (b <- values) {
              testOne(a, b, fun)
            }
          }
        }
      }

      // Some interesting corner cases
      val interesting = Seq(1, 2, 4, 123, 0, -1, -2, 0x80000000, 0x7fffffff)
      test(interesting)

      val randArgs = Seq.fill(10)(scala.util.Random.nextInt())
      test(randArgs)
    }
  }
}
