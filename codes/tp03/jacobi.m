function [x1,iter]=jacobi(A,b,x0,iterMax,tol)
%% fonction pour résoudre le système Ax=b, en utilisant la
% méthode iterative de Jacobi.

    %% Entrées:
    %  A,b    :  matrice et second membre du syteme
    %   x0    :  veteur intial
    % iterMax :  nombre maximal d'itération
    %  tol    : tolérance pour le test d'arret

    %% Sorties:

    %  x    : approximation du vecteur solution
    %  iter : nombre d'itérations utilisées
    
    
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
            x1(i)=(b(i)-A(i,1:i-1)*x0(1:i-1)-A(i,i+1:n)*x0(i+1:n))/A(i,i);
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