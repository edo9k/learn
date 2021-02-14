program Hacking;

const greeting = 'Welcome to Ultimate-Noob-Hacker-Script-Kiddie.';
const question = 'Who are we hacking today? ';

type 
  TargetName = string;

var 
  target : TargetName;

begin
  writeln(greeting);
  writeln(question);
  readln(target);

  writeln;
  writeln('Hacking ', target, '...');
  writeln;
  write('Done. Press [enter] to quit.');
  readln;
end.

