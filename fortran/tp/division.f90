program division
  implicit none

  ! define real variables
  real :: p, q, real_result

  ! define integer variables
  integer :: i, j, integer_result
  
  ! assigning values
  p = 2.0
  q = 3.0 
  i = 2
  j = 3

  ! floating point division
  real_result     = p/q
  integer_result  = i/j

  print *, real_result
  print *, integer_result

end program division

