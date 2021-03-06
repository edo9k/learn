
% if-then-else statement
gt(X, Y)  :- X >= Y, write('X is greater or equal Y').
gt(X, Y)  :- X <  Y, write('X is smaller than Y').

% if-elif-else statement
gte(X, Y) :- X  >  Y, write('X is greater than Y').
gte(X, Y) :- X =:= Y, write('X and Y are the same').
gte(X, Y) :- X  <  Y, write('X is smaller than Y').

