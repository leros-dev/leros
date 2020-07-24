package leros.sim

import org.scalatest._

class LerosSimSpec extends FlatSpec with Matchers {


  "Leros simulation" should "pass" in {

    val path = sys.props.getOrElse("testpath", "asm")
    val progs = leros.shared.Util.getProgs()
    progs.foreach(p => {
      val program = path + "/" + p + ".s"
      println()
      println()
      println("Testing " + program + " in SW simulation")
      val lsim = new LerosSim(program)

      while (lsim.run) {
        printf("pc: 0x%04x instr: 0x%04x ", lsim.pc, lsim.code(lsim.pc))
        lsim.step
        printf("accu: 0x%08x\n", lsim.accu)
      }
      assert(lsim.accu == 0, "Accu shall be zero at the end of a test/program")
      println
    })

  }
}