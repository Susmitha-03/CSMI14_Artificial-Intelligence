% Defining basic family relationships
parent(X, Y) :- child(Y, X).
child(X, Y) :- parent(Y, X).
sibling(X, Y) :- parent(Z, X), parent(Z, Y), X \= Y.
father(X, Y) :- male(X), parent(X, Y).
mother(X, Y) :- female(X), parent(X, Y).
son(X, Y) :- male(X), child(X, Y).
daughter(X, Y) :- female(X), child(X, Y).

% Facts for male and female predicates
male(john).
male(father_son).
female(mary).

% The riddle statement and its interpretation
that_man_father_is_my_father_son(ThatMan) :-
    father(MyFather, Me),           % My father's son refers to myself or my brother
    father(ThatManFather, ThatMan), % That man's father is my father's son
    MyFather = ThatManFather,     % That man's father is the same as my father's son
    ThatMan = Me.                 % Therefore, 'that man' must be myself (Me)

% Starting the query
solve_riddle :-
    that_man_father_is_my_father_son(Who),
    write('That man is: '), write(Who), nl.
