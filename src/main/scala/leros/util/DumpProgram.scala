package leros.util

import java.io._

object DumpProgram extends App {

  val program = Assembler.getProgram(args(0))
  val out = new FileOutputStream("out.bin")
  for (inst <- program) {
    out.write(inst)
    out.write(inst >> 8)
  }

 out.close()
}
