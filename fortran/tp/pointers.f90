program pointers
implicit none

  integer, pointer  :: my_pointer
  integer, target   :: first_target
  integer, target   :: second_target

  my_pointer => first_target
  my_pointer = 2021

  print *, "printing the a value from the same address"
  print *, "via the pointer ->  ", my_pointer
  print *, "via the variable -> ", first_target
  
  print *, "mutating the variable and printing again"

  first_target = first_target + 1
  print *, "via the pointer ->  ", my_pointer
  print *, "via the variable -> ", first_target
  
  print *, "mutating with a reassignment to value 1984"

  first_target = 1984
  print *, "via the pointer ->  ", my_pointer
  print *, "via the variable -> ", first_target
  
  print *, "reset pointer with `nullify`"

  nullify(my_pointer)

  print *, "the variable is still -> ", first_target

  print *, "set pointer to different variable"

  my_pointer => second_target

  print *, "query association with `associated` -> ", associated(my_pointer)
  print *, "querying is pointer is associated with a specific variable"
  print *, "pointer -> first variable?  ", associated(my_pointer, first_target)
  print *, "pointer -> second variable? ", associated(my_pointer, second_target)

  print *, "current values of pointer and second variable"
  print *, my_pointer
  print *, second_target

  print *, "changing the variable by assigning something to the pointer"
  
  my_pointer = 2001

  print *, my_pointer
  print *, second_target

end program pointers

