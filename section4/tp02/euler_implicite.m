function [T,Y]=euler_implicite(F,a,b,h,y0)
%% fonction pour appliquer le schéma euler pour résoudre le 
% problème de Cauchy défini par f

%% Entrées
% F  : handle(reference) de la fonction de Cauchy
% a,b: l'intervalle de résolution
%  h : pas de la déscritisation
%  y0: condition initiale

%% Sorties
% T: descritisation de l'intervalle [a,b]
% Y: approximation par la méthode d'Euler

%descitisation ( 1 ligne)
T=a:h:b;

%Initialisation de Y et n( 2 à trois lignes)
n=length(T);
Y=zeros(1,n);
Y(1)=y0;

%boucle principale pour calculer Y(i) i allant de ... à n

for i= 2:n
    Y(i)=newton_adaptee(F,Y(i-1),h,T(i));
end


end