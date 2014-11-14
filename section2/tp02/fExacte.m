function z=fExacte(t)
%fonction exacte du probleme
a=10;
b=2;
c=1;

z=1./((b-a)/(a*b)*exp(-c*t)+1/b);

end