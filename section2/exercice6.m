%script pour comparer deux sommes

%inialiser n
n=1E4;

%calculer la valeur exacte de la somme
somme=n/(n+1);

%calculer la somme croissante en utilisant une boucle for
s=0.0;

for i=1:n
    s=s+1/(i*(i+1));
end


%deuxièmre somme 
s2=0.0;

for i=n:-1:1
    s2=s2+1/(i*(i+1));
end
%afficher l'erreur en forme exp

fprintf('%e\n',abs(s-somme));