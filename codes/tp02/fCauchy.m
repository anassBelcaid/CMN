function z=fCauchy(t,y)
    %fonction de cauchy 
    %On peut déclarer a,b et c dans la fonction comme 
    %on peut les considérer comme variables globales
    b=2;
    c=1;
    z=c*y-(c/b)*y*y;
end