program subroutine_internal
implicit none 

  real :: a, b
  a = 2.0
  b = 3.0

  print *, "procedures can be nested."

  print *, "variables before swap: ", a, b
  call swap(a, b)

  print *, "variables after swap:  ", a, b 

  ! nesting function
  contains
    subroutine swap (a_, b_)
      real :: a_, b_, temp

      temp = a_
      a_   = b_
      b_   = temp

    end subroutine swap

end program subroutine_internal
