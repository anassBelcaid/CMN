%% script pour tester l'algorithme de jacobi
format long
n=10;

%génerer la matirce du système
A=tri_def_pos(n);
b=A*(1:n)';


%jaboci
[iter,x]=jacobi(A,b,zeros(n,1),1E-4,1E3)