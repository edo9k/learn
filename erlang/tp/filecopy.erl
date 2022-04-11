-module(filecopy).
-export([start/0]).

start() ->
  io:fwrite("copying the hello.erl file ~n"),
  file:copy("hello.erl", "hello.erl-duplicate"),

  io:fwrite("displaying file in current directory ~n"),
  io:fwrite("~p~n", [file:list_dir(".")]),

  io:fwrite("deleting copied file, and listing dir again ~n"),
  file:delete("hello.erl-duplicate"),
  io:fwrite("~p~n", [file:list_dir(".")]).

