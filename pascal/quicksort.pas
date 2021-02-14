{ Quicksort Pascal from RosettaCode.org }

var
  X: array [0..99] of integer;

procedure quicksort ( left, right : integer );
var 
  i, j, tmp, pivot : integer;
begin
  i := left;
  j := right;
  pivot := X[ (left + right) shr 1];
  
  repeat
    while pivot > X[i] do inc(i);
    while pivot < X[j] do dec(j);
    if i <= j then begin
      tmp := X[i];
      X[i] := X[j];
      X[j] := tmp;
      dec(j);
      inc(i);
    end;
  until i > j;

  if left < j then quicksort(left, j);
  if i < right then quicksort(i, right);
end;

procedure print_array ( a : array of integer );
var array_length, i : integer;
begin
  array_length := length(a);

  for i := 1 to array_length do
    write(a[i], ', ');
  writeln;
end;

procedure random_populate;
var array_length, i, min, max : integer;
begin
  randomize;

  min := 1;
  max := 1000;

  array_length := length(X); (* oops, global variable *)

  for i := 1 to array_length do
    X[i] := min + random(10000) mod max + 1;
end;

begin 
  writeln('-- the randomized array is:');
  random_populate;
  print_array(X);
  writeln('-- running quicksort & printing again');
  quicksort(0, 50);
  print_array(X);
end.
