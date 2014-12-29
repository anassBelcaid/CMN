function [x1,iter]=jacobi(A,b,x0,tol,iterMax)
%% fonction pour résoudre le systeme Ax=b en utilisant le
% schéma iterativ de jacobi

%% entrées
%  A: matrice du système
%  b: le second membre
% x0: Vecteur  initil
% tol:  tolérance du test d'arret
% iterMax:  nombre maximal d'itérations

%% sorties
% x : approximation de la solution
% iter: nombre d'itérations pris pour calculer x


% itinitialsation
iter=0;
rk= norm(A*x0-b,2);                      %résidu
n=size(A,1);                %nombre de lignes
x1=x0;

while(rk>tol && iter<iterMax)
    
    for i=1:n
        %premier produit scalaire
        s1=A(i,1:i-1)*x0(1:i-1);
        %deuxième produit scalaire
        s2=A(i,i+1:n)*x0(i+1:n);
        
        %calculer la formule
        x1(i)=(b(i)-s1-s2)/A(i,i);
        
    end
    
    %calculer le résidu
    rk=norm(A*x1-b,2);
    
    %préparer l'itération suivante
    iter=iter+1;
    x0=x1;
    
end

if(iter>=iterMax)
    error('le schema jacobi nas pas converge')
end