
object Operators {
  def main(args: Array[String]) {
    println("all the usual math, logic and binary operators.") 

    val a = 1024
    val b = 2048

    println(s"values (a -> $a) and (b -> $b)")
    println(s"""
      a + b = ${ a + b }
      a - b = ${ a - b }
      a * b = ${ a * b }
      a / b = ${ a / b }
      a % b = ${ a % b }

      a == b = ${ a == b }
      a != b = ${ a != b }
      a >  b = ${ a >  b }
      a <  b = ${ a <  b }
      a >= b = ${ a >= b }
      a <= b = ${ a <= b }

      all the operators you'd expect,
      working mostly like in any other
      "c-descendent" language.

      &&, ||, ! for logical stuff

      for binary operations

      &, |, ^, ~, <<, >>, >>>

      and assignments

      =, +=, -=, *=, /=, %=,
      <<=, >>=, &=, ^=, |=


    """)
  }
}
