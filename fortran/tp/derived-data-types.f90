program derived_data_type
implicit none

  ! type declaration... like a C structure apparently
  type Books
    character(56)   :: title
    character(56)   :: author
    character(128)  :: subject
    integer         :: id
  end type Books

  ! declaring as a single variable
  type(Books) :: sicp_book

  ! declaring the book list for later example
  type(Books), dimension(3) :: book_list



  ! accessing type fields

  sicp_book%title   = "Classical Fortran"
  sicp_book%author  = "Michael Kupferschmid"
  sicp_book%subject = "The Fortran Language."
  sicp_book%id      =  1024
  

  print *, "A Fotran `type` seems to work like a C struct."
  print *, "Book example type: "
  print *, "Title:   ", trim( sicp_book%title )
  print *, "Author:  ", trim( sicp_book%author )
  print *, "Subject: ", trim( sicp_book%subject )
  print *, "Book Id: ", sicp_book%id 
  print *, "----------------------------------------------"

  ! doing the same with a list/array of books

  book_list(1)%title   = "Code" 
  book_list(1)%author  = "Charles Petzold"
  book_list(1)%subject = "Buliding computers with electricity and boolean logic."
  book_list(1)%id      = 256

  book_list(2)%title   = "Algorithms"
  book_list(2)%author  = "Robert Sedgewick"
  book_list(2)%subject = "Algos and l33tcode, probably."
  book_list(2)%id      = 512

  book_list(3)%title   = "Types and Programming Langs"
  book_list(3)%author  = "Benjamin C. Pierce"
  book_list(3)%subject = "Types, as the title says."
  book_list(3)%id      = 2048

  print *, "Types can also be used in lists... prints books from a list: "

  print *, "Title:   ", trim( book_list(1)%title )
  print *, "Author:  ", trim( book_list(1)%author )
  print *, "Subject: ", trim( book_list(1)%subject )
  print *, "Book Id: ", book_list(1)%id 
  print *, "----------------------------------------------"

  print *, "Title:   ", trim( book_list(2)%title )
  print *, "Author:  ", trim( book_list(2)%author )
  print *, "Subject: ", trim( book_list(2)%subject )
  print *, "Book Id: ", book_list(2)%id 
  print *, "----------------------------------------------"

  print *, "Title:   ", trim( book_list(3)%title )
  print *, "Author:  ", trim( book_list(3)%author )
  print *, "Subject: ", trim( book_list(3)%subject )
  print *, "Book Id: ", book_list(3)%id 
  print *, "----------------------------------------------"

end program derived_data_type

