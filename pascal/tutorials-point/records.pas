program usingRecords;

type 
Books = record
  title   : packed array [1..50]  of char;
  author  : packed array [1..50]  of char;
  subject : packed array [1..100] of char;
  id      : longint;
end;

var 
  book1, book2: Books; 

procedure printBook(b : Books);
begin
  writeln(' --- book #', b.id, ' --- ');
  writeln(' Title:   ', b.title);
  writeln(' Author:  ', b.author);
  writeln(' Subject: ', b.subject);
  writeln;
end;

begin
  { first book info } 
  book1.title   := 'Project Oberon';
  book1.author  := 'Niklaus Wirth';
  book1.subject := 'The Oberon Operating System';
  book1.id      := 1234;
  
  { second book info } 
  book2.title   := 'Hyperion';
  book2.author  := 'Dan Simmons';
  book2.subject := 'Hardcore SciFi';
  book2.id      := 4321;

  { print books }
  printBook(book1);
  printBook(book2);

end.
  
