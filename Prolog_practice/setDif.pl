isMember(H,[H|_]).
isMember(E,[_|T]):-
    isMember(E,T).
    
    


setDif([FirstElement|SetTail],SecondSet,Output):-
    isMember(FirstElement,SecondSet),
    setDif(SetTail,SecondSet,Output).
    
setDif([FirstElement|SetTail],SecondSet,[FirstElement|Output]):-
    \+isMember(FirstElement,SecondSet),
    setDif(SetTail,SecondSet,Output).
    
setDif([],_,[]).

%test
%setDif([1,2,3,4],[2,4],R).