%script pour résoudre le problème (P1) en utilisant la 
% méthode d'Euler explicite

%constantes
a=10;b=2;c=1;

%appliquer la méthode d'Euler
[T,Y]=euler_explicite(fCauchy,0,1,0.1,a);

%solution analytique
E=fExacte(T);

%representation graphique
hold on
plot(T,Y,'b*')
plot(T,E,'r-')
legend('euler','exacte')
title('methode euler')