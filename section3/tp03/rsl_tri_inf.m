function x=rsl_tri_inf(A,b)
%% fonction pour résoudre le système triangulaire inf
% en utilisant l'algorithme de descente
n=length(b);

for i=1:n
   for j=i+1:n
       if(A(i,j)~=0)
           error('matrice non tri inf')
       end
   end
end

for i=1:n
   if(A(i,i)==0)
       error('matrice singuliere');
   end
end


if(prod(diag(A))==0)
    error('matrice singuliere');
end


%lancer l'algorithme de descente
%indice (penser a utiliser le produit scalaire

x=zeros(n,1);
x(1)=b(1)/A(1,1);

for i=2:n
    x(i)=(b(i)-A(i,1:i-1)*x(1:i-1))/A(i,i);
end

end