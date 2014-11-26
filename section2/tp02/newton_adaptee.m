function z=newton_adaptee(F,c0,t,h)
%fonction d'algorithme de newton adapté au
% cas du schema Euler implicite

y0=c0;
iter=0;
err=1;

%boucle principale

while(err>1E-2 && iter<1E3)
   
    %calculer phi(y0)
    phi=y0-c0-h*F(t,y0);
    %calculer l'iteration de newton
    y1=y0- phi/(1+h);
    
    %calculer l'erreur
    err=abs(y1-y0)/abs(y0);
    
    %mettre a jour y0 et iter
    y0=y1;
    iter=iter+1;
end
z=y1;
end