program array_multiplication
implicit none

  integer, dimension(3,3) :: a, b, c 
  integer :: i, j


  print *, "--- assinging arrays ---"

  do i = 1, 3
    do j = 1, 3
      a(i, j) = i + j
      b(i, j) = i * j

      print *, "a(", i, j, ") -> ", a(i,j), " <$> b(", i, j, ") -> ", b(i,j)
    end do
  end do

  print *, "--- multiplication of matrices A and B ---"

  c = matmul(a, b)

  do i = 1, 3
    do j = 1, 3
      print *, "result matrix (", i, j, ") -> ", c(i, j)
    end do
  end do

end program array_multiplication
      
