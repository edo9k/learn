
import java.io._

class Point(val xc: Int, val yc: Int) {
  var x: Int = xc
  var y: Int = yc

  def move(dx: Int, dy: Int) {
    x = x + dx
    y = y + dy
  }
}

object Singleton {
  def main(args: Array[String]) {
    val point = new Point(10, 20)
    printPoint

    def printPoint {
      println("point x -> " + point.x)
      println("point y -> " + point.y)
    }
  }
}

