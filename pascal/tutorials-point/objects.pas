program usingObjects;

{
  apparently, pascal has 'objects' that are concrete
  instances, a bit like javascript objects, created
  without having to be instancited from a class. 

  in this lesson the subject were these 'pascal objects'
  the next lesson will be about actual classes.
}

type 
  Rectangle = object
    private
      length, width: integer;
    public
      procedure setlength(l: integer);
      function getlength(): integer;
      procedure setwidth(w: integer);
      function getwidth(): integer;
      procedure draw;
  end;

  TableTop = object (Rectangle)
    private
      material: string;
    public
      function getmaterial(): string;
      procedure setmaterial(m: string);
      procedure displaydetails;
      procedure draw;
  end;

var
  tt1: TableTop;

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

function TableTop.getmaterial(): string;
begin
  getmaterial := material;
end;

procedure TableTop.setmaterial(m: string);
begin
  material := m;
end;

procedure TableTop.displaydetails;
begin
  writeln('table top: ', self.getlength(), ' by ', self.getwidth());
  writeln('material:  ', self.getmaterial());
end;

procedure TableTop.draw();
var 
  i, j: integer;
begin
  for i := 1 to length do
  begin
    for j := 1 to width do
      write(' * ');
    writeln;
  end;
  writeln;
  writeln('material: ', material);
end;

begin { main }
  tt1.setlength(3);
  tt1.setwidth(7);
  tt1.setmaterial('Vibranium');
  tt1.displaydetails();
  writeln;

  writeln('calling the draw method');
  writeln;

  tt1.draw();

end.

