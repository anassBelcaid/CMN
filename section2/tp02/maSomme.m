function [S,P]=maSomme(X)
    %fonction pour calculer la somme d'un vecteur
    %calculer la taille
    S=0;
    P=1;
    for val=X
        S=S+val;
        P=P*val;
    end
end