program array_arbitrary_size
implicit none 

  integer, dimension (10) :: my_array
  integer :: i

  interface

    subroutine fill_array (a)
      integer, dimension(:), intent (out) :: a
      integer :: i
    end subroutine fill_array

    subroutine print_array (a)
      integer, dimension(:) :: a
      integer :: i
    end subroutine print_array

  end interface

  print *, "You can use size(array) to query the size of an array."

  call fill_array (my_array)
  call print_array (my_array)

end program array_arbitrary_size


subroutine fill_array (a)
implicit none
  
  integer, dimension (:), intent (out) :: a

  ! local variables
  integer :: i, array_size
  array_size = size(a)

  do i = 1, array_size
    a(i) = 1
  end do

end subroutine fill_array


subroutine print_array (a)
implicit none

  integer, dimension (:) :: a
  integer :: i, array_size
  array_size = size(a)

  do i = 1, array_size
    print *, a(i)
  end do

end subroutine print_array

