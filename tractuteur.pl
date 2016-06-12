%dico
dictionnaire('un','one').
dictionnaire('deux','two').
dictionnaire('trois','three').
dictionnaire('quatre','four').
dictionnaire('cinq','five').
dictionnaire('six','six').
dictionnaire('sept','seven').
dictionnaire('huit','eight').
dictionnaire('neuf','nine').

%regle

fren(Chiffre):- dictionnaire(Chiffre, En),write(En).

test(Lang):- dictionnaire(Lang,_),write('fr').
test(Lang):- dictionnaire(_,Lang),write('en').



%requete