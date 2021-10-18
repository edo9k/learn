program loop_control
implicit none

  integer :: i

  ! using `exit` is like `break` in c languages
  print *, "breaking a loop using `exit`"

  do i = 1, 10
    print *, "looping, i -> ", i
    if ( i == 5 ) then
      print *, "breaking loop on i = 5 (using `exit`)"
      exit
    end if
  end do

  ! using `cycle` is like using `continue` in c languages
  print *, "using `cycle` to skip execution, and print only even numbers"

  do i = 1, 10
    if ( mod(i, 2) == 1 ) then
      cycle
    end if

    print *, i
  end do

  ! you can exit the program using the keyword `stop`

  print *, " -- ending the execution with `stop` -- "
  stop

  print *, "this line won't be printed, since the `stop` above will end the program"


end program loop_control

