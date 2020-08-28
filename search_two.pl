% seatch_two(Elem, List)
% 

seatch_two(X,[X,_,X|_]).
seatch_two(X,[_|Xs]) :- seatch_two(X,Xs).