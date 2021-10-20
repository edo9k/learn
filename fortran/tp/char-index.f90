program char_index
implicit none

  character(88) :: text
  integer :: i

  text = "You can access any char, a string is an array of char."
  i = index(text, "string")

  if (i /= 0) then
    print *, "The word `string` starts in the index -> ", i
    print *, "in the text:"
    print *, text
  end if

end program char_index
