-module(guards_).
-export([display/1, centuryCheck/1, severalChecks/1, start/0]).

display(N) when N > 10 ->
  io:fwrite("greater than 10 ~n");
display(N) when N < 10 ->
  io:fwrite("less than 10 ~n");
display(10) ->
  io:fwrite("exactly 10 ~n").


centuryCheck(Year) ->
  if Year > 2000 ->
       io:fwrite("We're in the XXI Century. ~n");
     true ->
       io:fwrite("This is the default option. ~n")
  end.


severalChecks(Param) when Param < 256, Param > -1, is_integer(Param) ->
  io:fwrite("input number fits in a byte");
severalChecks(_) ->
  io:fwrite("input is either NaN of doesn't fit in a byte").


start() ->

  io:fwrite("calling display with 9 ~n"),
  display(9),

  io:fwrite("calling display with 10 ~n"),
  display(10),

  io:fwrite("calling display with 11 ~n"),
  display(11),

  % simple if statement
  centuryCheck(2022),

  % function with many guards
  severalChecks(255),
  severalChecks(256),
  severalChecks("is this gonna crash?").

