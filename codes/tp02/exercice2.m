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

%calcul des erreurs
E_eu=abs(E-Y);
E_hu=abs(E-H);
E_rk=abs(E-R);

for i =1:n
    fprintf(fid,'%.16f\t%.16f\t%.16f\t%.16f\n',X(i),E_eu(i),E_hu(i),E_rk(i));
end

%sauvegarde des erreurs totales
fprintf(fid,'%.16f\t%.16f\t%.16f\t%.16f\n',0,max(E_eu),max(E_hu),max(E_rk));

%fermer le fichier
fclose(fid);

%representation des erreurs
%chargement du fichier
Errs=load('erreurs.txt');

%representer les erreurs
figure()
hold on
plot(Errs(1:end-1,1),Errs(1:end-1,2),'b--')
plot(Errs(1:end-1,1),Errs(1:end-1,3),'r*')
plot(Errs(1:end-1,1),Errs(1:end-1,4),'go')
legend('err_euler','Err_Heun','Err_RungeKutta')
title('Erreurs')
