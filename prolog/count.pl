
count(10) :- write(10), nl.
count(X)  :- 
  write(X), nl,
  Y is X + 1,
  count(Y).

