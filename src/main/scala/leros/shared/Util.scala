package leros.shared

import java.io.File

object Util extends App {

  def getProgs() = {
    val path = sys.props.getOrElse("testpath", "asm/test")
    if (sys.props.contains("program")) {
      sys.props.getOrElse("program", "").split(" ").map(path + "/" + _)
    } else {
      new File(path).listFiles().filter(_.isFile).map(_.toString.replaceAll("\\.s$", ""))
    }
  }

  // just test the static function
  Util.getProgs().foreach(println)
}