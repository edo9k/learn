
{$mode objfpc}  { tell compiler we're using object orientation }
{$m+}           { tell compiler we're using constructors }

program usingClasses;

type 
  Rectangle = class

    private
      length, width: integer;

    public
      constructor create(l, w: integer);
      
      procedure setlength(l: integer);
      function getlength(): integer;
      
      procedure setwidth(w: integer);
      function getwidth(): integer;

      procedure draw;
  end;   

var
  r1: Rectangle;

constructor Rectangle.create(l, w: integer);
begin
  length := l;
  width := w;
end;

procedure Rectangle.setlength(l: integer);
begin
  length := l;
end;

procedure Rectangle.setwidth(w: integer);
begin
  width := w;
end;

function Rectangle.getlength(): integer;
begin
  getlength := length;
end;

function Rectangle.getwidth(): integer;
begin
  getwidth := width;
end;

procedure Rectangle.draw;
var
  i, j: integer;

begin
  for i := 1 to length do
  begin
    for j := 1 to width do
      write(' * ');
    writeln;
  end;
end;


begin { main }
  writeln;

  r1 := Rectangle.create(3, 7);

  writeln('draw rectangle: ', r1.getlength(), ' by ', r1.getwidth());
  writeln;

  r1.draw;
  writeln;

  { change properties and draw again }
  r1.setlength(4);
  r1.setwidth(6);

  writeln('draw rectangle: ', r1.getlength(), ' by ', r1.getwidth());
  writeln;
   
  r1.draw;
  writeln;

end.

