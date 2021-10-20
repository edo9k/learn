program array_section_assignment
implicit none

  real, dimension(10) :: a, b
  integer :: i, asize, bsize

  a( 1: 7) = 5.0  ! assign 5. from index 1 to 7
  a( 8:  )  = 0.0 ! assign 0. to the rest

  b( 2:10: 2) = 3.9 ! assign to indexes +2, from 2 to 10
  b( 1: 9: 2) = 2.5 ! assign to indexes +2, from 1 to  9


  ! assign array sizes
  asize = size(a)
  bsize = size(b)

  print *, "you can mass assign arrays according to the rules:"
  print *, "array( <start index> : <end index> : <step size> )"

  print *, " --- array a --- "
  do i = 1, asize
    print *, a(i)
  end do

  print *, " --- array b --- "
  do i = 1, bsize
    print *, b(i)
  end do

end program array_section_assignment

