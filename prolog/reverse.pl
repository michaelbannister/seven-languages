reverselist([], []).
% reverselist([Head|[]], [Head|[]]).    NOT REQUIRED
% reverselist(Reversed, [Head|Tail]) :- append(reverselist(Tail), [Head], Reversed).   NO!
reverselist(Reversed, [Head|Tail]) :- reverselist(ReversedTail, Tail), append(ReversedTail, [Head], Reversed).


reverse2helper([H|T], Acc, Result) :- reverse2helper(T, [H|Acc], Result).
reverse2helper([], Result, Result).

reverse2(Input, Result) :- reverse2helper(Input, [], Result).
