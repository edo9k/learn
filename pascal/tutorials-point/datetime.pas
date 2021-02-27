program usingDateAndTime;
uses sysutils;

var
  year, month, day,
  hr, min, sec, ms :word;
   

begin
  writeln('Date and time at the time of writing: ', DateTimeToStr(Now));
  writeln('Today is: ', LongDayNames[DayOfWeek(Date)]);
  writeln;

  writeln('Details of Date: ');
  DecodeDate(Date, year, month, day);

  writeln( Format('Day: %d', [day]));
  writeln( Format('Month: %d', [month]));
  writeln( Format('Year: %d', [year]));
  writeln;

  writeln('Details of Time: ');

  DecodeTime(Time, hr, min, sec, ms);
  writeln( Format('Hour: %d: ', [hr]));
  writeln( Format('Minutes: %d: ', [min]));
  writeln( Format('Seconds: %d: ', [sec]));
  writeln( Format('Milliseconds: %d: ', [ms]));

end.

