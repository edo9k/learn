program concat
implicit none

  character(len = 5) :: word1, word2
  character :: comma, exclamation, space
  character(len = 26) :: message

  word1 = "Hello"
  word2 = "World"
  comma = ","
  space = " "
  exclamation = "!"

  message = word1//comma//space//word2//exclamation

  print *, "printing message using string the concat `//` operator"
  print *, message

end program concat

