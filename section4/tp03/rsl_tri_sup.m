function x=rsl_tri_sup(A,b)
%fonciton pour résoudre un système triangulaire
% inférieur en utilisant l'algorithme de descente

n=length(b);

%s'assurer que A est triangulaire sup
for i=1:n
    for j=1:i-1
        if(A(i,j)~=0)
            error('matrice non tri sup');
        end
    end
end


%s'assurer que la  matrice est régulière
% soit en utilisant for soit en utilisant la fonction diag

for i=1:n
    if(A(i,i)==0)
        error('matrice singuliere')
    end
end

% appliquer l'algorithme de descente
%(indice) penser au produit scalaire

%initalisation
x=zeros(n,1);

x(n)=b(n)/A(n,n);

%boule for

for i=n-1:-1:1
    x(i)=(b(i)- A(i,i+1:n)*x(i+1:n))/A(i,i);
end




end