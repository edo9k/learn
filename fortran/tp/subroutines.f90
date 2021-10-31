program functions_and_subroutines

  real    :: area ! used in function example
  integer :: a, b ! used in subroutine examples
  
  ! notes
  print *, "similar to pascal, functions return values."
  print *, "subroutines do not, like pascal proceures."
  print *, "but it seems the compiler does not prevent you from"
  print *, "mutating function parameters. (even if not advised)"


  ! get circle area from function 
  area = area_of_circle(2.0)

  print *, "area of a circle with radius 2.0 -> ", area

  ! using subroutine
  a = 6969
  b = 4242

  print *, "values of (a, b) before calling swap ", a, b
  call swap(a, b)
  print *, "values of (a, b) after calling swap  ", a, b

end program functions_and_subroutines


! defining functions

function area_of_circle(r)
implicit none
  
  ! the return value is the function name
  ! just like in pascal
  real :: area_of_circle ! return value

  ! local variables
  real :: r ! <- declaration for the function parameter
  real :: pi

  pi = 4 * atan(1.0)
  area_of_circle = pi * r ** 2

end function area_of_circle


subroutine swap(x, y)
implicit none

  integer :: temp, x, y

  ! classic switcheroo
  temp  =    x
  x     =    y
  y     = temp 

end subroutine swap 
