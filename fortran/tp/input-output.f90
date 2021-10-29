program input_output_examples


  ! printing options
  print_options: block

    pi = 3.141592653589793238

    print *, "printing PI with several format options: "

    print "(f6.3)",     pi
    print "(f10.7)",    pi 
    print "(f20.15)",   pi
    print "(e16.4)",    pi/100

  end block print_options


  ! simple input, and printing characters
  simple_input: block

    character (len = 33) :: author

    print *, "you can get user input with the `read` function: "
    print *, "enter the name of a book author (up to arbitrary 33 characters): "

    read *, author
    print "(1x,a)", author

  end block simple_input


  ! more print formatting options 
  formatted_print: block
    real                :: c = 1.2786456e-9, d = 0.1234567e3
    integer             :: n = 300789, k = 45, i = 2
    character (len=30)  :: source = "Fortran's F stands for Fun."

    print *, "formatted printings of integer, real and char types: "
    print "(i6)",   k 
    print "(i6.3)", k 

    print "(3i10)",        n, k,  i
    print "(i10, i3, i5)", n, k,  i

    print "(a30)", source

    print "(f12.3)", d 
    print "(e12.4)", c 

    print '(/,3x,"n = ", i6, 3x, "d = ", f7.4)', n, d

  end block formatted_print


  ! using the `format` statement
  format_statement: block
    ! definition
    character (len=15) :: name
    integer :: id
    real    :: weight
    
    ! assignment
    name   = "Alucard"
    id     = 42
    weight = 0.69

    ! excecution
    print *, "you can use the `format` command to shape text output: "

    print 100
    100 format (7x, 'Name: ', 7x, 'Id: ', 2x, 'Weight: ')

    print 200, name, id, weight
    200 format (1x, a, 2x, i3, 2x, f5.2)

  end block format_statement 

end program input_output_examples

