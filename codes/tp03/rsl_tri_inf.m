function x=rsl_tri_inf(A,b)
    %% fonction pour résoudre un système inférieur Ax=b
    
    %vérifier si le système est triangulaire
    n=length(A);
    
    for i=1:n
        for j=i+1:n
            if(A(i,j)~=0)
                error('matrice non trigulaire inf')
            end
        end
    end
    
    %vérifier si la matrice est régulière
    for i=1:n
        if(A(i,i)==0)
            error('System singulier')
        end
    end
    
    %résolution du system par l'algorithme de descente
    
    %initialisation
    x=zeros(n,1);
    x(1)=b(1)/A(1,1);
    
    for i=2:n
        x(i)=(b(i)-A(i,1:i-1)*x(1:i-1))/A(i,i);
    end
    
end