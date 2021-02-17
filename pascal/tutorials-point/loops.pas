program RepetitionStructures;

label do_it_again;

const MAX = 10;

var index : integer;

begin
  { using while }
  writeln('counting with while: ');
  index := 0;
  while index < MAX do
  begin
    index := index + 1;
    write(index, '... ' );
  end;
  writeln;

  { using for }
  writeln('counting with for: ');
  for index := 1 to 10 do write(index, '... ');
  writeln;

  { using repeat until } 
  writeln('counting with repeat-until: ');
  index := 0;
  repeat
    index := index + 1;
    write(index, '... ');
  until index = 10;
  writeln;

  { using a while and break }
  writeln('stopping the count with a ~break~');
  index := 0;
  while true do
  begin
    index := index + 1;
    write(index, '... ');
    if index = 10 then break;
  end;

  { loop mom, no loop structure }
  writeln('counting with the DREATED __UNSAFE__ !!GOTO!! STATEMENT, booo');
  index := 0;
  do_it_again:
  index := index + 1;
  write(index, '... ');
  if index < 10 then goto do_it_again;
  writeln;

  writeln(' --- the end of loops --- ');
end.

