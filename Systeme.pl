run :- hypothese(Commande), 
       write('La commande recherchée est: '), 
       write(Commande),
       nl, 
       undo.

hypothese(ipconfig)  :- ipconfig, !. 
hypothese(dir) :- dir, !. 
hypothese(mv)  :- mv, !.  

dir :- windows, 
       gestion_dossier,
       verify(lecture_dossier).
ipconfig :- linux,
      reseau,
      verify(reseau). 
mv :- linux, 
      gestion_fichier,
      verify(deplacer_fichier).
  
linux :- verify(linux).
windows :- verify(windows).
gestion_dossier :- verify(windows),
		   verify(gestion_dossier).
reseau :- verify(reseau).
gestion_fichier :- verify(gestion_fichier).
		   


ask(Question) :-
        write(Question), 
        write(' ? '), 
         read(Reponse), 
         nl, 
         ( (Reponse == yes ; Reponse == y) 
         -> assert(yes(Question)) ; 
	    assert(no(Question)), fail).
         
:- dynamic yes/1,no/1. 

verify(S) :- (yes(S) -> true ; (no(S) -> fail ; ask(S))). 

undo :- retract(yes(_)),fail. 
undo :- retract(no(_)),fail. 
undo. 