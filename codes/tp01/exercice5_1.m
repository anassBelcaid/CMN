%% script pour illuster la soustration de deux nombres voisins

%demander à l'utilisateur la saisie de x
x=input('donner la valeur de x:');


%Calcul de la premiere expression
E1=sqrt(x+1)-sqrt(x);

%deuxieme formule
E2=1.0/(sqrt(x+1)+sqrt(x));

%Affichage
fprintf('E1=%.4e\tE2=%.4e\tdiff=%.4e\n',E1,E2,abs(E1-E2))