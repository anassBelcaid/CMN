function z=newton_adaptee(F,tn,yn,h)
    %fonction de newton adaptée au schema Euler
    
    %initiation de la valeur de l'erreur pour passer
    % le premier test
    err=1;
    
    %nombre d'iterations
    iter=0;
    
    %boucle principale
    z1=yn;
    while(err>1E-2 && iter<1E3)
        %calcul de Phi(y)
        PhiY=z1-yn-h*F(tn,z1);
        
        %calcul de z2 en utilisant le schéma de newton
        z2=z1- PhiY/(1+h);
        
        %calculer l'erreur
        err=abs(z2-z1)/abs(z1);
        
        %mettre a jour z2
        z1=z2;
        iter=iter+1;
    end
    z=z2;
end