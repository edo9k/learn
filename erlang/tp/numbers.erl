-module(numbers).

-export([start/0]).
-on_load(start/0).

start() ->
  io:fwrite("obvious sum ~n"),
  io:fwrite("~w~n", [2000 + 22]),
  io:fwrite("formatting floating point ~n"),
  io:fwrite("~f~n", [0.1 + 0.2]),
  io:fwrite("~e~n~n", [0.1 + 0.2]),
  io:fwrite("math functions ~n"),
  io:fwrite("sin ~p~n", [ math:sin(45) ]),
  io:fwrite("cos ~p~n", [ math:cos(45) ]),
  io:fwrite("tan ~p~n", [ math:tan(45) ]),
  io:fwrite("exp ~p~n", [ math:exp(3.14) ]),
  io:fwrite("log ~p~n~n", [ math:log(3.14) ]),
  io:fwrite("other math builtins ~n"),
  io:fwrite("abs ~p~n", [ abs(-3.14) ]),
  io:fwrite("cast to float ~f~n", [ float(42) ]),
  io:fwrite("check if float ~w~n", [ is_float(3.14) ]),
  io:fwrite("check if int ~w~n~n", [ is_integer(2022) ]).

