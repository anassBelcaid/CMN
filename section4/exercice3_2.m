%% script pour representr les nombres F

%parametres
B=2;
t=3;
L=-1;
U=3;


%boucle sur les exposants
for e=L:U
    %boucle sur la mantisse
    for m=B^(t-1):B^t-1
        y=m*B^(e-t)
    end
end