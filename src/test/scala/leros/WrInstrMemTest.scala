/*
package leros

import chisel3._
import chiseltest._
import org.scalatest.flatspec.AnyFlatSpec
import scala.util.Random
import wrmem.WrMemTest

class WrInstrMemTest() extends AnyFlatSpec with ChiselScalatestTester {

    val clockFreq       = 100000000
    val uartBaudrate    = 10000000
    val memAddrWidth    = 8
    val msg             = "bin_generator/file.bin"

    "Writeable Instruction Memory Test" should "pass" in {
        test(new WrMemTest(clockFreq, uartBaudrate, msg)).withAnnotations(Seq(WriteVcdAnnotation)) { dut =>            
            dut.clock.setTimeout(0)
            dut.clock.step(2000)
        }
    }
}
*/