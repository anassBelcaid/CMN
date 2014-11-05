%script pour visualiser les elements de l'ensemble F

%parametres

B=2;
t=3;
L=-1;
U=3;

%calculer la taille des nombres positifs
n=(B^t -B^(t-1))*(U-L+1);

%preparer un vecteur F 
Y=zeros(1,n);

%indice de remplissage
i=1;

%boucle sur les exposants
for e=L:U
   %boucle sur la mantisse
   for m=B^(t-1):B^t -1
       Y(i)=m*B^(e-t);
       i=i+1;
   end
end
%calculer la partie négative et l'ajouter à Y
Y1=-Y;
%Y1=sort(Y1)
Y1=Y1(end:-1:1);

%construire F
F=[Y1,0,Y];


plot(F,0,'b*')