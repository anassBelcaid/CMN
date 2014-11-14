%% script pour calculer la solution par la méthode d'Euler

%consantes
a=10;b=2;c=1;

%appel à la méthode Euler
[T,Y]=euler_explicite(@fCauchy,0,1,0.1,a);

%calculer la solution exacte
E=fExacte(T);

%representation graphique
hold on
plot(T,Y,'b*')
plot(T,E,'r-')
legend('Euler','Exacte')
title('Convergence du schema Euler')

%nouvelle figure
figure()
errorbar(Y,abs(Y-E))