function [X,Y]=euler_explicite(f,a,b,y0,h)
    %Résoudre le probleme de Cauchy en utilisant
    %Euler explicite
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
        Y(i)=Y(i-1)+h*f(X(i-1),Y(i-1));
    end
end