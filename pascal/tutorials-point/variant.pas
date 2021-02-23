program usingVariantType;

{ 
 Free Pascal autolinks the "variant" unit. 
 But depending on the compiler you might have to link it yourself.
 with 

 uses variatns;
}


type
  PrimaryColor = (red, green, blue); 

var
  { variant types accept any other simple type  }
  { and type is determined during runtime       }
  v   : variant;

  i   : integer;
  r   : real;
  c   : PrimaryColor;
  as  : ansistring;

begin 
  i := 100;
  v := i; { assigning an integer }
  writeln('variant as integer: ', v);

  r := 123.345;
  v := r; { assigning a real }
  writeln('varian as real: ', v);

  c := red;
  v := c; { assinging enum type PrimaryColor }
  writeln('variant as enum data: ', v);

  as := 'this is an AnsiString';
  v := as;
  writeln('variant as AnsiString: ', v);

  writeln;
end.

