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


% dropAll(Elem,List,Outlist)

dropAll(X,[],[]).
dropAll(X,[X|T],L):-dropAll(X,T,L), !.
dropAll(X,[X,H|Xs],[H|L]):-dropAll(X,Xs,L).


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


% dropNode(+Graph, +Node, -OutGraph)
% drop all edges starting and leaving from a Node
% use dropAll defined in 1.1
dropNode(G,N,O):- dropAll(G,e(N,_),G2),dropAll(G2,e(_,N),O).
%dropNode([e(1,2),e(1,3),e(2,3)],1,[e(2,3)]).


% reaching(+Graph, +Node, -List)
% all the nodes that can be reached in 1 step from Node
% possibly use findall, looking for e(Node,_) combined
% with member(?Elem,?List)

% reaching([e(1,2),e(1,3),e(2,3)],1,L). -> L/[2,3]
% reaching([e(1,2),e(1,2),e(2,3)],1,L). -> L/[2,2]).










