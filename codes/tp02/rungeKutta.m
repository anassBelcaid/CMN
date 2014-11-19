function [X,Y]=rungeKutta(f,a,b,y0,h)
    %Résoudre le probleme de Cauchy en utilisant
    % la méthode de runge Kutta
    % Entrées:
    %  f  : hande de la fonction
    % a,b : intervalle de résolution
    % y0  : condition initiale
    %  h  : pas de la descritisation
    
    %Sorties
    % X  : descritisation de l'intervalle
    % Y  : approximation de Y en X
    
    %descritisation
    X=a:h:b;
    
    %longeur de X
    n=length(X);
    Y=zeros(1,n);
    
    %Initialisation
    X(1)=a;
    Y(1)=y0;
    
    %boucle principale
    for i=2:n
       %calcul des constantes de Rk4
       k1=f(X(i-1),Y(i-1));
       k2=f(X(i-1)+h/2,Y(i-1)+k1*h/2);
       k3=f(X(i-1)+h/2,Y(i-1)+k2*h/2);
       k4=f(X(i),Y(i-1)+k3*h);
       
       %formule de RK4
       Y(i)=Y(i-1)+h*(k1+2*k2+2*k3+k4)/6;
    end
end