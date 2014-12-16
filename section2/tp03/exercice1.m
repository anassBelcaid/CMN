%% script pour résoudre un systeme linéaire Ax=b
% en utilisant l'opérateur de matlab, puis notre 
% decomposition LU


%constantes
V=10;

%system
A=[ 1 -1 -1 0 0;
    5  5  0 0 0;
    0  0  1 -1 -1;
    0  5  -7 -2 0;
    0  0  0  2  -3];

b=[0;V; 0; 0; 0];

%resoudre le systeme
fprintf('solution par loperateur \\')
x=A\b


%resolution par notre LU

%calculer la decomposition
[L,U]=lu_dcm(A);

%resoudre le systeme inf
y=rsl_tri_inf(L,b);

%resoudre le sytme sup
fprintf('resolution par LU');
x=rsl_tri_sup(U,y)