% search(Elem, List)
search(X, [X|_]).
search(X, [_|Xs]) :- search(X, Xs).

% seatch_two(Elem, List)
% 

seatch_two(X,[X,_,X|_]).
seatch_two(X,[_|Xs]) :- seatch_two(X,Xs).

% search_anytwo(Elem,List)
% looks for any Elem that occurs two times, anywere
search(X, [X|_]).
search(X, [_|Xs]) :- search(X, Xs).

search_anytwo(X,[X|Xs]) :- search(X,Xs).
search_anytwo(X,[_|Xs]) :- search_anytwo(X,Xs).


% search2(Elem, List)
% looks for two consecutive occurrences of Elem

search2(X,[X,X|_]).
search2(X,[_|Xs]) :- search2(X,Xs).


% size(List, Size)
% Size will contain the number of elements in List
% size([],0).
% size([_|T],M) :- size(T,N), M is N+1.


% Ex2.2
% size(List,Size)
% Size will contain the number of elements in List, written using notation zero, s(zero), s(s(zero))..

size([],zero).
size([_|T],s(N)) :- size(T,N).

% Ex2.3
% sum(List,Sum)
sum([],0).
sum([X|T], S) :- sum(T,N), S is X+N.

% Ex2.4
% average(List,Average)
% it uses average(List,Count,Sum,Average)

average(List,A) :- average(List,0,0,A).
average([],C,S,A) :- A is S/C.
average([X|Xs],C,S,A) :- 
		C2 is C+1,
		S2 is S+X,
		average(Xs,C2,S2,A).

% Ex2.5 
% max(List,Max)
% Max is the biggest element in List
% Suppose the list has at least one element

%max([],Max,Max).
%max([X|Xs], Max) :- max(Xs, Max, X).

%max([X|Xs], Max, TempMax) :-  max(Xs,Max,X), X >= TempMax.
%max([X|Xs], Max, TempMax) :-  max(Xs,Max,TempMax), TempMax > X.
%booooh

max(List,Max) :- max(List, 0, 0).
max([], Max, TMax).
max([X|Xs], Max, TMax) :- max(Xs, X, X).

% same(List1,List2)
% are the two lists exacly the same?

same([],[]).
same([X|Xs],[X|Ys]) :- same(Xs,Ys).

% all_bigger(List1,List2)
% all elements in List1 are bigger than those in List2, 1 by 1
% example all_bigger([10,20,30,40],[9,19,29,39]).

all_bigger([],[]).
all_bigger([X|Xs],[Y|Ys]) :- all_bigger(Xs,Ys), X > Y.

% sublist(List1,List2)
% List1 should contain elements all also in List2
% example: sublist([1,2],[5,3,2,1]).

sublist([],List2).
sublist([X|Xs], List2) :- sublist(Xs, List2), search(X,List2).

% seq(N,List)
% example: seq(5, [0,0,0,0,0]).

seq(0,[]).
seq(N,[0|T]):- N > 0, N2 is N-1, seq(N2,T).

% seqR(N,List)
% example: seqR(4,[4,3,2,1,0]).

seqR(0,[0]).
seqR(N, [N|T]) :- N2 is N-1, seqR(N2, T).

% seqR2(N,List)
% example: seqR2(4,[0,1,2,3,4]).


last([],X,[X]).
last([L|Ls],X,[L|T]) :- last(Ls,X,T).

seqR2(0,[0]).
seqR2(N,L) :- last(X,N,L), N2 is N-1, seqR2(N2,X).

% inv(List,List)
% example: inv([1,2,3],[3,2,1]).

inv([],[]).
inv([X],[X]).
inv([X|Xs], L) :- last(H, X, L), inv(Xs,H).

% double(List,List)
% suggestion: remember predicate append/3
