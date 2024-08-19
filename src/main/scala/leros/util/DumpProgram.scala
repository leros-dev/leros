package leros.util

import java.io._

object DumpProgram extends App {

  def dump(program: Array[Int]): Unit = {
    val outFolder = args(1)
    val out = new FileOutputStream(outFolder + "/out.bin")
    val eof = 0x21

    for (inst <- program) {
      out.write(inst)
      out.write(inst >> 8)
    }
    out.write(eof)
    out.write(eof)
    out.close()
  }

  dump(Assembler.getProgram(args(0)))
}
