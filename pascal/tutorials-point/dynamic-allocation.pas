program usingDynamicAllocation;

var
  name: array[1..100] of char;
  description: ^string;
  desp: string;

begin
  name := 'Niklaus Wirth';
  desp := 'The creator of Algol W, Pascal, Modula and Oberon.';

  description := getmem(50); 
  { if you allocate less memory then needed     }
  { the runtime will through an error 216       }
  { which means you tried to access an address  }
  { you had not right to. (or derefenced a nil) }

  if not assigned(description) then
    writeln('Error - unable to allocate required memory')
  else
    description^ := desp;
  
  { we can use reallocmem to allocate more space }
  description := reallocmem(description, 100);
  desp := desp + ' He also created the Oberon OS.';
  description^ := desp;
  
  writeln('       Name: ', name);
  writeln('Description: ', description^);

  freemem(description); { deallocate space }
end.

