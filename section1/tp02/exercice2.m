%script pour répondre à l'exercice 2

%initialisatin des données
a=0.05;
y0=exp(-a*(pi/2)^2);   %condition initiale
h=0.1;  % pas de la descritisation


%appel de la méthode D'Euler
[X,Y]=euler_explicite(@fCauchy2,pi/2,10,h,y0);



%calculer la solutin analytique
E=fExacte2(X);

%calcul des valeurs de la méthode de Heun
[X,H]=Heun(@fCauchy2,pi/2,10,h,y0);


%calcul par Runge Kutta
[X,R]=rungeKutta(@fCauchy2,pi/2,10,h,y0);


%representation graphique
hold on
id=plot(X,Y,'b*')
plot(X,E,'r-','lineWidth',2)
plot(X,H,'g--')
plot(X,R,'k^')
legend('Euler','Exacte','Heun','runge-kutta')

title('Comparaison des methodes ODE','fontSize',18)
saveas(id,'graphe.pdf')