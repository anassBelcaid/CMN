n=1E5;

%calculer la premire somme

%s1=0;

%for k=1:n
 %   s1=s1+1/(k*(k+1));
%end

k=1:n
termes=1./(k.*(k+1));
s1=sum(termes);

val=n/(n+1);


s2=0.
for i=n:-1:1
    s2=s2+1/(i*(i+1));
end


%afficher l'erreur
fprintf('%e\t%e\n',abs(val-s1),abs(val-s2));