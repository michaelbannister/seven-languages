insert(X, [], [X]).
insert(X, [H|T], [X|[H|T]]) :- X =< H.
insert(X, [H|T], [H|Inserted]) :- X > H, insert(X, T, Inserted).

bubblesort([], []).
bubblesort([H|T], Sorted) :- bubblesort(T, SortedT), insert(H, SortedT, Sorted).
