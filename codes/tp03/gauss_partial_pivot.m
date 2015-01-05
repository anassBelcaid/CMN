function [x]=gauss_partial_pivot(AB)
    %% Résolution d'un système linéaire avec la méthode de gauss avec
    % une stratégie de pivot partielle.
    
    
    [n,m]=size(AB);
    if(n~=m-1)
        error('la matrice AB doit contenir A et b');
    end
    
    for i=1:n-1
        %calculer l'indice du pivot partiel p
        [pivot,p]=max(abs(AB(i:end,i)));
        
        %coriger p vu qu'on a pris un sous tableau 
        p=p+i-1;
        
        %permuter la ligne i avec p
        AB([i,p],:)=AB([p,i],:);
        
        
        %appliquer le procede de gauss
        for k=i+1:n
            %constante de multiplication
            mk=AB(k,i)/AB(i,i);
            
            %changer la ligne k
            AB(k,i:end)=AB(k,i:end)-mk*AB(i,i:end);
        end
    end
  
    %résolution du système avec l'algorithme de montée
    x=rsl_tri_sup(AB(:,1:end-1),AB(:,end));
end
