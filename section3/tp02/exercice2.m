% probleme 2 
clc          %effacer l'ecran
clear all    %detruire toutes les variables
%constantes 
a=0.05;
y0=exp(-a*(pi^2/4));
h=0.1;


%Euler
[T,Y]=euler_explicite(@fCauchy2,pi/2,10,h,y0);

%Heun
[T,H]=Heun(@fCauchy2,pi/2,10,h,y0);

%RungeKutta
[T,R]=rungeKutta(@fCauchy2,pi/2,10,h,y0);

%calculer la solution exacte
E=fExacte2(T);

%representation graphique
hold on
id=plot(T,Y,'b*')
plot(T,E,'r-','lineWidth',2)
plot(T,H,'k');
plot(T,R,'m^')
legend('Euler','Exacte','Heun','RungeKutta')
title('comparaison des methodes ODE','fontSize',18);
saveas(id,'figure.pdf')

%construction du fichier erreurs
Err_e=abs(E-Y);
Err_h=abs(E-H);
Err_r=abs(E-R);
n=length(E);

fid=fopen('erreurs.txt','w')

for i=1:n
    fprintf(fid,'%f\t%f\t%f\t%f\n',T(i),Err_e(i),Err_h(i),Err_r(i));
end
fclose(fid);