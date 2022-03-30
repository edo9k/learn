-module(functions).
-export([add/2, start/0]).
-on_load(start/0).

% trivial function
add(A, B) ->
  Sum = A + B,
  io:fwrite("~w~n", [Sum]).

% overloading
add(A, B, C) ->
  Sum = A + B + C,
  io:fwrite("~w~n", [Sum]).

% function with `guard`
of_age(Age) when Age > 18 ->
  io:fwrite("Considered of age. (~w) ~n", [Age]).

start() ->
  add(2000, 22),
  add(2000, 20, 2),
  io:fwrite("Is 22 considered of age? ~n"),
  of_age(22),

  % anonymous function
  Fn = fun() ->
           io:fwrite("Hello, World! (from an anonymous function)~n") end,
  Fn().


