
-module(maps_).
-export([start/0]).
-on_load(start/0).

start() ->
  % a simple map
  MeMap = #{ name => eduardo, age => 34 },
  io:fwrite("~p~n", [map_size(MeMap)]),

  % an example list
  DateList = [{"year", 2022}, {"month", 4}, {"day", 12}],
  DateMap = maps:from_list(DateList),

  io:fwrite("map from list ~p~n", [ DateMap ]),

  % find returns a tuple {ok, Value} if key:value exist
  % it errors otherwise
  io:fwrite("find to check keys exists ~p~n", [ maps:find("year", DateMap) ]),

  io:fwrite("get value from key ~p~n", [ maps:get("year", DateMap) ]),

  % just a boolean check if key exists (different from maps:find)
  io:fwrite("is_key checks if key exist ~p~n", [maps:is_key("year", DateMap)]),

  io:fwrite("keys gets all keys ~p~n", [maps:keys(DateMap)  ]),
  io:fwrite("values gets values ~p~n", [maps:values(DateMap)]),
  
  % longer setup for maps:merge...
  %
  ListA = [ {"a", 1984}, {"b", 1789} ],
  ListB = [ {"c", 2022}, {"d", 2035} ],

  MapA = maps:from_list(ListA),
  MapB = maps:from_list(ListB),

  io:fwrite("merging maps ~p~n", [maps:merge(MapA, MapB)]),

  io:fwrite("put adds key to map ~p~n", [maps:put("hour", 20, DateMap)]),
  io:fwrite("remove removes ~p~n", [maps:remove("year", DateMap)]).

