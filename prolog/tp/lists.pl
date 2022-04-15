
% GNU Prolog is always 100% pissed when you try to create new
% assertions. I found this kind dude on Stack Overflow saying 
% you need to set this goddamn flag to tell GProlog do settle
% down. 
%
% source: https://stackoverflow.com/a/54856859
%
set_prolog_flag(unknown, fail).

% list and set operations

list_member(X, [X|_]).
list_member(X, [_|TAIL]) :- list_member(X, TAIL).


list_length([], 0).
list_length([_|TAIL], N) :- list_length(TAIL, N1), N is N1 + 1.


list_concat([], L, L).
list_concat([X1|L1], L2, [X1|L3]) :- list_concat(L1, L2, L3).


list_delete(X, [X], []).
list_delete(X, [X|L1], L1).
list_delete(X, [Y|L2], [Y|L1]) :- list_delete(X, L2, L1).


list_append(A, T, T) :- list_member(A, T), !.
list_append(A, T, [A|T]).


list_insert(X, L, R) :- list_delete(X, R, L).


list_perm([], []).
list_perm(L, [X|P]) :- list_delete(X, L, L1), list_perm(L1, P).


list_rev([], []).
list_rev([Head|Tail], Reversed) :-
  list_rev(Tail, RevTail),
  list_concat(RevTail, [Head], Reversed).


list_shift([Head|Tail], Shifted) :- list_concat(Tail, [Head], Shifted).


list_order([X, Y | Tail]) :- X =< Y, list_order([Y|Tail]).
list_order([X]).


list_subset([], []).
list_subset([Head|Tail], [Head|Subset]) :- list_subset(Tail, Subset).
list_subset([Head|Tail], Subset) :- list_subset(Tail, Subset).


list_union([X|Y], Z, W) :- list_member(X,Z), list_union(Y,Z,W).
list_union([X|Y], Z, [X|W]) :- \+ list_member(X, Z), list_union(Y, Z, W).
list_union([], Z, Z).


list_intersect([X|Y], Z, [X|W]) :-
  list_member(X,Z), list_intersect(Y, Z, W).
list_intersect([X|Y], Z, W) :-
  \+ list_member(X,Z), list_intersect(Y, Z, W).
list_intersect([], Z, []).


list_even_len([]).
list_even_len([Head|Tail]) :- list_odd_len(Tail).

list_odd_len([_]).
list_odd_len([Head|Tail]) :- list_even_len(Tail).


list_divide([], [], []).
list_divide([X], [X], []).
list_divite([X, Y|Tail], [X|List1], [Y|List2]) :-
  list_divide(Tail, List1, List2).


max_of_two(X, Y, X) :- X >= Y. 
max_of_two(X, Y, Y) :- X < Y.


list_max_elem([X], X).
list_max_elem([X, Y|Rest], Max) :-
  list_max_elem([Y|Rest], MaxRest),
  max_of_two(X, MaxRest, Max).


list_sum([], 0).
list_sum([Head|Tail], Sum) :-
  list_sum(Tail, SumTemp),
  Sum is Head + SumTemp.


mergesort([], []).    /* empty list */
mergesort([A], [A]).  /* only one element */
mergesort([A,B|R],S) :-
  split([A,B|R], L1, L2),
  mergesort(L1, S1),
  mergesort(L2, S2),
  merge(S1, S2, S).


split([], [], []).
split([A], [A], []).
split([A,B|R], [A|Ra], [B|Rb]) :-
  split(R, Ra, Rb).


merge(A, [], A).
merge([], B, A).
merge([A|Ra], [B|Rb], [A|M]) :-
  A =< B, merge(Ra, [B|Rb], M).
merge([A|Ra], [B|Rb], [B|M]) :-
  A > B, merge([A|Ra], Rb, M).



