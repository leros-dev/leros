package leros.util

import java.io._

object DumpProgram extends App {

  def dump(program: Array[Int]): Unit = {
    val out = new FileOutputStream("out.bin")
    for (inst <- program) {
      out.write(inst)
      out.write(inst >> 8)
    }
    out.close()
  }

  dump(Assembler.getProgram(args(0)))
}
