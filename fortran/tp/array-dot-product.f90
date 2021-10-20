program array_multiplication
implicit none

  real, dimension(5) :: a, b
  integer :: i, asize, bsize

  asize = size(a)
  bsize = size(b)

  do i = 1, asize
    a(i) = i
  end do

  do i = 1, bsize
    b(i) = i * 2
  end do

  print *, "--- array a ---"
  do i = 1, asize
    print *, a(i)
  end do

  print *, "--- array b ---"
  do i = 1, bsize
    print *, b(i)
  end do

  print *, "--- array dot product ---"
  print *, dot_product(a, b)

end program array_multiplication

