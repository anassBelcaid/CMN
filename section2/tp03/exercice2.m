%% script pour étudier le nombre d'itération
% de jacobi sur une matrice tridiagonale

format long

%générer la matrice A
A=tri_def_pos(10);
b=A*(1:10)';

[x,iter]=jacobi(A,b,ones(10,1),1E-4,1E3)