%% script pour comparer l'erreur d'arrondie et celle de troncature

x=1./15;


%erreur de troncature
Et=0.06666;

%erreur d'arrondie
Ea=0.06667

%afficher les erreurs avec fprintf et le format e
fprintf('erreur de troncature\n')
fprintf('%.5e\t%.5e\n',abs(Et-x),abs(Et-x)/abs(x))
fprintf('erreur d arrondie\n')
fprintf('%.5e\t%.5e\n',abs(Ea-x),abs(Ea-x)/abs(x));

