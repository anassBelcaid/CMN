function [x]=gauss_elm_smp(AB)
    %% fonction pour résoudre un système Ax=b en utilisant 
    % la stratégie d'élmination de gauss sans pivot
    
    %% Entrée:
    % AB:  Tableau (n,n+1) contenant la matrice A et b en dernière colonne
    
    %% Sortie:
    % x: approximation de la solution Ax=b
    
    
    %obtenir la taille du tableau
    [n,m]=size(AB);
    if(n~=m-1)
        error('Votre tableau doit contenir la matrice et le second membre b')
    end
    
    
    %algorithme de gauss
    for i=1:n-1
        %tester if A(k,k) different de 0
        if(AB(i,i)==0)
                %construire un message d'erreur contenant la ligne du pivot
                msg=sprintf('pivot %d est null',i);
                error(msg);
        end
  
        
        %elimination pour les lignes k+1...    
        for k=i+1:n   
            
            %calculer le coefficient de multiplication
            mk=AB(k,i)/AB(i,i);
            
            %changer la ligne i
            AB(k,i:end)=AB(k,i:end)-mk*AB(i,i:end);
            
        end
    end

   %appliquer l'algorithme de montée sur le système AB
   x=rsl_tri_sup(AB(:,1:end-1),AB(:,end));
end