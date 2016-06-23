ligne('A', "Le Haillan Rostand", 1).
ligne('A', "Les Pins", 2).
ligne('A', "Frères Robinson", 3).
ligne('A', "Hôtel de Ville Mérignac", 4).
ligne('A', "Pin Galant", 4).
ligne('A', "Mérignac Centre", 5).
ligne('A', "Lycées de Mérignac",6).
ligne('A', "Quatre Chemins",7).
ligne('A', "Pierre Mendès-France",8).
ligne('A', "Alfred de Vigny",9).
ligne('A', "Fontaine d'Arlac",10).
ligne('A', "Peychotte",11).
ligne('A', "François Mitterrand",12).
ligne('A', "Saint-Augustin",13).
ligne('A', "Hôpital Pellegrin",14).
ligne('A', "Stade Chaban-Delmas",15).
ligne('A', "Gaviniès",16).
ligne('A', "Hôtel de Police",17).
ligne('A', "Saint-Bruno - Hôtel de Région",18).
ligne('A', "Mériadeck",19).
ligne('A', "Palais de Justice",20).
ligne('A', "Hôtel de Ville",21).
ligne('A', "Sainte-Catherine",22).
ligne('A', "Place du Palais",23).
ligne('A', "Porte de Bourgogne",24).
ligne('A', "",25).
ligne('A', "Stalingrad",26).
ligne('A', "Jardin botanique",27).
ligne('A', "Thiers - Benauge",28).
ligne('A', "Galin",29).
ligne('A', "Jean Jaurès",30).
ligne('A', "Cenon Gare",31).
ligne('A', "Carnot - Mairie de Cenon",30).
ligne('A', "Buttinière",31).
ligne('A', "Palmer",32).
ligne('A', "Pelletan",33).
ligne('A', "La Morlette",34).
ligne('A', "Jean Zay",35).
ligne('A', "La Marègue",36).
ligne('A', "Floirac - Dravemont",37).
ligne('A', "Iris",38).
ligne('A', "Gravières",39).
ligne('A', "Bois Fleuri",40).
ligne('A', "Lauriers",41).
ligne('A', "Mairie de Lormont",42).
ligne('A', "Carriet",43).
ligne('A', "La Gardette-Bassens-Carbon-Blanc",44).

ligne('B', "Berges de la Garonne",1).
ligne('B', "Claveau",2).
ligne('B', "Brandenburg",3).
ligne('B', "New-York",4).
ligne('B', "Rue Achard",5).
ligne('B', "Bassins à Flot",6).
ligne('B', "Les Hangars",7).
ligne('B', "Cours du Médoc",8).
ligne('B', "Chartrons",9).
ligne('B', "CAPC (Musée d'Art Contemporain)",10).
ligne('B', "Quinconces",11).
ligne('B', "Grand Théâtre",12).
ligne('B', "Gambetta",13).
ligne('B', "Hôtel de Ville",14).
ligne('B', "Musée d'Aquitaine",15).
ligne('B', "Victoire",16).
ligne('B', "Saint-Nicolas",17).
ligne('B', "Bergonié",18).
ligne('B', "Barrière Saint-Genès",19).
ligne('B', "Roustaing",20).
ligne('B', "Forum",21).
ligne('B', "Peixotto",22).
ligne('B', "Béthanie",23).
ligne('B', "Arts et Métiers",24).
ligne('B', "François Bordes",25).
ligne('B', "Doyen Brus",26).
ligne('B', "Montaigne-Montesquieu",27).
ligne('B', "UNITEC",28).
ligne('B', "Saige",29).
ligne('B', "Bougnard",30).
ligne('B', "Camponac Médiathèque",31).
ligne('B', "Pessac Centre",32).


ligne('C', "Parc des Expositions",1).
ligne('C', "Palais des Congrès",2).
ligne('C', "Quarante Journaux",3).
ligne('C', "Berges du lac",4).
ligne('C', "Les Aubiers",5).
ligne('C', "Place Ravezies-Le Bouscat",6).
ligne('C', "Grand Parc",7).
ligne('C', "Émile Counord",8).
ligne('C', "Camille Godard",9).
ligne('C', "Place Paul Doumer",10).
ligne('C', "Jardin Public",11).
ligne('C', "Quinconces",12).
ligne('C', "Place de la Bourse",13).
ligne('C', "Porte de Bourgogne",14).
ligne('C', "Saint-Michel",15).
ligne('C', "Sainte-Croix",16).
ligne('C', "Tauzia",17).
ligne('C', "Gare Saint-Jean",18).
ligne('C', "Belcier",19).
ligne('C', "Carle Vernet",20).
ligne('C', "Bègles Terres Neuves",21).
ligne('C', "La Belle Rose",22).
ligne('C', "Stade Musard",23).
ligne('C', "Calais – Centujean",24).
ligne('C', "Gare de Bègles",25).
ligne('C', "Parc de Mussonville",26).
ligne('C', "Lycée Vaclav Havel",27).


correspondances(Ligne,Arret,LigneC):-ligne(Ligne,LigneC,_),ligne(Arret,LigneC,_).

numeroArret(Ligne, Arret, X) :- ligne(Ligne, Arret, X).

ligneDepartArrive(Depart,Arriver,X,Y) :- ligne(X, Depart, _), ligne(Y, Arriver, _).

ordre(NumDepart,NumArriver,X) :- (NumDepart > NumArriver), X is -1.
ordre(NumDepart,NumArriver,X) :- (NumDepart < NumArriver), X is 1.

afficher(Ligne, D, A):- D == A, ligne(Ligne, Nom, D), writef("%w - %w\n", [Ligne, Nom]).

afficher(Ligne, D,A) :- ligne(Ligne, Nom, D),
	writef("%w - %w\n", [Ligne, Nom]),
	ordre(D, A, X), Inc is D + X,
	afficher(Ligne, Inc, A).


run(Depart,Arrive):- ligneDepartArrive(Depart,Arrive,NumDepart,NumArrive),
	NumDepart == NumArrive,
	numeroArret(NumArrive, Depart, NumLigneDepart),
	numeroArret(NumArrive, Arrive, NumLigneArrive),
	afficher(NumDepart, NumLigneDepart, NumLigneArrive).


run(Depart,Arrive):- ligneDepartArrive(Depart,Arrive,NumDepart,NumArrive),
	numeroArret(NumDepart, Depart, NumLigneDepart),
	numeroArret(NumArrive, Arrive, NumLigneArrive),
	correspondances(NumDepart, NumArrive, Corres),
	numeroArret(NumDepart, Corres, IdCorresD),
	numeroArret(NumArrive, Corres,IdCorresA),
	afficher(NumDepart, NumLigneDepart, IdCorresD),
	write("Correspondance\n"),
	afficher(NumArrive, IdCorresA, NumLigneArrive).

