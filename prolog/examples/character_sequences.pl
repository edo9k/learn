
%
% small code challenge. 
%
%   Create a function that prints out the 'missing characters' from
%   the input string. Do not print the characters present in the string,
%   only the ones missing between them.
%
%   Examples: 
%
%   "abcdf" => "e" 
%   "acdf" => "be"
%   "OQRS" => "P" 
%   "acdb" => ""
%   "abcz" =>  "defghijklmnopqrstuvwxy"
%


sequence(A, B, Result) :-

	A + 1 >= B, Result = [];

	NextA is A + 1, 
	PrevB is B - 1,
	numlist( NextA, PrevB, Result).

walkList([Item]).

walkList([A,B|Rest]) :-
	sequence(A,B, List),
	atom_codes(Text, List),
	write(Text),
	walkList([B|Rest]).

printSequences(Text) :-
	atom_codes(Text, Codes),
	sort(Codes, SortedCodes),
	walkList(SortedCodes),
	nl.


% --- exemplos --- %

?-	write(" abcdf => e   ;; resultado = "), 	printSequences(abcdf). 
?-	write(" acdf  => be  ;; resultado = "), 	printSequences(acdf).
?-	write(" OQRS  => P   ;; resultado = "), 	printSequences("OQRS").
?-	write(" acdb  => (vazio) ;; resultado = "), 	printSequences(acdb).

?-	write(" abcz  => defghijklmnopqrstuvwxy ;; resultado = "), 
	printSequences(abcz).

