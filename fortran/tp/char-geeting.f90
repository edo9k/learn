program greet
implicit none

  character(len = 12) :: first_name, last_name
  character(len = 6)  :: title
  character(len = 32) :: greeting

  title = "Sir"
  first_name = "Vlad"
  last_name  = "The Impaler" 
  greeting   = "All Hail."

  print *, "There comes ", title, first_name, last_name
  print *, greeting 

end program greet

