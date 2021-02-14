program inheritance;

{$MODE OBJFPC} { create class directive }
{$M+} { use constructors directive }

type 
	Books = Class

	protected
		title: String;
		price: real;
	
	public
		constructor Create(t: String; p: real);

		procedure setTitle(t: String);
		function  getTitle(): String;

		procedure setPrice(p: real);
		function  getPrice(): real;
		
		procedure Display(); virtual;
end;


(* derived class *)

type
	Novels = Class(Books)
	
	private
		author: String;

	public
		constructor Create(t: String); overload;
		constructor Create(a: String; t: String; p: real); overload;
	
		procedure setAuthor(a: String);
		function  getAuthor(): String;

		procedure Display(); override;
end;


var 
	n1, n2: Novels;


{ default constructor }
constructor Books.Create(t: String; p: real);
begin
	title := t;
	price := p;
end;

procedure Books.setTitle(t: String);
begin
	title := t;
end;

function Books.getTitle(): String;
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

procedure Books.Display();
begin
	writeln('Title: ', title);
	writeln('Price: ', price);
end;

(* derived class methods *)

constructor Novels.Create(t: String);
begin
	inherited Create(t, 0.0);
	author := ' ';
end;

constructor Novels.Create(a: String; t: String; p: real);
begin
	inherited Create(t, p);
	author := a;
end;

procedure Novels.setAuthor(a: String);
begin
	author := a;
end;

function Novels.getAuthor(): String;
begin
	getAuthor := author;
end;

procedure Novels.Display();
begin
	writeln('Title:  ', title);
	writeln('Price:  ', price:5:2);
	writeln('Author: ', author);
end;


{ main program }
begin
	n1 := Novels.Create('Capitães de Areia');
	n2 := Novels.Create('Machado de Assis', 'Dom Casmurro', 36.99);
	
	n1.setAuthor('Jorge Amado');
	n1.setPrice(27.99);
	
	n1.Display; writeln;
	n2.Display; writeln;
end.
