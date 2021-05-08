
%/*
%predicate determines the union of two sets
%union(FirstSet:set, SecondSet: set, Output:set)
%(i,i,o)
%*/
union([FirstElement|SetTail], SecondSet, Output) :-
    set_member(FirstElement,SecondSet), 
    union(SetTail, SecondSet, Output).

union([FirstElement|SetTail], SecondSet, [FirstElement|Output]) :-
    \+ set_member(FirstElement,SecondSet), 
    union(SetTail, SecondSet, Output).

union([],SecondSet,SecondSet).

%/*
%predicate determines if an element is found in a set
%by recursively checking if it is the first element, and then using the rest 
%of the set
%set_member(E:elem, S:set)
%(i,i)
%*/
set_member(E,[E|_]).
set_member(E,[_|TAIL]):-
    set_member(E,TAIL).
  
%tests for set_member  
%set_member(5,[]).
%set_member(5,[7,4,3,2,5]).
%set_member(5,[5,6,7]).
%set_member(5,[7,5,8,9]).
  
%tests for union
%union([1,3,5,6],[1,3,7,8],X).
%union([a,b,c],[b,c],X).
%union([a,b,c],[b,d],X).
%union([],[5,7,8],X).
%union([],[],X).
%union([4,5],[],X).
