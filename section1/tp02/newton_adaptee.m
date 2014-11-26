function z=newton_adaptee(F,c0,t,h)

%fonction pour calculer la racine d'une fonction F
% en utilisant la méthode de newton

%initialisation
err=1
iter=0;
y0=c0;

while(err>1E-2 && iter<1E3)
    
    %calcul de Phi(yi+1)
    phi=y0-c0-h*F(t,y0);
    
    %iteration de newton
    y1=y0- phi/(1+h);
    
    %calculer l'erreur
    err=abs(y1-y0)/abs(y0);
    
    %mettre a jour
    iter=iter+1;
    y0=y1;
   
end
z=y1;
end