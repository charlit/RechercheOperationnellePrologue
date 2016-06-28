% Grid is a data store with 3 atoms
:- dynamic grid/3.
 
 
grid(1, 1, '_').
grid(1, 2, '_').
grid(1, 3, '_').
 
grid(2, 1, '_').
grid(2, 2, '_').
grid(2, 3, '_').
 
grid(3, 1, '_').
grid(3, 2, '_').
grid(3, 3, '_').
 
 
 
% Game |
% ------
reset :- retract(grid(X, Y, _)), assert(grid(X, Y, '_')), fail.
 
 
display :- displayInner(1).
% Call in display
displayInner(Line) :- grid(Line, 1, Col1), grid(Line, 2, Col2), grid(Line, 3, Col3), writef("| %w | %w | %w | -> %w\n", [Col1, Col2, Col3, Line]), X1 is Line + 1, displayInner(X1), fail.
 
 
play(X, Y, Player) :- grid(X, Y, R), R == '_', retract(grid(X, Y, _)), assert(grid(X, Y, Player)).
 
 
check :- checkLine(R), writef("win : %w", [R]), end.
check :- checkCol(R), writef("win : %w", [R]), end.
check :- checkDiag(R), writef("win : %w", [R]), end.
 
 
 
 
 
% Call in check
checkLine(Player) :- grid(Line, 1, Player), grid(Line, 2, Player), grid(Line, 3, Player), Player \= '_', writef(" %w -> %w ", [Line, Player]).
checkCol(Player) :- grid(1, Col, Player), grid(2, Col, Player), grid(3, Col, Player), Player \= '_', writef(" %w -> %w ", [Col, Player]).
checkDiag(Player) :- grid(1, 1, Player), grid(2, 2, Player), grid(3, 3, Player), Player \= '_', writef(" diag -> %w ", [Player]).
checkDiag(Player) :- grid(1, 3, Player), grid(2, 2, Player), grid(3, 1, Player), Player \= '_', writef(" diag -> %w ", [Player]).
 
 
% Call in check
end :- nl, display.
end :- reset.
end :- nl, write("Clearing morpion .... New Game Start").
 
 
% Test
testLine(X, Line) :- play(Line, 1, X), play(Line, 2, X), play(Line, 3, X).
testCol(X, Col) :- play(1, Col, X), play(2, Col, X), play(3, Col, X).
testDiag1(X) :- play(1, 1, X), play(2, 2, X), play(3, 3, X).
testDiag2(X) :- play(1, 3, X), play(2, 2, X), play(3, 1, X).