%script pour comparer deux expressions
clc

%indices
i=7:17;

%expressions de x
X=10.^(-i);

for x =X
   y=((x+1)-1)/x;
   z=(x+(1-1))/x;
   fprintf('y=%.16f\tz=%.16f\n',y,z)
end