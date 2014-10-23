%% script pour illuster la soustration de deux nombres voisins

%lecture de x
x=input('donner la valeur de x:');


%Calcul de la premiere expression
E1=sqrt(x+1)-sqrt(x);

%deuxieme formule
E2=1.0/(sqrt(x+1)+sqrt(x));

%Affichage
fprintf('%.16f\t%.16f\t%e\n',E1,E2,abs(E1-E2))