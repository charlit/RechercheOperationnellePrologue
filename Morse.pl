%dico
dictionnaire('a','._').
dictionnaire('b','_...').
dictionnaire('c','_._.').
dictionnaire('d','_..').
dictionnaire('e','.').
dictionnaire('f','.._.').
dictionnaire('g','__.').
dictionnaire('h','....').
dictionnaire('i','..').
dictionnaire('j','.___').
dictionnaire('k','_._').
dictionnaire('l','._..').
dictionnaire('m','__').
dictionnaire('n','_.').
dictionnaire('o','___').
dictionnaire('p','.__.').
dictionnaire('q','__._').
dictionnaire('r','._.').
dictionnaire('s','...').
dictionnaire('t','_').
dictionnaire('u','.._').
dictionnaire('v','..._').
dictionnaire('w','.__').
dictionnaire('x','_.._').
dictionnaire('y','_.__').
dictionnaire('z','__..').

lettre(Lettre):-dictionnaire(Lettre, Trad),write(Trad).






%regle

fren(Chiffre):- dictionnaire(Chiffre, En),write(En).

test(Lang):- dictionnaire(Lang,_),write('fr').
test(Lang):- dictionnaire(_,Lang),write('en').



%requete