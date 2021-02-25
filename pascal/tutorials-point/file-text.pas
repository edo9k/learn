program usingTextFiles;

var 
  filename: string;
  myfile: text;

begin
  writeln('Enter filename: ');
  readln(filename);

  assign(myfile, filename);
  rewrite(myfile);

  writeln;

  writeln(myfile, 'This is an example textfile.');
  writeln(myfile, 'Another line of text and stuff.');
  writeln(myfile, 'Last line. Done. --');
  close(myfile);

  writeln('File written and close.');
end.

