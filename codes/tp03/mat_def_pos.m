function A=mat_def_pos(n)
    % fonction pour générer une matrice tridiagonale , définie positive
    % pour tester l'algorithme de jacobi
    
    A=3*eye(n)-diag(ones(n-1,1),1)-diag(ones(n-1,1),-1);

end