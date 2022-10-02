
import java.io._

class Point(val xc: Int, val yc: Int) {
  var x: Int = xc
  var y: Int = yc

  def move(dx: Int, dy: Int) {
    x = x + dx
    y = y + dy

    println("point.x location -> " + x)
    println("point.y location -> " + y)
  }
}

object SomeClasses {
  def main(args: Array[String]) {
    val pt = new Point(10, 20)

    // move to another point 
    pt.move(15, 15)
  }
}
