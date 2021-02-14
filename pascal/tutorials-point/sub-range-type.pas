program subrange;

var                     { these are supposed to restrict the type }
  marks: 1..100;        { but they are not working, at least not  }
  grade: 'A' .. 'E';    { with the current free pascal config...  }
                        { which means, any charcter of integer    }
                        { seems to be valid.                      }

begin
  writeln('Enter your marks (1 .. 100): ');
  readln(marks);

  writeln('Enter your grade (A .. E): ');
  readln(grade);

  writeln('Marks: ', marks);
  writeln('Grade: ', grade);

  readln;
end.

