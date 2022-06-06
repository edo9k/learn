% hello world program
-module(hello).

% import write function
-import(io, [fwrite/1]).

% export our function
-export([start/0]).

start() -> 
  io:fwrite("Hello, World! (from Erlang/OTP)\n").

