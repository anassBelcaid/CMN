function [r1,r2]=polynome2(a,b,c)
%% fonction pour calculer les racines du polynome
% ax**2+b*x +c

%% entrées:
% coefficients a,b,c

%% Sorties:
% r1,r2: les deux racines du polynome

%calcul du descriminant
delta=(b^2-4*a*c);

if(delta>=0)
    r1=(-b+sqrt(delta))/(2*a);
    r2=(-b-sqrt(delta))/(2*a);
else
    %on choisit d'afficher un message d'erreur
    error('descriminant negatif');
end
end