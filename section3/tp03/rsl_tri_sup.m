function x=rsl_tri_sup(A,b)
%% fonction pour résoudre le système triangulaire inf
% en utilisant l'algorithme de descente
n=length(b);

for i=1:n
   for j=1:i-1
       if(A(i,j)~=0)
           error('matrice non tri sup')
       end
   end
end

for i=1:n
   if(A(i,i)==0)
       error('matrice singuliere');
   end
end



%lancer l'algorithme de descente
%indice (penser a utiliser le produit scalaire

x=zeros(n,1);
x(n)=b(n)/A(n,n);

for i=n-1:-1:1
    x(i)=(b(i)-A(i,i+1:n)*x(i+1:n))/A(i,i);
end

end