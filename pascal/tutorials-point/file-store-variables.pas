{
  pascal allows you to persist variables in files. 
  and later restore and use them in your program. 
}

program fileVariables;

const MAX = 4;

type
  cashdata = file of real;

var 
  cashfile : cashdata;
  filename : string;

procedure writedata(var f: cashdata);
var
  data  : real;
  i     : integer;

begin
  rewrite(f, sizeof(data));
  for i := 1 to MAX do
  begin
    write('Enter cash data: ');
    readln(data);
 
    write(f, data);
 
    writeln;
  end;

  close(f);
end;

procedure performSum(var x: cashdata);
var 
  d, sum: real; 

begin
  reset(x);
  sum := 0.0; { note 1 }
 
  while not eof(x) do
  begin
    read(x, d);
    sum := sum + d;
  end;

  close(x);
  writeln('Total cash: ', sum:7:2);
end;

begin
  writeln('Enter wallet (file) name: ');
  readln(filename);
  assign(cashfile, filename);
  writedata(cashfile);
  performSum(cashfile);
end. 


{ 
  note 1:

    pascal does forces you to use the first 
    digit before the decimal sign. 
    whereas several languages would allow you 
    to just type -> .1234, pascal requires you 
    to add the zero -> 0.1234
    at least "FreePascal" the compiler I'm using.
}
 
