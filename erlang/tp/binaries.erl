-module(binaries).
-export([start/0]).
-on_load(start/0).


% functions to create and manipulate binary data

start() ->
  % binary data
  SomeNumbers = <<0, 1, 2, 3, 4, 5, 6, 7, 8, 9>>,
  SomeText = << "I'm a binary string" >>,
  
  io:fwrite("some binary numbers -> ~p~n", [ SomeNumbers ]),
  io:fwrite("binary string -> ~p~n", [ SomeText ]),

  io:fwrite("split binary ~p~n", [split_binary(SomeNumbers, 3)]),

  io:fwrite("list to binary ~p~n", [ list_to_binary( [6, 6, 6] ) ]),
  io:fwrite("binary to list ~p~n", [ binary_to_list(<<6, 6, 6>>) ]),

  io:fwrite("term to binary ~p~n", [ term_to_binary("erlang") ]),

  io:fwrite("check if something is binary ~p~n", 
            [is_binary(SomeNumbers)]),

  io:fwrite("extract part of a binary/bitstring ~p~n",
            [ binary_part(SomeText, {0, 8}) ]),

  io:fwrite("converts binary data to float ~p~n",
            [ binary_to_float(<< "3.14" >>)]),

  io:fwrite("converts binary to integer ~p~n",
            [ binary_to_integer(<< "1984" >>)]),
  
  io:fwrite("binary to atom ~p~n", [binary_to_atom(<< "meh" >>, latin1)]).

