package leros.sim

import org.scalatest.matchers.should.Matchers
import org.scalatest.flatspec.AnyFlatSpec

class LerosSimTest extends AnyFlatSpec with Matchers {

  val progs = leros.shared.Util.getProgs()
  progs.foreach(p => {
    val program = p + ".s"

    "Leros simulation" should s"pass $program" in {

      val lsim = new LerosSim(program)

      while (lsim.run) {
        // printf("pc: 0x%04x instr: 0x%04x ", lsim.pc, lsim.code(lsim.pc))
        lsim.step()
        // printf("accu: 0x%08x\n", lsim.accu)
      }
      assert(lsim.accu == 0, "Accu shall be zero at the end of a test/program")
      println()
    }
  }
  )
}