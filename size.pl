% size(List, Size)
% Size will contain the number of elements in List

size([],0).
size([_|T],M) :- size(T,N), M is N+1.