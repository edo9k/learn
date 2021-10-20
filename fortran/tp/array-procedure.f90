program pass_array_to_procedure
implicit none

  integer, dimension (5) :: my_array
  integer :: i 

  call fill_array  (my_array)
  call print_array (my_array)

end program pass_array_to_procedure


subroutine fill_array (a)
implicit none
  
  integer, dimension (5), intent (out) :: a

  ! local variables
  integer :: i

  do i = 1, 5
    a(i) = i
  end do

end subroutine fill_array


subroutine print_array (a)

  integer, dimension (5) :: a
  integer :: i

  do i = 1, 5
    print *, a(i)
  end do

end subroutine print_array

