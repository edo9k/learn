program usingInheritance;

{$mode objfpc}
{$m+}

type { base class }
  Books = class
  protected
    title: string;
    price: real;

  public
    constructor Create(t: string; p: real); { default }

    procedure setTitle(t: string); { setter }
    function getTitle(): string;   { getter }

    procedure setPrice(p: real);   { setter }
    function getPrice(): real;     { getter }

    procedure display(); virtual;
  end;

type { derived class }
  Novels = class(Books)
  private
    author: string;

  public
    constructor Create(t: string); overload;
    constructor Create(a: string; t: string; p: real); overload;

    procedure setAuthor(a: string); 
    function getAuthor(): string;

    procedure display(); override;
  end;

var 
  n1, n2: Novels;

{ default constructor }
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

{ derived class constructor }
constructor Novels.Create(t: string);
begin
  inherited Create(t, 0.0);
  author := ' ';
end;

constructor Novels.Create(a: string; t: string; p: real);
begin
  inherited Create(t, p);
  author := a;
end;

procedure Novels.setAuthor(a: string);
begin
  author := a;
end;

function Novels.getAuthor(): string;
begin
  getAuthor := author;
end;

procedure Novels.display();
begin
  writeln;
  writeln('title:  ', title);
  writeln('price:  ', price:5:2);
  writeln('author: ', author);
  writeln;
end;


begin { main } 
  n1 := Novels.Create('Gone with the Wind');
  n1.setAuthor('Margaret Mitchell');
  n1.setPrice(67.99);

  n2 := Novels.Create(
    'Stephen Hawkin',
    'A Brief History of Time',
    69.99
  );

  n1.display;
  n2.display;

end. 

