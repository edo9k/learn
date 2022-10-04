
class PublicMember {
  class Inner {
    def someFunction() {
      println("this is printed by the public function.")
    }

    class InnerMost {
      someFunction() // ok, it's accessible
      // because the method is public
    }
  }

  (new Inner).someFunction() // it's ok too
  // because the method is public
  // can be accessed by anyone
}

