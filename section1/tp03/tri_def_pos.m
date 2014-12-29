function A=tri_def_pos(n)
    %% fonction pour générer une matrice tridiagonale 
    % de taille n
    
    %vecteur principal
    u=3*ones(n,1);
    
    %vecteur supérieur
    v=-1*ones(n-1,1);
    
    
    A=diag(u)+diag(v,1)+diag(v,-1);

end