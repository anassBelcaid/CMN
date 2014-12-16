function x=rsl_tri_inf(A,b)

  %fonction pour rédoure un système triangulaire inf
  % en utilisant l'algorithme de descente
  
  %nombre de lignes de la matrice
  n=size(A,1);
  
  %etape 1: verifier que A est triangulaire inf
  for i=1:n
      for j=i+1:n
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
  
  if(prod(diag(A))==0)
      error('matrice singulirer')
  end
  
  %etape 3: appliquer la descente
  x=zeros(n,1);
  x(1)=b(1)/A(1,1);
  
  for i=2:n
      x(i)=(b(i)- A(i,1:i-1)*x(1:i-1))/A(i,i);
  end
end