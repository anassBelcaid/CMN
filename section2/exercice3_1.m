%script pour afficher le plus grand entier n
% tel que exp(n) est fini

%initialisation
i=1;


%boucle while
while(isfinite(exp(i)))
    i=i+1;
end

i=i-1;

%affichage 
fprintf('exp(%d)=%e\texp(%d)=%e\n',i,exp(i),i+1,exp(i+1))
