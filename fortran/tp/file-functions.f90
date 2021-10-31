program file_input_output
implicit none

  real, dimension(100) :: x, y
  real, dimension(100) :: p, q
  integer :: i

  print *, "creating an example file"

  ! creating data
  do i = 1, 20
    x(i) = i * 0.1
    y(i) = sin( x(i) ) * (1 - cos( x(i) / 3.0) )
  end do


  ! output data into a file
  open(1, file = "file-example.dat", status = 'new')

  do i = 1, 20
    write(1, *) x(i), y(i)
  end do

  close (1)

  print *, " `file-example.dat` created, handle closed"


  ! displaying data from file   
  print *, "opening file and printing the data"

  open(2, file = "file-example.dat", status = 'old')
  
  do i = 1, 20
    read(2, *) p(i), q(i)
  end do

  close (2)

  do i = 1, 20
    write (*,*) p(i), q(i)
  end do

end program file_input_output

