function [x1,iter]=jacobi(A,b,x0,tol,iterMax)
%% fonction pour résoudre le système Ax=b en utilisant 
% la méthode itérative de jacobi 

%% entrées:
%  A     : matrice du système
%  b     :   second membre
%  x0    : vecteur initial
%  tol   : tolérance du test d'arret
%iterMax : le nombre maximal d'itérations

%% sorties

%  x1  : approximation de la solution
% iter : le nombre d'itérations


%initialisation
x1=x0;
iter=0;
rk=norm(A*x1-b,2);
n=size(A,1);

%boucle principale

while(rk>tol && iter<iterMax)
   
    %calcul de x1
    for i=1:n
        %premier produit scalaire
        s1=A(i,1:i-1)*x0(1:i-1);
        
        %deuxième produit scalaire
        s2=A(i,i+1:n)*x0(i+1:n);
        
        %calcul de xi
        x1(i)=(b(i)-s1-s2)/A(i,i);
    end
    
    %préparer l'itérations suivante
    iter=iter+1;
    x0=x1;
    rk=norm(A*x1-b,2);
    
end

if(iter>=iterMax)
    error('jacobi nas pas converge')
end


end