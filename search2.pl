% search2(Elem, List)
% looks for two consecutive occurrences of Elem

search2(X,[X,X|_]).
search2(X,[_|Xs]) :- search2(X,Xs).