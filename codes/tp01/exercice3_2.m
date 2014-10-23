%% Script pour représenter graphiquement les nombre de l'ensemble


%% Initialisation des constantes de l'ensemble
B=2;
t=3;
L=-1;
U=3;

%% Initialisation de l'enemble sous forme d'un vecteur en 0
% calcul du cardinal de F
N=2*(B^(t-1))*(B-1)*(U-L+1);

% Initalisation de l'ensemble
F=zeros(N/2,1);
j=1;

% Calcul des elements min et max pour m
mInf=2^(t-1);
mMax=2^t -1;

%% Construction de la  partie positive
for e=L:U              % boucle sur les exposantes
    for m=mInf:mMax    % boocle sur la mantisse
        F(j)=m*2^(e-t);
        j=j+1;
    end
end

%% Ajouter les elements négatifs
F=[-F;F];

% Mettre F en ordre
F=sort(F);

%% Représentation graphique
%vector of colors
scatter(F,zeros(size(F)),'filled');
grid on
title('Distribution des nombres F(2,3,-1,1)');