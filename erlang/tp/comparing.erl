-module(comparing).
-export([start/0]).

start() ->
  
  % casting comparison
  io:fwrite(" non-strict comparison ignores types (sortof) ~n"),
  io:fwrite(" 2 == 2.0 -> ~p~n", [ 2 == 2.0 ]),
  io:fwrite(" 2 /= 2.0 -> ~p~n", [ 2 /= 2.0 ]),

  % strict comparison
  io:fwrite(" strict comparison observes typing ~n"),
  io:fwrite(" 2 =:= 2.0 -> ~p~n", [ 2 =:= 2.0 ]),
  io:fwrite(" 2 =/= 2.0 -> ~p~n", [ 2 =/= 2.0 ]),

  %
  io:fwrite(" other usual comparing operators ~n"),
  io:fwrite(" 1 =< 1 ~p~n", [ 1 =< 1 ]),
  io:fwrite(" 1 =< 2 ~p~n", [ 1 =< 2 ]),
  io:fwrite(" 2 =< 1 ~p~n", [ 2 =< 1 ]),

  io:fwrite(" 1 < 1 ~p~n", [ 1 < 1 ]),
  io:fwrite(" 1 < 2 ~p~n", [ 1 < 2 ]),
  io:fwrite(" 2 < 1 ~p~n", [ 2 < 1 ]),

  io:fwrite(" 1 >= 1 ~p~n", [ 1 >= 1 ]),
  io:fwrite(" 1 >= 2 ~p~n", [ 1 >= 2 ]),
  io:fwrite(" 2 >= 1 ~p~n", [ 2 >= 1 ]),

  io:fwrite(" 1 > 1 ~p~n", [ 1 > 1 ]),
  io:fwrite(" 1 > 2 ~p~n", [ 1 > 2 ]),
  io:fwrite(" 2 > 1 ~p~n", [ 2 > 1 ]).

