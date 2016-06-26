%

%            P P P P                  R R R R                    O O O L                                               O O O   G G G

%            P       P   R       R   O       O  L                                             O       O  G

%            P       P   R       R   O       O  L                                             O       O  G

%            P P P P                  R R R R                  O       O  L                                             O       O  G   G G G

%            P                                            R   R                       O       O  L                                             O       O  G       G

%            P                                            R     R                     O       O  L                                             O       O  G       G

%            P                                            R       R     O O O                 L L L L L    O O O   G G G

%

%------------------------------------------------------------------------------

%Fichier validé : SWI-PROLOG (version stand-alone) et SWISH (version online)

%------------------------------------------------------------------------------

%PREAMBULE: explications et utilitaires pour répondre aux questions ci-dessous

%L'ordre des questions ne respecte pas un ordre croissant de difficultés

%Le nombre de points affectés à chaque question est noté comme en suivant:

%question(Numero,NombreDePoints).

%------------------------------------------------------------------------------

%règles impératives qui permettent la gestion dynamique de la base de données

:- dynamic donneur/2.

:- dynamic rdv/6.

%------------------------------------------------------------------------------

%Informations utiles, éléments de bibliothèque dont l'utilisation n'est pas obligatoire :

%------------------------------------------------------------------------------

%Pour concaténer deux listes

concate([],X,X).

concate([X|L1],L2,[X|L]) :- concate(L1,L2,L).

%------------------------------------------------------------------------------

%Pour inverser l'ordre des éléments d'une liste

inverse([],[]).

inverse([X|L],LL) :- inverse(L,LLL), concate(LLL,[X],LL).

%------------------------------------------------------------------------------

%string_to_list("Arnaud CUEILLE",Out). permet de construire une liste de caractères à partir d'un string, ici donne [65,114,110,97,117,100,32,67,85,69,73,76,76,69]

%atom_codes(Out,[69]). Out = 'E'.

%==============================================================================

%                                                           LE CONTROLE COMMENCE ICI ...

%==============================================================================

%PARTIE I

%------------------------------------------------------------------------------

%Contexte : L'objectif est d'extraire des informations et de produire un affichage de ces éléments.

%------------------------------------------------------------------------------

%moi(Prenom, Nom, Classe, Matière).

moi('Charles','JUSSAN','I4','Prolog').

%------------------------------------------------------------------------------

%Question 1):   créer une règle appelée afficheidentite qui affiche votre prénom suivi de votre nom séparé d'un espace

%question(1,1).
afficheidentite(Prenom, Nom):-moi(Prenom,Nom,_,_),write(Prenom), write(' '),write(Nom).
%------------------------------------------------------------------------------

%PARTIE II

%------------------------------------------------------------------------------

%Contexte : L'objectif est de rechercher deux donneurs distincts d'un même groupe sanguin.

donneur('Pierre', 'A+').

donneur('Paul', 'O+').

donneur('Jacques', 'AB+').

donneur('Martin', 'A-').

donneur('Jean', 'O-').

donneur('Isabelle', 'A+').

donneur('Martine', 'A-').

donneur('Anne', 'A+').

donneur('Carine', 'A+').

%------------------------------------------------------------------------------

%Question 2):   créer une règle appelée recherchedonneur(Groupe) qui affiche deux donneurs et seulement deux lorsque la requete suivante est exécutée:

%recherchedonneur('A+').

%question(2,2).
%recherchedonneur(Groupe):-donneur(X,Groupe), write(X).
%
    recherchedonneur(Groupe):-
    donneur(X, Groupe),
    donneur(Y, Groupe),
    X \= Y,
    write(X),
    write(" "),
    write(Y).
%------------------------------------------------------------------------------

%Question 3):   créer une nouvelle règle appelée recherchedonneur2(Groupe) qui affiche deux donneurs comme à la question précédente et qui intègre la suppression de ces deux donneurs de la base de données

%question(3,2).% recherchedonneurs(Groupe):-donneur(X,Groupe),
% write(X),retractdonneur(donneur(X,Groupe)).
recherchedonneur2(Groupe):- donneur(Prenom1,Groupe), donneur(Prenom2,Groupe), Prenom1\=Prenom2, write(Prenom1), write(" "), write(Prenom2), write(" ont �t�s supprim�s"), retract(donneur(Prenom1,Groupe)), retract(donneur(Prenom2,Groupe)), listing(donneur).
%------------------------------------------------------------------------------

