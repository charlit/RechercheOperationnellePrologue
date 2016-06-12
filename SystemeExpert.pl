run :- hypothesize(Commande),
      write('Le resultat est: '),
      write(Commande),
      nl,
      undo.


hypothesize(commande_cd)     :- commande_cd, !.
hypothesize(commande_rm)     :- commande_rm, !.
hypothesize(commande_update) :- commande_update, !.


commande_cd :- linux,
	gestion_fichier,
	verify(parcourir).
commande_rm :- linux,
	gestion_fichier,
	verify(supprimer).
commande_update :- linux,
	gestion_systeme,
	verify(maj).


linux :- verify(linux).
gestion_fichier :- verify(linux),
	verify(gestion_fichier).
gestion_systeme :- verify(gestion_systeme).


demande(Question) :-
    write(Question),
    write('? '),
    read(Response),
    nl,
    ( (Response == yes ; Response == y)
      ->
       assert(yes(Question)) ;
       assert(no(Question)), fail).

:- dynamic yes/1,no/1.


verify(S) :-
   (yes(S)
    ->
    true ;
    (no(S)
     ->
     fail ;
     demande(S))).


undo :- retract(yes(_)),fail.
undo :- retract(no(_)),fail.
undo.
