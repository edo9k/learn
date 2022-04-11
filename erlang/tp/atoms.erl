-module(atoms).
-export([start/0]).

start() ->
  io:fwrite(atom1),
  io:fwrite("~n"),
  io:fwrite(atom_two),
  io:fwrite("~n"),
  io:fwrite('atom with space'),
  io:fwrite(" --- ~n"),

  io:fwrite("is_atom check -> ~p~n", [is_atom(atom1)]),
  io:fwrite("atom_to_list -> ~p~n", [atom_to_list(atom1)]),
  io:fwrite("list_to_atom -> ~p~n", [list_to_atom("atom1")]),
  io:fwrite("atom_to_binary -> ~p~n", [atom_to_binary('Erlang', utf8)]),
  io:fwrite("binary_to_atom -> ~p~n", [binary_to_atom(<<"Erlang">>, latin1)]).

