package leros.util

object Assembler {

  val prog = Array[Int](
    0x21ab, // load 0xab
    0x0000)

  // collect destination addresses in first pass
  val symbols = collection.mutable.Map[String, Int]()

  def getProgramFix() = prog

  def getProgram() = getProgramFix()
}
