function [L,U]=lu_dcm(A)
%% fonction pour obtenir la decomposition A=LU
% les matrices L,U seront stockés dans A

    %calculer la taille de A
    n=length(A);
    L=eye(n);
    U=zeros(n);
    
    %premiere valeur de U11
    U(1,1)=A(1,1);
    %premire ligne et colonne et (U,L)
    for j=2:n
        U(1,j)=A(1,j);
        L(j,1)=A(j,1)/A(1,1);
    end
    
    for i=2:n-1    
        %calcul de A(i,i)
        U(i,i)=A(i,i)- L(i,1:i-1)*U(1:i-1,i);
        
        %ieme ligne de U et colonne de L
        for j=i+1:n
            U(i,j)=A(i,j)-L(i,1:i-1)*U(1:i-1,j);
            L(j,i)=(A(j,i)- L(j,1:i-1)*U(1:i-1,i))/U(i,i);
        end
    end
        
    %dernier element
    U(n,n)=A(n,n)-L(n,1:n-1)*U(1:n-1,n);
end