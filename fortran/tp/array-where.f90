program array_where
implicit none

  integer :: a(3, 5)
  integer :: i, j

  do i = 1, 3
    do j = 1, 5
      a(i, j) = j - i
    end do
  end do


  print *, "the a array:"

  do i = lbound(a,1), ubound(a,1)
    write(*,*) (a(i,j), j = lbound(a,2), ubound(a,2))
  end do

  ! where condition can be used to selectively mutate an array
  ! based on the condition defined

  where (a < 0)
    a = 1
  elsewhere
    a = 5
  end where


  print *, "the a array after applying `where` condition: "

  do i = lbound(a,1), ubound(a,1)
    write(*,*) (a(i,j), j = lbound(a,2), ubound(a,2))
  end do

end program array_where

