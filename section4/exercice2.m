%% comparer l'erreur d'arrondie et celle
% de troncature


x=1/15;

X_t=0.06666;
X_a=0.06667;

%calculer les erreurs
E_abs_t=abs(X_t-x);
E_rel_t=E_abs_t/abs(x);

E_abs_a=abs(X_a-x);
E_rel_a=E_abs_a/abs(x);

%Afficher les erreurs
fprintf('erreur de toncature\n')
fprintf('%e\t%e\n',E_abs_t,E_rel_t)
fprintf('erreur darrondie\n')
fprintf('%e\t%e\n',E_abs_a,E_rel_a)
