-module(list_fns).
-export([start/0]).
-on_start(start/0).

start() ->
  % some list
  PandemicYears = [2020, 2021, 2022],
  io:fwrite("some list ~w~n", [PandemicYears]),

  % all tests all items with a provided function
  GreaterThan1984 = fun(X) -> X > 1984 end,
  AreAllYearsGreaterThan1984 = lists:all(GreaterThan1984, PandemicYears),
  io:fwrite("Testing if years are > 1984: ~w~n", [AreAllYearsGreaterThan1984]),

  % the `any` function works simlarly, but returns true if ANY
  % item returns true.
  
  % append, you know, self explanatory
  OhBoy = lists:append(PandemicYears, [2023, 2024]),
  io:fwrite("appending more terrible years: ~w~n", [OhBoy]),

  % delete removes an item, returns new list
  CurrentYearRemoved = lists:delete(2022, PandemicYears),
  io:fwrite("covid years except current ~w~n", [CurrentYearRemoved]),

  % droplast
  DroppedLast = lists:droplast(PandemicYears),
  io:fwrite("droplast removing last year: ~w~n", [DroppedLast]),

  io:fwrite("last year: ~w~n", [lists:last(PandemicYears)]),
  io:fwrite("max: ~w~n", [lists:max(PandemicYears)]),
  io:fwrite("min: ~w~n", [lists:min(PandemicYears)]),
  io:fwrite("nth element: ~w~n", [lists:nth(3, PandemicYears)]), 
  io:fwrite("nth-tail element: ~w~n", [lists:nthtail(2, PandemicYears)]),
  io:fwrite("sort 1029384756: ~w~n", [lists:sort([1,0,2,9,3,8,4,7,5,6])]),
  io:fwrite("reversed: ~w~n", [lists:reverse(PandemicYears)]),
  io:fwrite("sublist: ~w~n", [lists:sublist(PandemicYears, 2)]),
  io:fwrite("sum: ~w~n", [lists:sum(PandemicYears)]),


  % check if item is member of list
  io:fwrite("is 2022 there? ~w~n", [lists:member(2022, PandemicYears)]),

  % merge lists
  io:fwrite("merged whatever: ~w~n", [lists:merge([6, 5], [0, 2])]).

