package leros

import chisel3._
import chiseltest._
import org.scalatest.flatspec.AnyFlatSpec
import scala.util.Random
import wrmem.WrLerosTest


class WrLerosSim() extends AnyFlatSpec with ChiselScalatestTester {

    val prog = "binaries/out.bin"

    "Leros with writeable instruction memory" should "pass" in {
        test(new WrLerosTest(prog)).withAnnotations(Seq(WriteVcdAnnotation)) { dut =>            
            dut.clock.setTimeout(0)
            dut.clock.step(10000)
        }
    }
}
