function x=rsl_tri_inf(A,b)
%fonciton pour résoudre un système triangulaire
% inférieur en utilisant l'algorithme de descente

n=length(b);

%s'assurer que A est triangulaire inf
for i=1:n
    for j=i+1:n
        if(A(i,j)~=0)
            error('matrice non tri inf');
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

x(1)=b(1)/A(1,1);

%boule for

for i=2:n
    x(i)=(b(i)- A(i,1:i-1)*x(1:i-1))/A(i,i);
end




end