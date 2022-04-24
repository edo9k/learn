-module(funs). % anonymous functions
-export([start/0]).
-on_load(start/0).

start() ->
  % defining a fun/function
  SaysHi = fun() -> 
               io:fwrite("Hi. (from a fun anonymous function)~n") 
           end,

  % calling it
  SaysHi(),

  % function with a paramater
  FivePercent = fun(N) ->
                    io:fwrite("5% of ~p is ~p~n", 
                              [ N, N * 0.05 ])
                end,

  % calling it
  FivePercent(2022),

  % using clojure variables

  Century = 21,

  NextCentury = fun() ->
                    io:fwrite("next century is ~p~n",
                              [ Century + 1 ])
                end,
  NextCentury(),

  % currying
  
  CurriedSum = fun(A) -> 
                   fun(B) ->
                       io:fwrite("~p + ~p = ~p~n",
                                 [ A, B, A + B ])
                   end
               end,

  Sum999 = CurriedSum(999),
  Sum999(1),
  Sum999(2),
  Sum999(9).

