program complex_arithmetic 
implicit none

  ! constant
  complex, parameter :: i = (0, 1) ! square root of -1 

  ! working variables
  complex :: x, y, z

  print *, "Since Fotran is mostly used in Maths and Physics, it comes with"
  print *, "complex number support out of the box. "

  x = (7,  8)
  y = (5, -7)

  print *, " constant i -> ", i
  print *, " variable x -> ", x
  print *, " variable y -> ", y

  print *, " computing f(i,x,y) = i * x * y "
  write (*,*) i * x * y

  z = x + y 
  print *, " z = x + y -> ", z

  z = x - y
  print *, " z = x - y -> ", z

  z = x * y
  print *, " z = x * y -> ", z

  z = x / y
  print *, " z = x / y -> ", z

end program complex_arithmetic

