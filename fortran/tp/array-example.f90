program array_example
implicit none

  real    :: float_array(5)  ! one dimensional float array
  integer :: int_matrix(3,3) ! two dimensional int array
  integer :: i, j ! counters

  ! assigning values
  do i = 1, 5
    float_array(i) = i * 1.111
  end do

  ! displaying values
  do i = 1, 5
    print *, float_array(i)
  end do

  ! assigning 2d matrix
  do i = 1, 3
    do j = 1, 3
      int_matrix(i, j) = i * 10 + j
    end do
  end do

  ! displaying 2d matrix
  do i = 1, 3
    do j = 1, 3
      print *, int_matrix(i, j)
    end do
  end do

  ! shorthand assignment
  float_array = (/ 1.1, 2.2, 3.3, 4.4, 5.5 /)

  ! displaying values
  do i = 1, 5
    print *, float_array(i)
  end do

end program array_example

