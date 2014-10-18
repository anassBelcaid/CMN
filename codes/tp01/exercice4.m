%% script pour montrer la différence entre le calcul numérique
% et le calcul algébrique

%initiation du tableau des indcies=(-7,-8,...,-17)
I=-7:-1:-17;

%boucle sur les exposants pour calculer les deux expressions
for i=I
    %calcul de x
    x=10^i;
    %evaluation des expressions
    y=((x+1)-1)/x;
    z=(x+(1-1))/x;
    
    %affichage
    fprintf('%.17f\t%.16f\n',x,z)
end