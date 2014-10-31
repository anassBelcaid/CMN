%% script pour comparer le calcul d'une série par deux méthodes

%fixer la valeur de n
N=1E5;

%calcul de la somme croissante
s1=0.0;
for i=1:N
    s1=s1+1/(i*(i+1));
end

%calcul de la somme décroissante
s2=0.0;
for i=N:-1:1
    s2=s2+1/(i*(i+1));
end

%calcul de la valeur exacte
s=N/(N+1);

%afficher les erreurs
fprintf('err1=%e\terr2=%e\n',abs(s1-s),abs(s2-s));

