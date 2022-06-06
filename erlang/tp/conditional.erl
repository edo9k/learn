-module(conditional).
-export([start/0]).
-on_load(start/0).

start() ->
  A = 2022,
  B = 1984,
  if 
    A == B ->
      io:fwrite('A is equal to B');
    A < B -> 
      io:fwrite('A is less than B');
    true ->
      io:fwrite('otherwise case~n')
  end,

  case A of 
    1995 -> io:fwrite('this one is not executing');
    2022 -> io:fwrite('yep, the year is 2022~n')
  end.


