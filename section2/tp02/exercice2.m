% script pour résoudre le deuxième exercice

%données du problème
a=0.05;
h=0.1;
y0=exp(-a*(pi^2/4));

%calcul des valeurs d'Euler
[T,Y]=euler_explicite(@fCauchy2,pi/2,10,h,y0);

%calcul des approximation de Heun
[T,H]=Heun(@fCauchy2,pi/2,10,h,y0);

%calcul de Runge-Kutta
[T,R]=rungeKutta(@fCauchy2,pi/2,10,h,y0);

%calcul des valeurs exactes
E=fExacte2(T);

%representation graphique
hold on
id=plot(T,Y,'b*')
plot(T,E,'r--','lineWidth',2)
plot(T,H,'g^')
plot(T,R,'ko')
legend('Euler','Exacte','Heun','Runge-Kutta')
title('comparaison des methodes','fontSize',18)
saveas(id,'graphe.pdf')


%sauvegarde du fichier erreurs
n=length(T);

fid=fopen('erreurs.txt','w');
for i=1:n
    fprintf(fid,'%f\t%f\t%f\n',abs(Y(i)-E(i)),abs(H(i)-E(i)),abs(R(i)-E(i)));
end

%fermer 
fclose(fid);
