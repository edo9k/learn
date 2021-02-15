program operations;

begin
  
  { math operators }
  writeln('Math works as exptected.');
  writeln(' 1 + 1 = ',   1 + 1 );
  writeln(' 5 - 1 = ',   5 - 1 );
  writeln(' 3 * 3 = ',   3 * 3 ); 
  writeln(' 6 / 3 = ',   (6 / 3):2:2 );
  writeln(' 7 mod 3 = ', 7 mod 3, ' (i can haz module/resto operator too)');
  writeln;

  { comparison operators }
  writeln('Comparison operators too.');
  writeln;

  writeln('equal operator: ');
  writeln('1 = 1 : ',  1  = 1 );
  writeln('1 = 2 : ',  1  = 2 );
  writeln('1 = 3 : ',  1  = 3 );
  writeln;
  
  writeln('not-equal operator: ');
  writeln('1 <> 1 : ', 1 <> 1 );
  writeln('1 <> 2 : ', 1 <> 2 );
  writeln('1 <> 3 : ', 1 <> 3 );
  writeln;

  writeln('greater-than operator: ');
  writeln('1 > 1 : ',  1  > 1 );
  writeln('1 > 2 : ',  1  > 2 );
  writeln('1 > 3 : ',  1  > 3 );
  writeln;

  writeln('less-than operator: ');
  writeln('1 < 1 : ',  1  < 1 );
  writeln('1 < 2 : ',  1  < 2 );
  writeln('1 < 3 : ',  1  < 3 );
  writeln;

  writeln('greater-or-equal operator: ');
  writeln('1 >= 1 : ', 1 >= 1 );
  writeln('1 >= 2 : ', 1 >= 2 );
  writeln('1 >= 3 : ', 1 >= 3 );
  writeln;

  writeln('less-or-equal operator: ');
  writeln('1 <= 1 : ', 1 <= 1 );
  writeln('1 <= 2 : ', 1 <= 2 );
  writeln('1 <= 3 : ', 1 <= 3 );
  writeln;

  { boolean operators } 
  writeln('boolean operators too, but there are some surprises');

  writeln('true  and true  : ', true  and true  );
  writeln('true  and false : ', true  and false );
  writeln('false and false : ', false and false );
  writeln;
  
  writeln('true  or  true  : ', true  or  true  );
  writeln('true  of  false : ', true  or  false );
  writeln('false or  false : ', false or  false );
  writeln;

  writeln('not true  : ', not true  );
  writeln('not false : ', not false );
  writeln;

  { bitwise operators }
  writeln('And we have bitwise operators (half of programmers do not know those)');
  
  writeln('64 and 2 : ', 64 and  2);
  writeln('64 or  2 : ', 64 or   2);
  writeln(' not  64 : ',    not 64);

  writeln('64  << 3 : ', 64<<3);
  writeln('64  >> 3 : ', 64>>3);

  writeln('64 shl 3 : ', 64 shl 3);
  writeln('64 shr 3 : ', 64 shr 3);

end. 

