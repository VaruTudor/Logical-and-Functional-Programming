% invers(L:list, LRez: list)
% (i, o) – determinist
invers(L, Rez) :- invers_aux([], L, Rez).
% invers_aux(Col:list, L:list, LRez: list) – primul argument e colectoarea
% (i, i, o) – determinist
invers_aux(Col, [], Col). % invers_aux(Col, [], Rez) :- Rez = Col.
invers_aux(Col, [H|T], Rez) :-
invers_aux([H|Col], T, Rez).