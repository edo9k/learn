program subroutine_recursive
implicit none

  integer :: f, fact_ ! you must explict function return type too

  print *, "get factorial with recursion, where n = 15"
  f = fact_(5)

  print *, f

end program subroutine_recursive


recursive function fact_ (n) result (answer)
implicit none
  
  integer :: answer
  integer, intent (in) :: n

  select case (n)
    case (0:1)
      answer = 1
    case default
      answer = n * fact_ ( n - 1 )
  end select

end function fact_ 

