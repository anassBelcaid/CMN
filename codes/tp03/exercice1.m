%% script pour résoudre un systeme d'équations linéaires par 
% la méthode directe de décomposition LU
clc
clear all

%fixer la valeur de V
V=10;

%matrice A
A=[1 -1 -1 0 0;
   5  5 0  0 0;
   0  0 1 -1 0;
   0  5 -7 -2 0;
   0  0  0 2 -3];

%vecteur b
b=[V;0;0;0;0];

%resolution par l'opérateur de matlab
fprintf('solution par loperateur matlab:')
x=A\b

%testing the solution with lu_dcm
fprintf('solution par la decomposition LU:')
x1=solve2_lu(A,b)
