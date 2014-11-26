function [T,Y]=Heun(F,a,b,h,y0)
% fonction pour calculer une approximation du probleme
% différentiel en utilisant la méthode Euler

%% Entrées
% F   : handle(reference) de la fonction de Cauchy
% a,b : Intervalle de résolution
%  h  : pas de la déscritisation
%  y0 : condition initiale

%% Sorties
% T: la descritisation
% Y: approximation par Euler

% calculer la descritisation (1 ligne)
T=a:h:b;

% Initialisation
n=length(T);
Y=zeros(1,n);
Y(1)=y0;
%boucle principale pour calculer Y(i)
for i=2:n
    %prediction par Euler explicite
    yTilda=Y(i-1)+h*F(T(i-1),Y(i-1));
    
    %correction
    Y(i)=Y(i-1)+h*(F(T(i-1),Y(i-1))+F(T(i),yTilda) )/2;
end
end