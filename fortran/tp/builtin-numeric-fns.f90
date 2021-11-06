program intrinsic_numeric_functions
implicit none

  ! consts and variables
  real    :: a, b
  complex :: z

  a =  15.2345
  b = -20.7689

  print *, "intrinsics (builtin) numeric functions: "
  print *, "variables used a: ", a, " b: ", b

  print *, "abs(a) = ", abs(a), " abs(b) = ", abs(b)
  print *, "aint(a) = ", aint(a), " aint(b) = ", aint(b)
  print *, "ceiling(a) = ", ceiling(a), " ceiling(b) = ", ceiling(b)
  print *, "floor(a) = ", floor(a), " floor(b) = ", floor(b)

  z = cmplx(a, b)
  print *, "complex number from (a,b) = (a)+i(b)"
  print *, "z: ", z

end program intrinsic_numeric_functions
