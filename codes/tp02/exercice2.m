%script pour résoudre le problème 2 de la série

%résoudre en utilisant Euler
a=0.05;
y0=exp(-a*(pi/2)^2);
h=0.1;


%Euler explicite
[X,Y]=euler_explicite(@fCauchy2,pi/2,10,y0,h);

%Heun
[X,H]=Heun(@fCauchy2,pi/2,10,y0,h);

%runge Kutta
[X,R]=rungeKutta(@fCauchy2,pi/2,10,y0,h);

%obtenir la méthode exacte
E=fExacte2(X);


%representation graphique
hold on
h=plot(X,Y,'b*');
plot(X,E,'r-','lineWidth',2);
plot(X,H,'k^')
plot(X,R,'m--')
legend('Euler','Exacte','Heun','rungeKutta')
xlabel('t');ylabel('y(t)');
title('Comparaison des methode ODE','fontSize',18)

%sauvegarde du graphique
saveas(h,'methods.png')


%ouverture du fichier pour la sauvegarde

fid=fopen('erreurs.txt','w');
%calculer la longeur 
n=length(X);

for i =1:n
    fprintf(fid,'%f\t%f\t%f\t%f\n',X(i),abs(E-Y),abs(E-H),abs(E-R))
end

%representation des erreurs

%chargement du fichier
Errs=load('erreurs.txt');
