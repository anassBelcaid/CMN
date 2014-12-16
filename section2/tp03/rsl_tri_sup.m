function x=rsl_tri_sup(A,b)

  %fonction pour rédoure un système triangulaire inf
  % en utilisant l'algorithme de descente
  
  %nombre de lignes de la matrice
  n=size(A,1);
  
  %etape 1: verifier que A est triangulaire inf
  for i=1:n
      for j=1:i-1
          if(A(i,j)~=0)
              error('matrice n est pas triangulaire inf');
          end
      end
  end
  %etape 2: verifier que A est régulière
  for i=1:n
      if(A(i,i)==0)
          error('matrice singuliere')
      end
  end
  %etape 3: appliquer la descente
  x=zeros(n,1);
  x(n)=b(n)/A(n,n);
  
  for i=n-1:-1:1
      x(i)=(b(i)- A(i,i+1:n)*x(i+1:n))/A(i,i);
  end
end