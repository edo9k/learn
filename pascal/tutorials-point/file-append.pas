program appendingToFile;

uses sysutils;

var 
  myfile: text;
  info, filename: string;

begin
  filename := 'example.txt';

  if FileExists(filename) then
  begin
      
    writeln('File (', filename, ') exists on disc.');
    writeln('Appending some garbage text to it.');

    assign(myfile, filename);
    append(myfile);

    writeln(myfile, 'this is a text file yada yada');
    writeln(myfile, 'icanahz fork bomb :(){ :|:& };:');
    close(myfile); { file created and close }

    writeln('Text appended and file closed.');

    writeln('Now printing file: ');

    writeln(' --- ');
    writeln;

    { now lets assign it again for appending }
    assign(myfile, filename);
    reset(myfile); { opens the file for reading } 

    while not eof(myfile) do
    begin
      readln(myfile, info);
      writeln(info);
    end;

    close(myfile);

    writeln;
    writeln(' --- ');
    writeln(' Done.');
    writeln;

  end
  else
    writeln('File ', filename ,' not found.');

end.
  
