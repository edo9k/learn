-module(processes).
-export([start/0, call/2]).
-on_load(start/0).

call(Arg1, Arg2) ->
  io:format("~p ~p (print from spawned process) ~n", [Arg1, Arg2]).

start() ->
  % spawing a processes
  Pid = spawn(?MODULE, call, ["hello", "process"]),
  io:fwrite("pid: ~p~n", [Pid]),

  % is_pid checks if number is a process id
  io:fwrite("is_pid: ~p~n", [is_pid(Pid)]),

  % is_process_alive (self explanatory)
  io:fwrite("is_process_alive ~p~n", [ is_process_alive(Pid)]),

  % pid_to_list
  io:fwrite("pid_to_list ~p~n", [ pid_to_list(Pid)]),

  % list of registered processes
  io:fwrite("registered ps list ~p~n", [registered()]),

  % self returns pid of this process
  io:fwrite("pid of this process: ~p~n", [self()]),

  % register(atom,pid) registers a process
  register(example_process, Pid),
  io:fwrite("process we just registered: ~p~n", [registered()]),

  % whereis returns the pid of a process assiated to an atom
  io:fwrite("pid of :example_process atom ~p~n",
            [ whereis(example_process) ]),

  % unregister removes a process associated with an atom
  unregister(example_process),
  io:fwrite("whereis of unregistered process ~p~n",
            [ whereis(example_process) ]).


