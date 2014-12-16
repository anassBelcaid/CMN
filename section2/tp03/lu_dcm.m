function [L,U]=lu_dcm(A)
%fonction pour calculer la decomposition LU d'une matrice A

%% fonction pour obtenir la decomposition A=LU
% les matrices L,U seront stockés dans A

    %calculer la taille de A
    n=size(A,1);
    
    %Inialisation des deux matrices
    L=eye(n);
    U=zeros(n);
    
    for k=1:n
        
        U(k,k)=A(k,k);
        
        %calcul de kieme ligne de U et kieme colonne de L
        for i=k+1:n
            L(i,k)=A(i,k)/U(k,k);
            U(k,i)=A(k,i);
        end
        
        %transformation de la matrice intérieure 
        for i=k+1:n
            for j=k+1:n
                A(i,j)=A(i,j)-L(i,k)*U(k,j);
            end
        end
    end

end