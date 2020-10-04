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
%dropNode([e(1,2),e(1,3),e(2,3)],1,[e(2,3)]). // non va


% reaching(+Graph, +Node, -List)
% all the nodes that can be reached in 1 step from Node
% possibly use findall, looking for e(Node,_) combined
% with member(?Elem,?List)

reaching(G,N,L):- 
	findall(E1,member(e(E1,N),G),L1),	% troviamo tutti i nodi da una parte e dell'altra e li raccogliamo in 2 liste 
	findall(E2,member(e(N,E2),G),L2),	
	append(L1,L2,L).		% We append the results

% reaching([e(1,2),e(1,3),e(2,3)],1,L). -> L/[2,3]
% reaching([e(1,2),e(1,2),e(2,3)],1,L). -> L/[2,2]).



% anypath(+Graph, +Node1, +Node2, -ListPath)
% a path from Node1 to Node2
% if there are many path, they are showed 1-by-1
% – a path from N1 to N2 exists if there is a e(N1,N2)
% – a path from N1 to N2 is OK if N3 can be reached from N1, and then there is a path from N2 to N3, recursively


% anypath([e(1,2),e(1,3),e(2,3)],1,3,L).
% – L/[e(1,2),e(2,3)]
% – L/[e(1,3)]




% allreaching(+Graph, +Node, -List)
% all the nodes that can be reached from Node
% Suppose the graph is NOT circular!
% Use findall and anyPath!

% allreaching([e(1,2),e(2,3),e(3,5)],1,[2,3,5]).










