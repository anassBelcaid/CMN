%% script pour résoudre un systèem en utilisant l'opérateur
% de matlab, puis un décomposition LU


%constantes
V=10;

%Systeme
A=[1 -1 -1 0 0;
   5  5 0  0 0;
   0  0 1  -1 -1;
   0  5 -7 -2 0;
   0  0  0 2 -3];

b=[0;V;0;0;0];
   
%resoudre le syteme
fprintf('solution par loperateur \\')
x=A\b


%resolution par LU

%calculer la decomposition LU de A
[L,U]=lu_dcm(A);

%resoudre le system inf
y=rsl_tri_inf(L,b);

%resoudre le systeme sup
fprintf('solution par Lu')
x=rsl_tri_sup(U,y)