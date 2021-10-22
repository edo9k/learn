program array_data_init
implicit none

  integer :: a(5), b(3, 3), c(10)
  integer :: i, j

  ! you can initialize arrays using the `data` keyword
  data a /7, 8, 9, 10, 11/

  ! it also works for sections of an array
  data b(1, :) /1, 1, 1/
  data b(2, :) /2, 2, 2/
  data b(3, :) /3, 3, 3/
  data (c(i), i = 1, 10, 2) /4, 5, 6, 7, 8/ ! inserts in i + 2 positions
  data (c(i), i = 2, 10, 2) /5 * 2/ ! inserts 2, 5 times in i + 2 positions

  print *, "the a array:"
  do i = 1, 5
    print *, a(i)
  end do

  print *, "----"
  print *, "the b array:"
  do i = lbound(b,1), ubound(b,1)
    write(*,*) (b(i,j), j = lbound(b,2), ubound(b,2))
  end do

  print *, "----"
  print *, "the c array"
  do i = 1, 10
    print *, c(i)
  end do 


end program array_data_init

