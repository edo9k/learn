-module(strings).
-export([start/0]).
-on_load(start/0).

start() ->
  Text = "The quick brown fox jumps over the dog.",
  io:fwrite("~p~n", [Text]),

  Length = string:len(Text),
  io:fwrite("Text length: ~p~n", [Length]),

  A = "flip",
  B = "flop",
  io:fwrite("Comparing A and B ~p~n", [ string:equal(A,B) ]),
  io:fwrite("Compraing A to itself ~p~n", [ string:equal(A,A) ]),

  AandB = string:concat(A, B),
  io:fwrite("both texts ~p~n", [AandB]),

  IndexOfF = string:chr(Text, $f),
  io:fwrite("Char 'f' is at index ~p~n", [IndexOfF]),

  IndexOfFox = string:str(Text, "fox"),
  io:fwrite("Substring fox is at index ~p~n", [IndexOfFox]),

  TextBetweenAB = string:substr(Text, 1, 3),
  io:fwrite("Text between poistions 0 and 3 is ~p~n", [TextBetweenAB]),

  io:fwrite("uppercasing and lowercasing ~n"),
  io:fwrite("~p~n", [ string:to_upper(Text) ]),
  io:fwrite("~p~n", [ string:to_lower(Text) ]).

