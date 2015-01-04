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
        %tester if A(i,i) different de 0
        code
        
        %elimination pour les lignes k+1...    
        for k=i+1:n   
            
            %calculer le coefficient de multiplication
            code

            %changer la ligne i
            code
            
        end
    end

   %appliquer l'algorithme de montée sur le système AB
   code
end
