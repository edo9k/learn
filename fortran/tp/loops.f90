program loops
implicit none

  ! working variables
  integer :: n, nfactorial
  integer :: i, j

  ! the `do` is fortran `for` apparently
  print *, "Printing a sequence with a 'do' block: "

  do n = 90, 99
    print *, n
  end do


  ! the mandatory factorial exmaple
  print *, "Printing the 10th factorial: "
  nfactorial = 1

  do n = 1, 10
    nfactorial = nfactorial * n
    print *, n, " ", nfactorial
  end do


  ! same, but now with a do-while
  print *, "Same factorial again, but now with a do-while block: "

  n = 1
  nfactorial = 1

  do while (n <= 10)
    nfactorial = nfactorial * n
    n = n + 1
    print *, n, " ", nfactorial
  end do

  ! nested loops
  print *, "And to finish, nesting two do loops: "

  iloop: do i = 1, 3
    print *, "i -> ", i

    jloop: do j = 1, 3
      print *, "  j -> ", j

    end do jloop
  end do iloop

end program loops

