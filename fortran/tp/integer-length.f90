program integer_size
implicit none

  ! two byte integer
  integer(kind = 2) :: shortvar

  ! four byte integer
  integer(kind = 4) :: longvar

  ! eight byte integer 
  integer(kind = 8) :: longlongvar

  ! sixteen byte integer
  integer(kind = 16) :: longlonglongvar

  ! default
  integer :: normalvar

  print *, huge(shortvar)
  print *, huge(normalvar)
  print *, huge(longvar)
  print *, huge(longlongvar)
  print *, huge(longlonglongvar)
  
end program integer_size
