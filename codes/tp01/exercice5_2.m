%% tester la fonction polynome2 pour différents cas de (a,b,c)

%premier cas
a=6;b=5;c=-4;
%calculer les racines en utilisant polynome2
[r1,r2]=polynome2(a,b,c);

%vérifier les résultats en calculant f(r1) et f(r2)
fr1=a*r1*r1+b*r1+c;
fr2=a*r2*r2+b*r2+c;

%affichage
fprintf('f(r1)=%e\t f(r2)=%e\n',fr1,fr2)

%deuxième cas
a=1E-8;b=-0.8;c=1E-8;
%calculer les racines en utilisant polynome2
[r1,r2]=polynome2(a,b,c);

%vérifier les résultats en calculant f(r1) et f(r2)
fr1=a*r1*r1+b*r1+c;
fr2=a*r2*r2+b*r2+c;

%affichage
fprintf('f(r1)=%e\t f(r2)=%e\n',fr1,fr2)