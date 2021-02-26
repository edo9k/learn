
{ this program uses the small unit 
  built in this lesson }

program usingMyUnit;
uses unitcalc, crt;

var
  l, w, r, a, b, c, area: real;

begin
  clrscr;

  l := 5.4;
  w := 4.7;

  area := RectangleArea(l, w);
  writeln('The area of rectangle ', l:1:1, ' x ', w:1:1, ' is ', area:7:3 );

  r := 7.0;
  area := CircleArea(r);
  writeln('Area of Circle with radius ', r:1:1, ' is ', area:7:3 );

  a := 3.0;
  b := 4.0;
  c := 5.0;

  area := TriangleArea(a, b, c);
  writeln('Area of triangle ', a:1:1, ' x ', b:1:1, ' x ', c:1:1, ' is ', area:7:3 );
end.

