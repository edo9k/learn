program usingConstructorsAndDestructors;

{$mode objfpc}
{$m+}

type
  Books = class
  private
    title: string;
    price: real;

  public
    constructor Create(t: string; p: real); { default }

    procedure setTitle(t: string); { setter }
    function getTitle(): string;   { getter }

    procedure setPrice(p: real);   { setter }
    function getPrice(): real;     { getter }

    procedure display();
  end;

var
  physics, chemistry, maths: Books;

constructor Books.Create(t: string; p: real);
begin
  title := t;
  price := p;
end;

procedure Books.setTitle(t: string);
begin
  title := t;
end;

function Books.getTitle(): string;
begin
  getTitle := title;
end;

procedure Books.setPrice(p: real);
begin
  price := p;
end;

function Books.getPrice(): real;
begin
  getPrice := price;
end;

procedure Books.display();
begin
  writeln;
  writeln('title: ', title);
  writeln('price: ', price:5:2);
  writeln;
end;


begin { main } 
  physics := Books.create('physics for high school', 10);
  chemistry := Books.create('chemistry for making drugs', 15);
  maths := Books.create('algebra linear', 7);

  physics.display;
  chemistry.display;
  maths.display;

end. 

