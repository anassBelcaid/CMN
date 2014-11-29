function z=newton_adaptee(F,c0,h,t)

    %initialisation 
    iter=0;
    err=1;
    y0=c0;
    
    while(err>1E-2 && iter<1E3)
        
        %calcul de phi(y0)
        phi=y0-c0-h*F(t,y0);
        
        %iteration de newton
        y1=y0 - phi/(1+h);
        
        %calculer l'erreur
        err=abs(y1-y0)/abs(y0);
        
        %mittre a jour
        y0=y1;
        iter=iter+1;
    end
    z=y1;
end