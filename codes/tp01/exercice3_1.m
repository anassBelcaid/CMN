%% script pour calculer le plus grand entier
% tel que exp(n) est représentée dans la machine

%initialisation
n=1;

%boucle tant que exp(n) est  fini
while(isfinite(exp(n)))
    n=n+1;
end

% A ce stade exp(n) est inifini donc le nombre qui nous interesse est n-1
sol=n-1;

%simple affichage avec fprintf pour vérifier le résultat

%afficher exp(sol)
fprintf('exp(%d)=%e\t',sol,exp(sol))
%afficher exp(sol+1)
fprintf('exp(%d)=%e\n',sol+1,exp(sol+1))