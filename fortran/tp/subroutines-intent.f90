program subroutine_intent
implicit none

  real :: x, y, z, disc

  x = 1.0
  y = 5.0
  z = 2.0

  call intent_example(x, y, z, disc)

  print *, "you can define variable intent using the `intent` keyword"
  print *, "while defining the variable type."
  print *, "in - input, out - output, inout - both"
  print *, "the value of the discriminant is: ", disc

end program subroutine_intent

subroutine intent_example(a, b, c, d)
implicit none

  ! input arguments
  real, intent (in) :: a, b, c
  
  ! output argument
  real, intent (out) :: d

  d = b * b - 4.0 * a * c

end subroutine intent_example

