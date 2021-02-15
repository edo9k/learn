program if_then_else_case_etc;

const
  CURRENT_YEAR = 2021;

var
  yearOfBirth, age : integer;

begin
  writeln('Which f***ing year were you brought to this hell?');
  readln(yearOfBirth);

  age := CURRENT_YEAR - yearOfBirth;

  writeln('You are ', age ,' years old.');

  if (age >= 18) then
    writeln('You are legally an adult piece of shit.')
  else
    writeln('You are under age. Go watch Sesame Street.');

end.

