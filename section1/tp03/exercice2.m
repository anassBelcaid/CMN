%% script pour tester le nombre d'itérations de jacobi

format long

n=10;
%matrice du système
A=tri_def_pos(n);
b=A*(1:n)';

%jacobi
[x,iter]=jacobi(A,b,zeros(n,1),1E-4,1E3)