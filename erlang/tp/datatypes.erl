
-module(datatypes).
-export([start/0]).

start() -> 
  % sum 
  io:fwrite("~w~n", [2000 + 22]),

  % atom
  io:fwrite(oneatom),  

  % number comparison (bool)
  io:fwrite(2 =< 3),  

  % bit string 
  Bin1 = <<12, 34>>,
  X = binary_to_list(Bin1),
  io:fwrite("~w~n", [X]),

  % tuple
  Tuple = {eduardo, 34, {june, 1}},
  io:fwrite("~w~n", [tuple_size(Tuple)]),

  % map
  Map1 = #{name=>blarg, age=>666},
  io:fwrite("~w~n", [map_size(Map1)]),

  % list
  List = [10, 20, 30],
  io:fwrite("~w~n", [length(List)]).

