%exercice pour comparer les conditions de stabilité
% des methodes Euler[explicite/implicite]

%preparer l'espace de travail
clc
clear all

%données dur probleme
%intervalle
a=0; b=50;
%condition initiale
y0=1;
%valeurs du pas
H=[30/16,2,30/14];

%boucle sur chaque pas
for h=H
    %lancer une nouvelle figure
    figure()
    
    %appel la methode Euler Explicite
    [T,Y]=euler_explicite(@fCauchy7,a,b,y0,h);
    
    %appel de la methode Euler implicite
    [T,Y1]=euler_implicite(@fCauchy7,a,b,y0,h);
    
    %solution Exacte
    E=fExacte7(T);
    
    %graphe
    hold on
    grid on
    id=plot(T,Y,'b--*');
    plot(T,Y1,'g-o')
    plot(T,E,'r-');
    legend('Euler_expl','euler_impl','exacte')
    title(strcat('euler explicite pour h=',num2str(h)))
    saveas(id,strcat('graph lam=',num2str(h),'.pdf'))
end