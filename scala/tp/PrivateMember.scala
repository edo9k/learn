
class Outer {
  class Inner {
    private def sayHiPrivately() {
      println("Hi (says privately)")
    }

    class InnerMost {
      sayHiPrivately() // it's accessible here
                      // because it's an inner context
                     // just like a closure...
    } // end InnerMost 
  } // end Inner

  (new Inner).sayHiPrivately() // will error.
}

