-module(modules_).
-export([start/0]).

% including a user defined module
-include("module_lang.hrl").

start() -> 
  Erlang = #language{name = "Erlang", year = 1986, creator = "Ericsson" },
  io:fwrite("Language:  ~p~n", [Erlang#language.name    ]),
  io:fwrite("Year:      ~p~n", [Erlang#language.year    ]),
  io:fwrite("Creators:  ~p~n", [Erlang#language.creator ]).

