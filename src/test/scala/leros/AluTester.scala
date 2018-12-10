package leros

import chisel3._
import chisel3.iotesters._

import leros.Types._

class AluTester(dut: Alu) extends PeekPokeTester(dut) {

  poke(dut.a, 1.U)
  poke(dut.b, 2.U)
  poke(dut.op, add)
  step(1)
  expect(dut.io.y, 3.U)
}

object AluTester extends App {
  println("Testing Leros")
  iotesters.Driver(() => new Alu(32)) {
    c => new AluTester(c)
  }
}