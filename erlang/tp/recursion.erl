-module(recursion).
-export([while/1, while/2, start/0, fact/1, list_length/1]).
-on_load(start/0).

while(L) -> while(L, 0).
while([], Acc) -> Acc;

while([_|T], Acc) ->
  io:fwrite("~w~n", [Acc]),
  while(T, Acc+1).

for(0, _) ->
  [];

  for(N, Term) when N > 0 ->
    io:fwrite("Hello~n"),
    [Term|for(N-1, Term)].

% mandatory factorial example
fact(N) when N == 0 -> 1;
fact(N) when N > 0 -> N * fact(N - 1).

% list length
list_length([]) -> 0;
list_length([_|T]) -> 1 + list_length(T).


start() ->
  X = [1, 2, 3, 4, 5],
  while(X),
  for(5,1),

  io:fwrite("Mandatory factorial example~n"),
  io:fwrite("factorial of 4 is ~w~n", [fact(4)]),

  io:fwrite("the length of list X is ~w~n", [list_length(X)]).

