program stringsAndUtils;

uses sysutils; { <- string utilities live here }

var s : ANSIString;

begin
  s := 'The Quick Brown Fox Jumps Over the Lazy Dog.';
  writeln('Using bunch of string functions: ');
  appendstr(s, ' (appended) ');
  writeln(s);
  writeln;

  writeln(' -- compareSTR is case sentitive, compareTEXT is not. ');
  writeln('comparstr   abc = ABC ? ', comparestr('abc',  'ABC'));
  writeln('comparetext abc = ABC ? ', comparetext('abc', 'ABC'));
  { 
    apparently the result is just getings ascii of character a 
    and subtracting the ascii number of character b. 
    if the result is 0, then they are the same.
  }
  writeln;

  writeln(' -- isValidIdent means "is this a valid pascal identifier?"');
  writeln('is 00var valid? ', isValidIdent('00var')); { i wonder if there's }
  writeln('is Death valid? ', isValidIdent('Death')); { an eval in Pascal   }
  writeln('is _ valid? ', isValidIdent('_')); { lodash.pas? hmmmm }
  writeln('is $ valid? ', isValidIdent('$')); { no jquery.pas tho } 
  writeln;

  { lastDelimiter(text, otherText) -> "text".lastIndexOf('char') } 
  writeln(' -- index of last occurence of character in string');
  writeln(' last x in the example sentence: ');
  writeln(' -> ', lastDelimiter('x', s));
  writeln;

  writeln(' -- get first n characters of text');
  writeln(' n=9 -> ', leftStr(s, 9));
  writeln(' -- get last n characters of text');
  writeln(' n=9 -> ', rightStr(s, 9));
  writeln;

  writeln(' LowerCase and UpperCase ');
  writeln( lowerCase(s) );
  writeln( upperCase(s) );
  writeln;

  writeln(' other functions: ');
  writeln(' https://www.freepascal.org/docs-html/rtl/sysutils/stringfunctions.html ');
  writeln;

end.

