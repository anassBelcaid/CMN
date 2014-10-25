%% comparaison entre l'erreur d'arrondie et celle
%de troncature

x=1/15;

x_t=0.06666;
x_a=0.06667;

%calculer les erreurs
Ea_abs=abs(x-x_a);
Ea_rel=Ea_abs/abs(x);
Et_abs=abs(x-x_t)
Et_rel=Et_abs/abs(x);
%afficher les erreurs
fprintf('erreur darrondie\n')
fprintf('%e\t%e\n',Ea_abs,Ea_rel);
fprintf('erreur de troncature\n')
fprintf('%e\t%e\n',Et_abs,Et_rel);