program ProceduresAndFunctions;

const 
  NUM1 =  42;
  NUM2 =  69;
  NUM3 = 171;

var
  minimal : integer; { will be changed by procedure }
  

{ the input paremeters are both of the integer type }
{ the return paremeter is too, of the integer type  }
function max(a, b: integer): integer;
var { local variables to the function }
  result: integer;

begin
  if ( a > b ) then
    result := a
  else
    result := b;

  max := result; { Wirth really messed this one }
  { how about a fu--ing RETURN statement mate?  }
  { IE: you assign the return value to the name }
  { of the function. Which is pretty weird.     }

end;

function better_max(a, b: integer): integer;
begin
  if a > b then better_max := a
  else better_max := b;
end;


procedure find_min(x, y, z: integer; var m: integer); { <- pointer here }
begin
  if x < y then m:= x
  else m:= y;

  if z < m then m := z;
end;

begin
  writeln('function should return the higher number. ');
  writeln('the numbers are: ( ', NUM1, ' ) and ( ', NUM2 , ' ). ');
  writeln('result is: ', max(NUM1, NUM2) );
  writeln;
  writeln('getting the lowerst of three numbers with a procedure. ');
  writeln('the numbers are: ( ', NUM1, ', ', NUM2, ', ', NUM3, ' ) ');
  find_min( NUM1, NUM2, NUM3, minimal ); { procedure call }
  writeln(' lowest number is: ', minimal );

end.

