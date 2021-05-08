
/*%change_list(L:List,O:List)
%flow model (i,o)
%if the list is empty, the output is an empty list*/
change_list([],[]).
%/*if the head is a number it is added without modification to Output*/
change_list([Head|Tail],[Head|Output]):-
    number(Head),
    !,
    change_list(Tail,Output).
%/*if the head is a list, all indices of the max are added as a list to 
%Output*/
change_list([Head|Tail],[ListOfMaxIndices|Output]):-
    is_list(Head),
    !,
    get_max_indices(Head,ListOfMaxIndices),
    change_list(Tail,Output).
    
    
%/*predicate calculates the indices for a given element from a list
%indices(List:List, Element:Integer, Output:List)
%flow model (i,i,o)*/
indices(List, Element, Output):-
        indices_util(List, Element, Output, 1).
%/*if the list is empty, the output is an empty list*/        
indices_util([],_,[],_).
%/*if the element is found, it's index is added to the output list*/        
indices_util([Element|Tail],Element,[I|Output],I):-
    I1 is I+1,
    indices_util(Tail,Element,Output,I1).
%/*otherwise, the counter increses without any addition to the output list*/
indices_util([_|Tail],Element,Output,I):-
    I1 is I+1,
    indices_util(Tail,Element,Output,I1).    
    
    
%/*predicate to get the indices of the maximum element in a list
%get_max_indices(List:List, Output:Integer)
%flow model (i,o)*/   
get_max_indices(List,Output):-
    get_max_util(List,List,Output).    
%/*we set the current maximum to the first element and continue with the 
%rest of the list*/    
get_max_util([Head|Tail],List,Output):-
    get_max_util(Tail,List,Head,Output).
%/*we find the maximum*/    
get_max_util([Head|Tail],List,CurrentMax,Output):-
    (
        Head > CurrentMax
        %we can is an "if"
        ->  get_max_util(Tail,List,Head,Output)
        ;   get_max_util(Tail,List,CurrentMax,Output)
    ).
%/*once the maximum is found we can search for the indices*/    
get_max_util([],List,CurrentMax,Output):-
    (
        indices(List,CurrentMax,Output)
    ).   

    
%tests    
%change_list([1,2,3],X).
%change_list([1,2,[3,5,6],7],X).
%change_list([1,2,[3,5,6,3,6,4,6],7],X).
%change_list([1,[2,3],[4,1,4],3,6,[7,10,1,3,9],5,[1,1,1],7],X).
%change_list([],X).



