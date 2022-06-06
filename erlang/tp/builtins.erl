-module(builtins). 
-export([start/0]).
-on_load(start/0).

start() ->
  io:fwrite("BIFs are Erlang's Builtin functions. ~n"),
  
  io:fwrite("tuple_to_list -> ~p~n", [ tuple_to_list({1,2,3}) ]),
  io:fwrite("nth tutple element -> ~p~n", [element(2, {eins, zwei, drei})]),

  io:fwrite("time -> ~p~n", [time()]),
  io:fwrite("date -> ~p~n", [date()]),
  io:fwrite("local time -> ~p~n", [erlang:localtime()]),
  io:fwrite("now timestamp -> ~p~n", [erlang:now()]),
  io:fwrite("UTC time -> ~p~n", [erlang:universaltime()]),
  
  io:fwrite("float casting -> ~p~n", [float(2022)]),
  io:fwrite("byte_size -> ~p~n", [byte_size( <<1,2,3>> )]),

  put(name, "Eduardo França"),  % this adds key/value pairs
  put(age, 34),                 % to the process dictionary
  % get/0 retrieves all key/value pairs
  % get/1 retrieves a specific pair, by key. 
  io:fwrite("get process dictionary -> ~p~n", [ get() ]),

  io:fwrite(" -------------- ~n "),
  io:fwrite(" erlang:memory gets a dicionary with info about memory ~n"),
  io:fwrite(" used by the Erlang VM (the BEAM) ~n"),
  io:fwrite("~p~n", [erlang:memory()]), 
  io:fwrite(" -------------- ~n "),

  io:fwrite(" ports list local machine ports -> ~p~n", [erlang:ports()]),
  io:fwrite(" -------------- ~n "),

  io:fwrite(" processes on the vm -> ~p~n", [erlang:processes()]),
  io:fwrite(" -------------- ~n ").

