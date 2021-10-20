program char_achar
implicit none

  character :: c
  integer   :: i

  print *, "You can convert from integer to char using the `achar` fn."

  do i = 65, 90
    c = achar(i)
    print *, i, ' -> ', c
  end do

end program char_achar

