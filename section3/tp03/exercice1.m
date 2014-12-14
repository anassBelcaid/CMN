%% script pour tester la decomposition LU d'une matrice


%initialisation de la tension
V=10;

%la matrice du système
A=[1 -1 -1 0 0;
   5  5 0 0 0;
   0 0 1  -1 -1;
   0 -5 7 2 0;
   0 0 0 -2 3];


%second membre
b=[0; V;0 ;0;0];

%resoudre le systeme avec l'operateur \
fprintf('resolution par \\');
I1=A\b


%resolution par Lu
[L,U]=lu_dcm(A);

%resolution du system inferieur
y=rsl_tri_inf(L,b);

%resolution du systeme supérieur
fprintf('resolution par LU');
I2=rsl_tri_sup(U,y)