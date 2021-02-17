program recursion;

function factorial(x : integer) : integer;
begin
  if x = 0 then factorial := 1
  else factorial := x * factorial (x - 1);
end;

function fibonacci(x : integer) : integer;
begin
  if x=1 then 
    fibonacci := 0
  else if x=2 then 
    fibonacci := 1
  else
    fibonacci := fibonacci(x - 1) + fibonacci(x - 2);
end;

begin
  writeln('factorial of 6: ', factorial(6));
  writeln('fibonacci of 6: ', fibonacci(6));
end.

