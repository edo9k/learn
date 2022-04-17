-module(macros).
-export([start/0]).

% a trivial macro
-define(sum_macro(X,Y), {X+Y}).

start() ->
  io:fwrite("~w~n", [ ?sum_macro(999,1) ]).

% there's a bunch of other macro commands,
% analogous the ones in C apparently.
%
% undef, ifdef, ifndef, else, endif, etc.

