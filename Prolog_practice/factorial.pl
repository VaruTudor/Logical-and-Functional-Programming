%factorial(Number:Integer,FactorialResult:Integer)
%(i,i),(i,o)

factorial(0,1).
factorial(Number,FactorialResult):-
    Number>0,
    NewNumber is Number-1,
    factorial(NewNumber,NewFactorialResult),
    FactorialResult is Number*NewFactorialResult.