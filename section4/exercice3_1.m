%% calculer le plus grand entier n
% tel que exp(n) est fini

%inialisation
n=1;

while(isfinite(exp(n)))
    n=n+1;
end
n=n-1;
%affichage
fprintf('n=%d\t exp(%d)=%e\n',n,n,exp(n))
fprintf('n+1=%d\texp(%d)=%e\n',n+1,n+1,exp(n+1))