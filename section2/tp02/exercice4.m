%script pour comparer la stabilité des méthodes
% Euler explicite et Euler implicite

clc           %effacer l'ecran
clear all     %detruire toutes les variables


%constantes du problème
a=0;
b=50;
y0=1;

%tableaus des pas
H=[30/16,2,30/14];

for h=H
   %nouvelle fenetre
   figure() 
   
   %Euler
   [T,Y]=euler_explicite(@fCauchy7,a,b,h,y0);
   
   %Euler implicite
   [T,Y1]=euler_implicite(@fCauchy7,a,b,h,y0);
   %exacte
   E=exp(-T);
   
   %graphique
   hold on
   id=plot(T,Y,'b*--');
   plot(T,E,'r-')
   plot(T,Y1,'k--o')
   legend('Euler exp','Exacte','euler imp')
   title(strcat('graphe  pour h=',num2str(h)),'fontSize',18)
   saveas(id,strcat('grapheh=',num2str(h),'.pdf'))
end