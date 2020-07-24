package leros.shared

object Util {

  def getProgs() = {
    val program = sys.props.getOrElse("program", "base")
    val path = sys.props.getOrElse("testpath", "asm")
    val tests = sys.props.getOrElse("tests", program)
    tests.split(" ")
  }

}
