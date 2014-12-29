function A=tri_def_pos(n)
    %% fonction pour construire une matrice
    % tridiagonale de taille n
    
    %vecteur de la diagonale principale
    u=3*ones(n,1);
    
    %vecteur des sous diagonale
    v=-1*ones(n-1,1);
    
    A=diag(u)+diag(v,1)+diag(v,-1);
end