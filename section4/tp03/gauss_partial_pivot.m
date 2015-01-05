function [x]=gauss_partial_pivot(AB)
    %% Résolution d'un système linéaire avec la méthode de gauss avec
    % une stratégie de pivot partielle.
    
    
    [n,m]=size(AB);
    if(n~=m-1)
        error('la matrice AB doit contenir A et b');
    end
    
    for i=1:n-1
        %calculer l'indice du pivot partiel p
        code
        %permuter la ligne i avec p
        code
        
        %appliquer le procede de gauss
        code
    end
    
    %résolution du système avec l'algorithme de montée
    code
end
