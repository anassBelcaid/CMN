%script pour calculer l'approximation par la méthode D'euler


%constantes
a=10;
b=2;
c=1;

    
    %appel de la méthode Euler
    [T,Y]=euler_explicite(@fCauchy,0,1,0.1,a);
    %calcul de la solution exacte
    E=fExacte(T);
    %representation graphique
    hold on
    grid on
    plot(T,Y,'b*')
    plot(T,E,'r-')
    legend('euler','exacte')
    title('convergence methode euler')
    
   figure()
   errorbar(Y,abs(E-Y))