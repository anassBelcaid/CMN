function [x1,iter]=jacobi(A,b,x0,tol,iterMax)
%% fonction pour calculer la solution de
% Ax=b en utilisant une méthode iterative
% de jacobi

%% Entrées
% A       : matrice du système
% b       : second membre
% x0      : vecteur initial
% tol     : tolérance du test d'arret
% iterMax : nombre maximal d'itérations

%% Sorties
%  x1  : solution approché du systeme
% iter : nombre d'itérations


%% inialisation
n=size(A,1);      % nombre de lignes
iter=0;
x1=x0;
rk=norm(A*x1-b,2);

%boucle principale
while(rk>tol && iter<iterMax)
   
    %claculer x1
    for i=1:n
        %calculer le premier produit scalaire
        s1=A(i,1:i-1)*x0(1:i-1);
        %calculer le deuxième produit scalaire
        s2=A(i,i+1:n)*x0(i+1:n);
        
        %calculer x1(i)
        x1(i)=(b(i)-s1-s2)/A(i,i);
    end
    
    %prépare l'itération suivante
    iter=iter+1;
    x0=x1;
    rk=norm(A*x1-b,2);
end

if(iter>=iterMax)
    error('jacobi nas pas converge');
end
    
end
