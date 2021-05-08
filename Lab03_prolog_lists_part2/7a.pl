

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
%get_max_indices([1,2,3,7,4,7,6,7,2,3,7,1,2],X).
%get_max_indices([2],X).
%get_max_indices([2,3],X).
%get_max_indices([],X).


/*% predicate to get the maximum from a list
%we use an "overloaded" version as a wrapper predicate 
get_max([Head|Tail],Output) :-
    get_max(Tail,Head,Output).

%if the list is empty stop
get_max([],Output,Output).

%otherwise
get_max([Head|Tail],CurrentMax,Output):-
    (
        Head > CurrentMax
        %we can is an "if"
        ->  get_max(Tail,Head,Output)
        ;   get_max(Tail,CurrentMax,Output)
    ).*/

    
    