program constants
implicit none

  ! to exemplify constants we're going to calculate
  ! motion under gravity (gravitacional drop)
  ! our constant will be `g` (gravitational acceleration
  real, parameter :: g = 9.81

  ! working variables
  real :: s ! displacement
  real :: t ! time
  real :: u ! initial speed

  ! assignment 
  t = 5.0
  u = 50

  ! displacement
  s = u * t - g * (t**2) / 2

  ! output
  print *, "Time = ", t
  print *, "Displacement = ", s

end program constants
