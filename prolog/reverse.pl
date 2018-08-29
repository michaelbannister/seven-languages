reverselist([], []).
% reverselist([Head|[]], [Head|[]]).    NOT REQUIRED
% reverselist(Reversed, [Head|Tail]) :- append(reverselist(Tail), [Head], Reversed).   NO!
reverselist(Reversed, [Head|Tail]) :- reverselist(ReversedTail, Tail), append(ReversedTail, [Head], Reversed).
