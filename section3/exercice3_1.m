% script pour calculer le plus grand enter
% tel que exp(n) est finiis

%intialisation
n=1;

while(isfinite(exp(n))==1)
    n=n+1;
end
n=n-1;

fprintf('n=%d\texp(%d)=%e\n',n,n,exp(n))
fprintf('n+1=%d\texp(%d)=%e\n',n+1,n+1,exp(n+1))