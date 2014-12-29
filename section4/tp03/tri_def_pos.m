function A=tri_def_pos(n)
%% fonction pour générer une matrice tridiagonale à diagonale
% strictement dominante
    u=3*ones(n,1);
    v=-1*ones(n-1,1);

    A=diag(u) +diag(v,1)+diag(v,-1);

end