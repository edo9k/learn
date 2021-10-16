program if_then_else
implicit none

  ! local variable
  integer :: age = 17

  ! our logical check
  if ( age >= 18 ) then
    print *, "Adult, of age."
  else 
    print *, "Underage."
  end if

end program if_then_else
