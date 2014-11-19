function z=fExacte2(t)
%fonction exacte du deuxieme probleme
    a=0.05;
    z=sin(t).*exp(-a*t.^2);
end