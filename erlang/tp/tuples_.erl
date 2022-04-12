-module(tuples_).
-export([start/0]).
-on_load(start/0).

start() ->
  TuplePizza = { cheese, chicken, {price, 42} },
  io:fwrite("tuple size ~w~n", [tuple_size(TuplePizza)]),

  % is_tuple
  io:fwrite("is_tuple for PizzaTuple: ~w~n", [is_tuple(TuplePizza)]),
  io:fwrite("is_tuple for 666: ~w~n", [is_tuple(666)]),
  
  % list_to_tuple
  io:fwrite("list_to_tuple ~w~n", [list_to_tuple( [2, 2, 0, 2] )]),

  % tuple_to_list
  io:fwrite("tuple_to_list ~w~n", [tuple_to_list( {1, 9, 8, 4} )]).

