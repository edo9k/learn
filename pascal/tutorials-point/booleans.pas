program usingBooleans;

var 
  exit: boolean;
  choice: char;

begin
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
    writeln('go on...');

  readln;
end.

