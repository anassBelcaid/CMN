function z=fExacte(t)
% fonciton exacte du problème
a=10;
b=2;
c=1;

z=1./(((b-a)/(a*b))*exp(-c*t)+1/b);

end