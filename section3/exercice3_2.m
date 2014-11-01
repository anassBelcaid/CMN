% script pour visualiser l'ensemble F(B,t,L,U)

%parametres
B=2;
t=3;
L=-1;
U=3;

%calculer la moitié de la taille de l'ensemble
n=B^(t-1)*(B-1)*(U-L+1);

%inialiser Y
Y=zeros(1,n);

i=1;
%boucle principale
for e=L:U
   for m =B^(t-1):B^t 
       Y(i)=m*B^(e-t);
       i=i+1;
   end
end

%ajouter la partie négative
Y1=sort(-Y);

%concatener
F=[Y1,Y];

%representation graphiques
plot(F,zeros(size(F)),'b*')
grid on