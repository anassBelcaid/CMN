%exercie pour comparer la stabilité entre Euler
% implicite et explicite

clear all         %detruire toutes les variables
clc               %effacer l'ecran

%constantes
a=0;b=50;
y0=1;

%Tableau des pas h

H=[30/16,2,30/14];

for h=H
    %nouvelle figure
    figure()
    
    %euler explicite
    [T,Y]=euler_explicite(@fCauchy7,a,b,h,y0);
    
    %Euler implicite
    [T,Y1]=euler_implicite(@fCauchy7,a,b,h,y0);
    %solution exacte
    E=exp(-T);
    
    %representation graphique
    hold on
    id=plot(T,Y,'b--*')
    plot(T,Y1,'ko--')
    plot(T,E,'r-')
    legend('Euler exp','Euler imp','Exacte')
    title(strcat('graphe pour h=',num2str(h)),'fontSize',18)
    saveas(id,strcat('grapheh=',num2str(h),'.pdf'))
    
end