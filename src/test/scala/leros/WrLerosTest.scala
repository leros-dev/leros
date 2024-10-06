package leros

import chisel3._
import chiseltest._
import org.scalatest.flatspec.AnyFlatSpec
import leros.util.Assembler
import wrmem._
import java.io._

class LerosTest extends AnyFlatSpec with ChiselScalatestTester {  
  val progs = leros.shared.Util.getProgs()
  var binaries = List[List[Int]]()
  val outFile = "binaries/allProgs.bin"

  progs.foreach(p => {
    val program = p + ".s"
    val binary = Assembler.getProgram(program)
    binaries = binaries :+ binary.toList
  })

  val out = new FileOutputStream(outFile)
  for (p <- binaries) {
    for (instr <- p) {
      out.write(instr)
      out.write(instr >> 8)
      }
    }
    
  "Leros with writeable instruction memory" should "pass" in {
    test(new LerosTestTop(outFile)).withAnnotations(Seq(WriteVcdAnnotation)) { dut =>         
        dut.clock.setTimeout(0)
        
        val N_PROGRAMS = progs.length
        val MAC_CYCLES = 1000

        var run = true
        var cycles = MAC_CYCLES
        var n = 0
        var newProg = true

        while(run) {
            if(newProg) {
                println(s"Starting test program " + progs(n))
                newProg = false
            }

            dut.clock.step(1)
            if(!dut.io.lerosReset.peekBoolean()) {
                cycles -= 1
            }

            val exit = dut.io.lerosExit.peekBoolean()        

            if(exit) {                              
                cycles = MAC_CYCLES
                dut.io.accu.expect(0.U, "Accu shall be zero at the end of a test program.\n")
                
                println(s"Successfully finished test program " + progs(n))
                println("");
                n += 1
                run = n < N_PROGRAMS
                newProg = true                
            }
            assert(cycles > 0, "Running out of cycles")
        }
      }
    }
}

