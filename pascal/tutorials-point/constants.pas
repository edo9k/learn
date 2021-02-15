program UsingConstants;

const PI = 3.141592654;

var
  radius, diameter, circumference : real;

begin
  writeln('Enter circle radius: ');
  readln(radius);

  diameter := 2 * radius;
  circumference := PI * diameter;

  writeln('The circumference of the circle is ', circumference:7:2);
end.

