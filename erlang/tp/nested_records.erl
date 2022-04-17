-module(nested_records).
-export([start/0]).

-record(person, {name = "", address}).
-record(employee, {person, id}).


start() ->
  P = #employee{person = #person{name = "John", address = "A"},id = 2022},
  io:fwrite("~p~n", [P]),

  % nested records syntax is the weirdest crap
  % i've ever seen.
  %
  io:fwrite("~p~n", [ (P#employee.person)#person.name ]).

