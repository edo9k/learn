

list_member(X, [X|_]).
list_member(X, [_|TAIL]) :- list_member(X, TAIL).

% ----


list_length([], 0).
list_length([_|TAIL], N) :- list_length(TAIL, N1), N is N1 + 1.

% ----


list_concat([], L, L).
list_concat([X1|L1], L2, [X1|L3]) :- list_concat(L1, L2, L3).

% ----


list_delete(X, [X], []).
list_delete(X, [X|L1], L1).
list_delete(X, [Y|L2], [Y|L1]) :- list_delete(X, L2, L1).

% ----


list_append(A, T, T) :- list_member(A, T), !.
list_append(A, T, [A|T]).

% ----


list_insert(X, L, R) :- list_delete(X, R, L).

% ----


list_perm([], []).
list_perm(L, [X|P]) :- list_delete(X, L, L1), list_perm(L1, P).

% ----


list_rev([], []).
list_rev([Head|Tail], Reversed) :-
  list_rev(Tail, RevTail), list_concat(RevTail, [Head], Reversed).

% ----


list_shift([Head|Tail], Shifted) :- list_concat(Tail, [Head], Shifted).

% ----


list_order([X, Y | Tail]) :- X =< Y, list_order([Y|Tail]).
list_order([X]).

% ----


list_subset([], []).
list_subset([Head|Tail], [Head|Subset]) :- list_subset(Tail, Subset).
list_subset([Head|Tail], Subset) :- list_subset(Tail, Subset).

% ----


list_union([X|Y], Z, W) :- list_member(X,Z), list_union(Y,Z,W).
list_union([X|Y], Z, [X|W]) :- \+ list_member(X, Z), list_union(Y, Z, W).
list_union([], Z, Z).

% ----



