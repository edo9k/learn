-module(variables).
-export([start/0]).
-on_load(start/0).

start() ->
  X = 2000, 
  Y =   22,
  Z = 3.14, 
  Result = X + Y,
  io:fwrite("~w~n", [Result]),
  io:fwrite("~e~n", [Z]).


