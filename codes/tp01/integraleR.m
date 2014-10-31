function z=integraleR(n)
    %fonction pour calculer une approximation de l'intégrale
    % d'une manière récurrente.
    
    %inialisation
    z=log(11/10);
    
    for i=1:n
        z=1/i -10*z;
    end
end