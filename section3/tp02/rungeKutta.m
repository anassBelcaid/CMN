function [T,Y]=rungeKutta(F,a,b,h,y0)
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
    %calcul des coefficients
    k1=F(T(i-1),Y(i-1));
    k2=F(T(i-1)+h/2,Y(i-1)+h*k1/2);
    k3=F(T(i-1)+h/2,Y(i-1)+h*k2/2);
    k4=F(T(i),Y(i-1)+k3*h);
    
    %forlume RK4
    Y(i)=Y(i-1)+h*(k1+2*k2+2*k3+k4)/6
end
end