-module(files).
-export([start/0]).
-on_load(start/0).

start() -> 
  io:fwrite(" -- printing a text file -- "),
  {ok, File} = file:open("hello.erl", [read]),
  Txt = file:read(File, 1024 * 1024),
  io:fwrite("~p~n", [Txt]).
