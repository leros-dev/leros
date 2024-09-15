package leros.util

import java.io._
import leros.shared.Constants._

object DumpProgram extends App {

  def dump(program: Array[Int]): Unit = {
    val out = new FileOutputStream(args(1))

    for (inst <- program) {
      out.write(inst)
      out.write(inst >> 8)
    }
    out.write(SCALL)
    out.write(SCALL_PROGRAM)
    out.close()
  }

  dump(Assembler.getProgram(args(0)))
}
