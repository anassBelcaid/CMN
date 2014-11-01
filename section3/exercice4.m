% script pour comparer le valeurs de deux expressions
clc
%indices puissances
i=7:17;

%valeur de x
X=10.^(-i);


for x=X
    y=((x+1)-1)/x;
    z=(x+(1-1))/x;
    fprintf('%e\t%e\n',y,z);
end