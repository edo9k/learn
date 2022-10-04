
package p {

  class Super {
    protected def sayHiProtectedly() {
      println("Hi (says protectely)")
    }
  }

  class Sub extends Super {
    sayHiProtectedly() // accessible here
    // protected is accessible from children
    // classes
  }

  class Other {
    (new Super).sayHiProtectedly() // will error. not accessible
    // brecause Other is not a-child-of
    // it does not Extend Class Super
  }
}

