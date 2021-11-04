module constants
implicit none
  
  real, parameter, private :: pi = 3.1415
  real, parameter, private :: e  = 2.7182

contains

  subroutine show_consts()
    print *, "pi = ", pi
    print *, "e  = ", e
  end subroutine show_consts

  function e_power_x(x) result (epx)
  implicit none
    real :: x
    real :: epx
    epx = e ** x
  end function e_power_x

  function area_circle(r) result(a)
  implicit none
    real :: r
    real :: a
    a = pi * r ** 2
  end function area_circle

end module constants


program using_module
use constants
implicit none

  call show_consts()

  print *, "e raised to the power of 2.0 = ", e_power_x(2.0)
  print *, "area of a circle with radius 7.0 = ", area_circle(7.0)

end program using_module 

