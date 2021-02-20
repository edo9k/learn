program usingPointers;

var 
  aNumber  : integer;
  aPointer : ^integer;
  y        : ^word;

begin
  aNumber := 6502;
  writeln('aNumber value: ', aNumber);
  writeln;

  aPointer := @aNumber; { memory location = pointer }
  writeln('aPointer points to value: ', aPointer^); 
  writeln;

  writeln('overwriting aPointer position with value 8086');
  aPointer^ := 8086;
  writeln;

  writeln('aNumber value: ', aNumber);
  writeln('aPointer value: ', aPointer^);
  writeln;

  writeln('printing memory position.');
  y := addr(aPointer);
  writeln('memory position of aPointer is: ', y^);
  writeln;

  writeln('pointers can also point nowhere (NIL)');
  y := nil;

end.

