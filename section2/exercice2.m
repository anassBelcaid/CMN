%% script pour comparer la difference 
% enter l'erreur d'arrondie et l'erreur
% de troncature

x=1./15;

%les deux erreurs
Et=0.06666;

Ea=0.06667;

%afficher les deux erreux en utilisant fprintf
% et le format e
fprintf('erreur de troncature\n')
fprintf('%.5e\t%.5e\n',abs(x-Et),abs(x-Et)/abs(x))
fprintf('erreur darondie\n')
fprintf('%.5e\t%.5e\n',abs(x-Ea),abs(x-Ea)/abs(x));