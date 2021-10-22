program dynamic_array
implicit none

  ! size is not known yet, but we know it's a 2d array
  real, dimension(:,:), allocatable :: dyn_array
  integer :: size1, size2
  integer ::  i,  j

  print *, "we can use `allocate` to define array size at runtime."
  print *, "enter array sizes (two numbers, comma or space separated)"

  read *, size1, size2

  ! allocate memory
  allocate( dyn_array(size1, size2) )

  do i = 1, size1
    do j = 1, size2
      dyn_array(i, j) = i * j 
      print *, "dyn_array(", i, ",", j, ") -> ", dyn_array(i, j)
    end do
  end do

  deallocate( dyn_array )

end program dynamic_array

