
%/*
%   isMountain(List:List)
%   flow model (i)          
%wrapper or "overloaded" for isMountain(List:List, Output:Bool)*/
isMountain(L):-
    isMountain(L,_).

    
%/*
%   isMountain(List:List, Output:Bool)
%   flow model (i,o)
%*/
isMountain(List, Output):-
    isMountainUtil(List, Output, -1).

    
%/*
%   isMountainUtil(List:List, Output:Bool, Flag:Integer(-1,0 or 1))
%   flow model (i,o,i)
%    
% when the flag is -1 we're searching for an increasing sequence
% and set the flag to 0*/    
isMountainUtil([Head,Next|Tail], Output, -1):-
    (
        Head < Next,
        isMountainUtil([Next|Tail], Output, 0)
    ).
%/*when the flag is 0 we are into an increasing sequence and
% if the sequence keept the increasing property the flag remains 0
% otherwise the flag is changed to 1*/    
isMountainUtil([Head,Next|Tail], Output, 0):-
    (
        Head < Next
        -> isMountainUtil([Next|Tail], Output, 0)
        ; isMountainUtil([Next|Tail], Output, 1)
    ).
%/*if the flag is 1 we continue with the decreasing sequence*/    
isMountainUtil([Head,Next|Tail], Output, 1):-
    (
        Head > Next,
        isMountainUtil([Next|Tail], Output, 1)
    ).
%/*if there is one element left (nothing to compare) and the flag is 1
% the result is correct*/    
isMountainUtil([_], _, 1).   

%tests
%isMountain([],X).
%isMountain([1,2,3],X).
%isMountain([3,2,1],X).
%isMountain([1,3,2],X).
%isMountain([1,2,3,4,3,2],X).
%isMountain([1,3,2,4,5],X).


%/*
%   non-deterministic
%   subset(List:List, Output:List)
%   flow model(i,o)
%   determines all subsets of a given list
%*/
subset([], []).
subset([E|Tail], [E|NTail]):-
  subset(Tail, NTail).
subset([_|Tail], NTail):-
  subset(Tail, NTail).

  
%/*
%   puts the result of subset in a list
%*/  
allSubsets(List, Output):-
    findall(ToBeCollected,subset(List,ToBeCollected),Output).

%/*
%   predicate which determines all mountains from a given list 
%   of lists
%   allMountainSubsets(List:List, Output:List)
%   flow model (i,o)
%*/    
allMountainSubsets(List,Output):-
    allMountainSubsetsUtil(List,Output,0).

    
%/*
%   called by the wrapper allMountainSubsets
%   it first finds all subsets of a list and changes the flag to 1
%   allMountainSubsetsUtil(List:List, Output:List, 
%   Flag:Integer(0 or 1))
%   flow model (i,o,i)
%*/    
allMountainSubsetsUtil(List,Output,0):-    
    allSubsets(List,ListOfSubsets),
    allMountainSubsetsUtil(ListOfSubsets,Output,1).
%/*stops when the list of subsets is empty*/
allMountainSubsetsUtil([],[],1).    
%/*it checks if the head list is a mountain and adds it to the
% output if such*/    
allMountainSubsetsUtil([Head|Tail],[Head|Output],1):-
    (
        isMountain(Head),
        allMountainSubsetsUtil(Tail,Output,1)
    ).   
%/*if the head list is not a mountain it continues without adding it*/
allMountainSubsetsUtil([_|Tail],Output,1):-
    (
        allMountainSubsetsUtil(Tail,Output,1)
    ).       

%allMountainSubsets([1,3,4,2],X).
%allMountainSubsets([1,2,3],X).
%allMountainSubsets([1],X).
%allMountainSubsets([],X).


