smallest([H|[]], H).
smallest([H|T], H) :- smallest(T, SmallestInT), H < SmallestInT.
smallest([H|T], SmallestInT) :- smallest(T, SmallestInT), H >= SmallestInT.
