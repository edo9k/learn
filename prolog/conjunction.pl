
% conjunction and disjunction examples

parent(john, bob).
parent(lili, bob).

male(john).
female(lili).

% conjunction logic
father(X, Y) :- parent(X, Y), male(X).
mother(X, Y) :- parent(X, Y), female(X).

% disjunction logic
child_of(X, Y) :- father(X, Y); mother(X, Y).

