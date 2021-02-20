program usingBooleans;

label again;

var 
  exit: boolean;
  choice: char;

begin
  again:
  writeln('continue this bullshit example? ');
  writeln(' [Y]es / [N]o ');
  readln(choice);

  if choice = 'n' then
    exit := true
  else 
    exit := false;

  if exit then 
    writeln('exiting...')
  else
  begin
    writeln('go on...');
    goto again;
  end;

  readln;
end.

