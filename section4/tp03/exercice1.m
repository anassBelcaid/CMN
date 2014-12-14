%% script pour implémenter la decomposition de Gauss
clc
clear all
%valeur initial du Tension
V=10;

%matrice des courants

A=[5 5 0 0 0;
   1 -1 -1 0 0;
   0 -5 7 2 0;
   0  0 1 -1 -1;
   0  0 0 2 -3];

%second membre 
b=[V;0; 0; 0; 0];


%resolution
fprintf('la solution par \\');
I1=A\b


%resolutio par lu
[L,U]=lu_dcm(A);

%resolution du systeme inferieur
y1=rsl_tri_inf(L,b);

%rsolution du système supérieur
fprintf('resolution par LU');
I2=rsl_tri_sup(U,y1)

