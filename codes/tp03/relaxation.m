function [x1,iter]=relaxation(A,b,w,x0,iterMax,tol)
%% fonction pour résoudre un système linéaire en utilisant la méthode 
% itérative de relaxation

   %% intialisation
    iter=0;
    x1=x0;
    n=size(A,1);   %nombre de ligne de A
    
    %calcul du résidu
    R=norm(b-A*x0);
    
    %schema iteratif
    while(R>tol && iter<iterMax)
        
        %calculer le nouvelles composantes de x
        for i=1:n
            %produit scalaire 1
            s1=A(i,1:i-1)*x1(1:i-1);
            
            %produit scalaire 2
            s2=A(i,i+1:n)*x0(i+1:n);
            
            %calcul du nouveau x1
            x1(i)=w*(b(i)-s1-s2)/A(i,i)+(1-w)*x1(i);
        end
        
        %calcul du nouveau résidu
        R=norm(b-A*x1);
        
        %préparer la nouvelle iteration
        iter=iter+1;
        x0=x1;
    end
    
    if(iter>=iterMax)
        error('algorithme nas pas converge');
    end

end