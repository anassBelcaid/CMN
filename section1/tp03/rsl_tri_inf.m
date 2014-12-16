function x=rsl_tri_inf(A,b)
% fonction pour résoudre un system lineaire triangulaire inf
% en utilisant l'algorithme de descente

%obenir le nombre des lignes de A
n=size(A,1);

%vérifier que la matrice est triangulaire

for i=1:n
    for j=i+1:n
        if(A(i,j)~=0)
            error('matrince non triangulaire inf');
        end
    end
end


%etape 2 : vérifier que la matrice est régulière
for i=1:n
    if(A(i,i)==0)
        error('matrice singulière')
    end
end

%etape 3: résoudre le système par la descente
x=zeros(n,1);

x(1)=b(1)/A(1,1);

for i=2:n
    x(i)=(b(i)- A(i,1:i-1)*x(1:i-1))/A(i,i);
end

end