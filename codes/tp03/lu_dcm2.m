function LU=lu_dcm2(A)
    % fonction 2 pour calculer la décomposition LU de A
    
    %nombre de ligne de A
    n=size(A,1);
    for k=1:n-1
         %calcul du terme de la diagonale de U
        for i=k+1:n
            A(i,k)=A(i,k)/A(k,k);
        
            
            for j=k+1:n
                A(i,j)=A(i,j)-A(i,k)*A(k,j);
            end
        end
    end
    LU=A;
end