program usingSets;

{ 
  pascal has a bunch of builtin functions to work with sets
  and you can add, diff, and a bunch of stuff to them,
  just like you can do with numbers. which is neat. 
  i'm not sure "sets are first class citizen" is a concept, 
  but i seems it could be.
}

type { we're using colors are examples }
  color = (red, blue, yellow, green, white, black, orange);
  colors = set of color;

function toString(c : colors) : string;
const
  names : array [color] of String[7]
    = ('red', 'blue', 'yellow', 'green', 'white', 'black', 'orange');

var
  cl  : color;
  s   : string;

begin 
  s := ' ';
  for cl := red to orange do
    if cl in c then
    begin
      if (s <> ' ') then s := s + ', ';
      s := s + names[cl];
    end;
    toString := '[ ' + s + ' ]';
end;


var
  a, b, c : colors;

begin
  a := [  red,    blue,   yellow  ];
  b := [  yellow, green,  white   ];
  c := [  white,  blue,   black   ];

  writeln('example sets we are using ');
  writeln('set a: ', toString( a ));
  writeln('set b: ', toString( b ));
  writeln('set c: ', toString( c ));
  writeln;

  writeln('union of sets with operator + ');
  writeln(' a + b ', toString( a + b ));
  writeln(' c + b ', toString( c + b ));
  writeln;

  writeln('difference of sets with operator - ');
  writeln(' a - b ', toString( a - b ));
  writeln(' c - b ', toString( c - b ));
  writeln;

  writeln('intersection of sets with operator * ');
  writeln(' a * b ', toString( a * b ));
  writeln(' c * b ', toString( c * b ));
  writeln;

  writeln('symmetric diffecence of two sets with >< ');
  writeln(' a >< b ', toString( a >< b ));
  writeln(' c >< b ', toString( c >< b ));
  writeln;

  writeln('check equality of two sets with = ');
  writeln(' a = b ', a = b ); { returns a boolean }
  writeln(' a = a ', a = a );
  writeln;

  writeln('check non-equality of two sets with <> ');
  writeln(' a <> b ', a <> b ); { returns a boolean }
  writeln(' a <> a ', a <> a );
  writeln; 

  writeln('check one set contains the other with <= ');
  writeln(' a <= b ', a <= b );
  writeln(' a <= a ', a <= a );
  writeln;

end.

