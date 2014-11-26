% solution exercice2
clc 
clear all
%constantes
a=0.05;
h=0.1;
y0=exp(-a*pi^2/4);

%methode D'euler
[T,Y]=euler_explicite(@fCauchy2,pi/2,10,h,y0);

%solution exacte
E=fExacte2(T);

%methode Heun
[T,H]=Heun(@fCauchy2,pi/2,10,h,y0);

%methode RungeKutta
[T,R]=rungeKutta(@fCauchy2,pi/2,10,h,y0);

%representation graphique
hold on
id=plot(T,Y,'b*');
plot(T,E,'r-','lineWidth',2);
plot(T,H,'g--')
plot(T,R,'k^')
legend('Euler','Solution Exacte','Heun','RungeKutta');
title('Comparaison des methodes ODE','fontSize',18);

saveas(id,'figure.pdf')

%creation du fichier

Err_e=abs(Y-E);
Err_h=abs(H-E);
Err_r=abs(R-E);

%ouvrir le fichier
fid=fopen('erreurs.txt','w');

n=length(T);

for i=1:n
    fprintf(fid,'%f\t%f\t%f\t%f\n',T(i),Err_e(i),Err_h(i),Err_r(i));
end