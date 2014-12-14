function x=solve2_lu(A,b)
%% fonction pour résoudre le système Ax=b avec la méthode LU
% avec LU stockée dans une seule matrice


%decomposition LU
LU=lu_dcm2(A);

%extraire les matrices (L,U)( ce qui est contradictoire car le but était
% de minimiser l'espace de stockage, donc avec cette stratégie il vaut
%mieux adapter les méthode descente et montee pour ce type de matrice

U=triu(LU);
L=tril(LU);
%introduire 1 dans la diagonale de L
n=size(L,1);

for i=1:n
    L(i,i)=1;
end

%resolution du système inférieur
y1=rsl_tri_inf(L,b);

%resolution du système supérieur
x=rsl_tri_sup(U,y1);

end
