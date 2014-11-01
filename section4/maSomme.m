function [z1,z2]=maSomme(A)
    %fonction pour calculer la somme d'un vecteur
    z1=0;
    z2=1;
    n=length(A);
    for i=1:n
        z1=z1+A(i);
        z2=z2*A(i);
    end
    
end