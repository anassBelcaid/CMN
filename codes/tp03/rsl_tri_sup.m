function x=rsl_tri_sup(A,b)
    %% fonction pour résoudre un système supérieur Ax=b
    
    %vérifier si le système est triangulaire
    n=length(A);
      
    %vérifier si la matrice est régulière
    for i=1:n
        if(A(i,i)==0)
            error('System singulier')
        end
    end
    
    %résolution du system par l'algorithme de montée
    
    %initialisation
    x=zeros(n,1);
    x(n)=b(n)/A(n,n);
    
    %boucle inversée
    for i=n-1:-1:1
        x(i)=(b(i)-A(i,i+1:n)*x(i+1:n))/A(i,i);
    end
    
end