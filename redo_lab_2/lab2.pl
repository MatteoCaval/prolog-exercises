% lab2

%bilist
%create_bilist(List,Bilist)
%create_bilist([10,20,30,40], bilist([10], [20,30,40]))
% il prolog fa sharing di strutture dati essendo immutabili, non c'è un problema di cloning delle strutture

create_bilist([H|T], bilist([H], T)).

%right(+Bilist, -Bilist) + è input, - output
%right(bilist([10], [20,30,40]), bilist([20,10], [30,40]))
right(bilist(L,[H|T]),bilist([H|L], T)).
left(B,B2) :- right(B2,B).

%current(+Bilist, -Elem)
current(bilist([H|_], _), H).


mynot(P) :- P, !, myfail.
myfail :- 1=2.


% dropAny(?Elem,?List,?OutList)
dropAny(X,[X|T],T).
dropAny(X,[H|Xs],[H|L]):-dropAny(X,Xs,L).