

config const numberOfMessages = 100;

writeln("This hello-world gets split into threads and use all available machine cores.");
writeln("Apparently a machine is referred to as 'a node' on chapel-land.");

forall msg in 1..numberOfMessages do
  writeln("Hello, World! (from iteration ", msg, " of ", numberOfMessages, ")");

