%% script pour résoure une équation aux derivées ordinaires

%constantes
a=10;
b=2;
c=1;

%resolution par la méthode Euler
[X,Y]=euler_explicite(@fCauchy,0,1,10,0.1);

%calculer la fonction exacte
E=fExacte(X);

%representation graphique
hold on
plot(X,Y,'r*-')
plot(X,E,'b-')
legend('euler','exacte')
title('resolutin dune ode par la methode euler')

%representer l'écart enter la solution analytique et numerique
figure()
errorbar(X,E,abs(E-Y))
title('representation des ecarts')