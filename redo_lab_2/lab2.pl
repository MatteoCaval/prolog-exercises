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

% implementazione del predicato not
mynot(P) :- P, !, fail.
mynot(P). % arrivo qui se P non ha avuto esisto positivo 


% dropAny(?Elem,?List,?OutList)
dropAny(X,[X|T],T).
dropAny(X,[H|Xs],[H|L]):-dropAny(X,Xs,L).

% dropAny(10,[10,20,10,30,10],L).


% fromList(+List,-Graph)
fromList([_],[]).
fromList([H1,H2|T],[e(H1,H2)|L]):- fromList([H2|T],L).

% fromList([10,20,30],[e(10,20),e(20,30)]).
% fromList([10,20],[e(10,20)]).
% fromList([10],[]).

% fromCircList(+List,-Graph)

fromCircList([],[]).
fromCircList([H1|T],L) :- fromCircList([H1|T],L,H1). 
fromCircList([E],[e(E,H1)],H1).
fromCircList([H1,H2|T],[e(H1,H2)|L],F) :- fromCircList([H2|T],L,F).

% fromCircList([10,20,30],[e(10,20),e(20,30),e(30,10)]).
% fromCircList([10,20],[e(10,20),e(20,10)]).
% fromCircList([10],[e(10,10)]).















