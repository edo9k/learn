program char_trim
implicit none

  character(88) :: longstring

  longstring = "the text is shorter than string size"

  print *, "if you print text without using `trim`: "
  print *, "|", longstring, "|"
  print *, "print the same text using `trim`: " 
  print *, "|", trim(longstring), "|"

end program char_trim

