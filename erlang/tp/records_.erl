-module(records_).
-export([start/0]).
-on_load(start/0).

% declaring a record
-record(person, {name = "", id}).

start() -> 

  % creating a record, accessing fields
  P = #person{ name = "Joe Armstrong", id = 1},
  io:fwrite("~p~n", [P#person.id]),
  io:fwrite("~p~n", [P#person.name]),

  % updating a new example record
  Wrong = #person{ name = "Rennis Ditchie", id = 2},
  Right = Wrong#person{ name = "Dennis Ritchie"},

  io:fwrite("wrong record name: ~p~n", [Wrong#person.name]),
  io:fwrite("right record name: ~p~n", [Right#person.name]).

