adaug(E, [], [E]).
adaug(E, [H | T], [H | Rez]) :-
adaug(E, T, Rez).