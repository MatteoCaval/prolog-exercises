% search(Elem, List)
search(X, [X|_]).
search(X, [_|Xs]) :- search(X, Xs).

% query
% search(a,[a,b,c]).
% search(a,[c,d,e]).
% iteration:
% search(X,[a,b,c]).
% generation:
% search(a,X).
% search(a,[X,b,Y,Z]).
% search(X,Y).

%%%%%%%%%%%%%%%%%%%%%%%%%%%%5

% search2(Elem, List)
% looks for two consecutive occurrences of Elem
search2(X, [X,X|_]).
search2(X, [_|Xs]):- search2(X,Xs).

% search2(a,[b,c,a,a,d,e,a,a,g,h]).
% search2(a,[b,c,a,a,a,d,e]).
% search2(X,[b,c,a,a,d,d,e]).
% search2(a,L).
% search2(a,[_,_,a,_,a,_]).

% search_two_bet(Elem,List)
% looks for two occurrences of Elem with any element in between!

search_two_bet(X, [X,_,X|_]).
search_two_bet(X, [_|Xs]) :- search_two_bet(X,Xs).


% search_two_bet(a,[b,c,a,a,d,e]). ? no
% search_two_bet(a,[b,c,a,d,a,d,e]). ? yes


% search_anytwo(Elem,List)
%looks for any Elem that occurs two times, anywhere

search_anytwo(X, [X|Xs]) :- search(X,Xs).
search_anytwo(X, [_|Xs]) :- search_anytwo(X,Xs).

% search_anytwo(a,[b,c,a,a,d,e]). ? yes
% search_anytwo(a,[b,c,a,d,e,a,d,e]). ? yes



% size(List, Size)
% Size will contain the number of elements in List
size([],0).
size([_|T],M) :- size(T,N), M is N+1.

% size([a,b,c,d], X).


% size(List,Size)
% Size will contain the number of elements in List, written using notation zero, s(zero), s(s(zero))..

size2(zero,0).
size2(cons(X), M) :- size2(X, N), M is N+1. 



% sum(List,Sum)

sum([], 0).
sum([X|Xs], M) :- sum(Xs,N), M is N + X.

% sum([1,2,3],X). yes. X/6


% average(List,Average)
% it uses average(List,Count,Sum,Average)
average(List,A) :- average(List,0,0,A).
average([],C,S,A) :- A is S/C.
average([X|Xs],C,S,A) :- C2 is C+1, S2 is S+X, average(Xs,C2,S2,A).

% average([3,4,3],A)
% average([3,4,3],0,0,A)
% average([4,3],1,3,A)
% average([3],2,7,A)
% average([],3,10,A) ? A=3.3333


% max(List,Max)
% Max is the biggest element in List
% Suppose the list has at least one element
max([X|Xs], M) :- max(Xs,M,X).
max([],M,T) :- M is T.
max([X|Xs], M, T) :-  X > T, max(Xs, M, X).
max([X|Xs], M, T) :-  T >= X, max(Xs, M, T).


% same(List1,List2)
% are the two lists exactly the same?
same([],[]).
same([X|Xs],[X|Ys]):- same(Xs,Ys).




% all_bigger(List1,List2)
% all elements in List1 are bigger than those in List2, 1 by 1
% example: all_bigger([10,20,30,40],[9,19,29,39]).

all_bigger([],[]).
all_bigger([X|Xs], [Y|Ys]) :- X > Y, all_bigger(Xs,Ys).
 

% sublist(List1,List2)
% List1 should contain elements all also in List2
% example: sublist([1,2],[5,3,2,1]).
% do a recursion on List1, each time just use search of exercise 1.1!

sublist([], L).
sublist([X|Xs], L) :- sublist(Xs, L), search(X, L). 

% seq(N,List)
% example: seq(5,[0,0,0,0,0]).
seq(0,[]).
seq(N,[0|T]):- N > 0, N2 is N-1, seq(N2,T).

% seqR(N,List)
% example: seqR(4,[4,3,2,1,0]).

seqR(0, [0]).
seqR(N, [N|T]) :- N > 0, N2 is N-1, seqR(N2,T).

















