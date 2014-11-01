%% script pour representr les nombres F

%parametres
B=2;
t=5;
L=-1;
U=3;

%calculer la moitié du cardinal de R
n=(B-1)*(B^(t-1))*(U-L+1);

%declarer un vecteur vide
Y=zeros(1,n);


%boucle sur les exposants
i=1;
for e=L:U
    %boucle sur la mantisse
    for m=B^(t-1):B^t-1
        Y(i)=m*B^(e-t);
        i=i+1;
    end
end

%calculer la partie négative
Y1=-Y;
Y1=sort(Y1);

F=[Y1,Y]

%representation du vecteur F
plot(F,zeros(size(F)),'*')
title('Represention de lensemble F')
xlabel('X(i)')
legend('F')
