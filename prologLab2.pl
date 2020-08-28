% dropAny(?Elem,?List,?OutList)
dropAny(X,[X|T],T).
dropAny(X,[H|Xs],[H|L]):-dropAny(X,Xs,L).

dropFirst(X,[X|T],T) :- !.
dropFirst(X,[H|Xs],[H|L]):-dropFirst(X,Xs,L).


%count([],V,0).
%count([X|Xs],X,N):- count(Xs,X,M), N is M+1.
%count([T|Ts],X,N):- T \= X, count(Ts,X,N).

%dropLast(X,[X|T],T) :- count(T,X,0), !.
%dropLast(X,[H|Xs],[H|L]):-dropLast(X,Xs,L).


dropLast(X,[H|Xs],[H|L]):-dropLast(X,Xs,L), !.
dropLast(X,[X|T],T).

dropAll(X,[],[]).
dropAll(X,[X|T],L) :- dropAll(X,T,L), !.
dropAll(X,[H|Xs],[H|L]):-dropAll(X,Xs,L).


% ex 2.1 fromList

% fromList(+List,-Graph)

fromList([_],[]).
fromList([H1,H2|T],[e(H1,H2)|L]) :- fromList([H2|T],L).

