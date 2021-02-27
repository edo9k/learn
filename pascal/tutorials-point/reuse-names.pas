program reusingNames;

{
  apparently, as long as the signature is different
  you can reuse the same function/procedure name
  as many times as you want.

  which is neat.
}

procedure sum(a, b: integer);
begin
  writeln('procedure sum com dois parametros');
  writeln(' a: (', a, ') b: (', b, ') -> ', a + b );
  writeln;
end;

procedure sum(a, b, c: integer);
begin
  writeln('procedure sum com dois parametros');
  writeln(' a: (', a, 
    '), b: (', b, 
    '), c: (', c ,
    ') -> ', a + b + c);

  writeln;
end;

begin
  writeln;
  sum(60, 9);

  writeln;
  sum(600, 60, 6);
end.

