program FileHandling;

type
  StudentRecord = Record
    name      : String;
    address   : String;
    batchcode : String;
  end;

var
  student : StudentRecord;
  f: file of StudentRecord;

{ storing data in a file }
procedure storeInfile;
begin
  assign(f, 'files-students.dat');
  rewrite(f);
  student.name := 'Fulano de Tal';
  student.address := 'Av. A, Rua R, Casa 1.';
  student.batchcode := 'Computação';
  write(f, student);
  close(f);
end;

{ retrieving data from a file }
procedure readFromFile;
begin
  assign(f, 'files-students.dat');
  reset(f);

  while not eof(f) do
  begin
    read(f, student);
    writeln('Name:       ', student.name);
    writeln('Address:    ', student.address);
    writeln('Batch code: ', student.batchcode);
  end;

  close(f);
end;



begin
  storeInfile;
  readFromFile;

  writeln;
end.

