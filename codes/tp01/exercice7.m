%script pour calculer la valeur de l'intégrale pour différents
% valeurs de n
nmax=29
%vecteur des n
N=1:nmax;

%vecteur des intégrales
Int=zeros(nmax,1);

%remplire le vecteur des intégrales
for i=1:nmax
    Int(i)=integraleR(i);
end

%figure des valeurs de l'ordre l'integrale
plot(N,log(Int),'b*')
xlabel('N');ylabel('log(int)')
title('Ordre de la valeur de lintegrale')
