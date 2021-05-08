
%findall([X,Y], (member(X,[a,b,c,d]), member(Y,[a,b,c,d]), X \= Y ), Res).


%/*the predicate finds all the pairs in a set
%it is used as a wrapper predicate for findPairs
%findAllPairs(S:set,O:output list)
%(i,o)*/
findAllPairs([],[]).
findAllPairs([El],[]).
findAllPairs(L,X):-
    findPairs(L,L,X).

    
%/*the predicate finds all the pairs in a set given two times
%is used by a wrapper predicate
%it recursively checks all pairs using the first element of the set
%and each element from the rest
%starts again when in the first set remain only two elemens
%a copy of the set is also used as a parameter
%findPairs(S:set,S:set(the same one),O:output list)
%(i,i,o)*/
findPairs([K,J],[K,J],[[K,J]]).    
findPairs([E1,E2|T],[H2|T2],[[E1,E2]|O]):-
    findPairs([E1|T],[H2|T2],O).
findPairs([E1,E2],[H2|T2],[[E1,E2]|O]):-
    findPairs(T2,T2,O).

%tests:    
%findPairs([a,b,c,d],[a,b,c,d],X).

%findAllPairs([a,b,c,d],X).
%findAllPairs([a,b,c],X).   
%findAllPairs([a,b],X).   
%findAllPairs([a],X).   
%findAllPairs([],X).    

    