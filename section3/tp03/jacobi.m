function [x1,iter]=jacobi(A,b,x0,tol,iterMax)
%% fonction pour résoudre le système Ax=b en utilisant l
% le schémati itérativ de jacobi

%% Entrées
% A= matrice du systeme
% b= second membre
% x0= vecteur initial
% tol = tolérance du test d'arret
% iterMax= nombre maximal d'itérations


%% Sorites
% x1= approximation de la solution
% iter= nombre d'itérations pris pour calculer x1


    %initialistaion
    iter=0;
    n=size(A,1);
    x1=x0;
    rk=norm(A*x1-b,2);
    
    %boucle principale
    while(rk>tol && iter<iterMax)
        
        %calculer les valeur de x1
        for i=1:n
            %premier produit scalaire
            s1=A(i,1:i-1)*x0(1:i-1);
            
            %deuxière produit scalaire
            s2=A(i,i+1:n)*x0(i+1:n);
            
            %calcul de l'expression de xi
            x1(i)=(b(i)-s1-s2)/A(i,i);
          
        end
        
        %prépare l'itération suivante
        rk=norm(A*x1-b,2);
        x0=x1;
        iter=iter+1;
    end
    
    if(iter>=iterMax)
        error('jacobi nas pas convege')
    end
    
    
end