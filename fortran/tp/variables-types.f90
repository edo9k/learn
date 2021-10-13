program variable_types
implicit none

  ! declaration
  integer :: total
  real    :: average
  complex :: cx
  logical :: done
  character(len = 56) :: message ! a string of 56 characters

  ! assigning values
  total   = 5999
  average = 3.14
  done    = .true.
  message = "Hi, from Fotran." 
  cx      = (3.0, 5.0) ! cx = 3.0 + 5.0i

  print *, total
  print *, average
  print *, cx
  print *, done
  print *, message

end program variable_types

