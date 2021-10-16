program select_case
implicit none

  ! local variable 
  integer :: grade = 42

  select case (grade)
    
    case (91:100)
      print *, "Excellent!"

    case (81:90)
      print *, "Very good!"

    case (71:80)
      print *, "Well done!"

    case (61:70)
      print *, "Not bad!"

    case (41:60)
      print *, "You passed!"

    case (:40)
      print *, "You flunked."

    case default
      print *, "Invalid grade."

  end select


  print *, "Your grade is ", grade

end program select_case
