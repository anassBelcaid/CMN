function x=solve_lu(A,b)
%% fonction pour résoudre le système Ax=b avec la méthode LU
% avec LU resultatn en deux matrices


%decomposition LU
[L,U]=lu_dcm(A);

%resolution du système inférieur
y1=rsl_tri_inf(L,b);

%resolution du système supérieur
x=rsl_tri_sup(U,y1);
end