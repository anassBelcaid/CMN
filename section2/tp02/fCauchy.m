function Z=fCauchy(t,y)
    %fonction modélisant la fonction de Cauchy
    c=1;
    b=2;
    
    Z=c*y-(c/b)*y*y;
end