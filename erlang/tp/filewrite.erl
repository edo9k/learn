-module(filewrite).
-export([start/0]).

start() -> 
  {ok, File} = file:open("/tmp/hi-erlang.txt", [write]),
  file:write(File, "this is text.").

