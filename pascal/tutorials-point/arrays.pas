program usingArrays;

var 
  n : array [1..10] of integer;
  i : integer;

begin
  for i := 1 to 10 do
    n[i] := i + 100;

  for i := 1 to 10 do
    writeln('Element ', i ,' has value ', n[i]);

  writeln;
end.

