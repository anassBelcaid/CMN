%% tester la taux de convergence de la méthode de jacobi
format long
n=10;
%Construire la matrice A
A=tri_def_pos(n);
b=A*(1:n)';

%jacobi

[x,iter]=jacobi(A,b,zeros(n,1),1E-4,1E3)