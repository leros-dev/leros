package leros

import chisel3._
import chisel3.iotesters._

import leros.Types._

class AluTester(dut: Alu) extends PeekPokeTester(dut) {

  // TODO: this is not the best way look at functions defined as Enum.
  // Workaround would be defining constants

  //- start leros_alu_ref
  def alu(a: Int, b: Int, op: Int): Int = {

    op match {
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
  //- end

  //- start leros_alu_testvec
  // Some interesting corner cases
  val interesting = Array(1, 2, 4, 123, 0, -1, -2, 0x80000000, 0x7fffffff)
  //- end

  //- start leros_alu_test
  def test(values: Seq[Int]) = {
    for (fun <- add to shr) {
      for (a <- values) {
        for (b <- values) {
          poke(dut.io.op, fun)
          poke(dut.io.a, a)
          poke(dut.io.b, b)
          step(1)
          expect(dut.io.result, alu(a, b, fun.toInt))
        }
      }
    }
  }
  //- end

  //- start leros_alu_testrun
  test(interesting)
  //- end

  //- start leros_alu_rand
  val randArgs = Seq.fill(100)(scala.util.Random.nextInt)
  test(randArgs)
  //- end

}

object AluTester extends App {
  iotesters.Driver(() => new Alu(32)) {
    c => new AluTester(c)
  }
}