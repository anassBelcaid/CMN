% script pour comparer deux somme


n=1E5;

%valeur de la somme
S=n/(n+1);


%calcul de la premire somme

%s1=0.0;
%for i=1:n
 %   s1=s1+1/(i*(i+1));
%end
k=1:n;
terms=1./(k.*(k+1));
s1=sum(terms);


s2=0.0;

for i=n:-1:1
    s2=s2+1/(i*(i+1));
end
fprintf('%e\t%e\n',abs(s1-S),abs(s2-S));