%Question 4):   BONUS (2 points) créer une règle appelée recherchenombredonneurs(Groupe, N) qui retourne avec N le nombre de donneurs d'un même groupe sanguin à la requête recherchenombredonneurs('A+').

%Exemple de requête: recherchenombredonneurs('A+', N).

%question(4,2).

%------------------------------------------------------------------------------

%PARTIE III

%------------------------------------------------------------------------------

%Contexte : L'objectif est d'analyser les lignes de codes fournies ci-dessous.

%------------------------------------------------------------------------------

pgcd(X,X,X).

pgcd(X,Y,R):-

                               X < Y,

                               Y1 is Y - X,

                               pgcd(X,Y1,R).

pgcd(X,Y,R):-

                               Y < X,

                               X1 is X - Y,

                               pgcd(X1,Y,R).

%------------------------------------------------------------------------------

%Question 5):   Le programme, est-il fonctionnel (sans erreur) ?

%question(5,1).

%Réponse: OUI
%------------------------------------------------------------------------------

%Question 6):   Le programme, est-il récursif (dit autrement, existe-t-il des règles récursives) ?

%question(6,1).

%Réponse: OUI
%------------------------------------------------------------------------------

%Question 7):   Dans le programme, quelle est l'utilité de la toute première ligne "pgcd(X,X,X)." ?

%question(7,1).

% Réponse: C'est dans le cas ou R est le plus grand diviseur commun.

%------------------------------------------------------------------------------

%PARTIE IV

%------------------------------------------------------------------------------

%Contexte : L'objectif est de commenter les lignes de codes fournies ci-dessous.

%------------------------------------------------------------------------------

%Question 8):   Commenter les lignes de codes suivantes extraites d'un programme complet, en explicitant la gestion des variables.

%question(8,3).

%------------------------------------------------------------------------------

sexe(Quelquun):- pere(Quelquun, _), write("Sexe masculin").

%Réponse:Si quelqu'un est un p�re alors il est de sexe masculin.

%

sexe(Quelquun):- fils(Quelquun), write("Sexe masculin").

%Réponse: Si quelqu'un est un fils alors il est de sexe masculin.

%

grandpere(X, Z):- pere(X, Y), pere(Y, Z).

% Réponse: Si X est le p�re de Y et Y le p�re de Z alors Z est le grand
% p�re de X.

%

%------------------------------------------------------------------------------

%PARTIE V

%------------------------------------------------------------------------------

%Contexte : L'objectif est de retrouver des erreurs, de les corriger et de commenter les codes fournis ci-dessous.

%------------------------------------------------------------------------------

%Question 9):   Trouver l'erreur dans le code suivant et corriger celui-ci directement dans ces lignes :

%question(9,1).

%voici un exemple de requête, mais le programme ci-dessous ne fonctionne pas: somme([1,2,3,4,5,6,7],R). ce qui donne R = 28.

%------------------------------------------------------------------------------

somme([],0).

somme([X|Y],R):-

                               somme(Y,R1),

                               R is R1 + X.

%------------------------------------------------------------------------------

%Question 10):                Que se passe-t-il si un fait est reproduit en deux exemplaires strictement identiques ?

%question(10,1).

%rdv(date, mois, année, heure, minute, rendezvous).

rdv(24, 6, 2016, 18, 30, 'Dentiste').

rdv(24, 6, 2016, 18, 30, 'Dentiste').

%Réponse: Il est rentr� 2 fois dans la base de donn�es.
%------------------------------------------------------------------------------

%Question 11):                Afin de résoudre ce problème de doublons, écrire une règle appelée "supprimedoublon" qui retire tous les doublons de "rdv" pour ne conserver qu'un unique exemplaire de ce fait ?

%question(11,2).

%------------------------------------------------------------------------------

%PARTIE VI

%------------------------------------------------------------------------------

%Contexte : L'objectif est de convertir un nombre écrit en chiffres romain vers un nombre en chiffres arabe.

%------------------------------------------------------------------------------

correspondance('M',1000).

correspondance('D',500).

correspondance('C',100).

correspondance('L',50).

correspondance('X',10).

correspondance('V',5).

correspondance('I',1).

%------------------------------------------------------------------------------

%Question 12):                écrire l'ensemble de règles qui réalise cet objectif.

%question(12,5).
