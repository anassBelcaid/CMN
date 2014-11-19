function [T,Y]=Heun(F,a,b,h,y0)
    %méthode pour appliquer la méthode de Heun
    
    %Entrées
    % F   : handle(reference) de la fonction Cauchy
    % a,b : intervalle de resolution
    %  h  : pas de la descritisation
    % y0  : condition initiale
    
    %Sorties
    %T   : Descritisation de l'intervalle [a,b]
    % Y  : apprixmation par la méthode Euler
    
    %Descritistaion 
    T=a:h:b;
    
    % Intialisation 
    n=length(T);
    Y=zeros(1,n);
    Y(1)=y0;
    
    %boucle for pour calculer Y
    for i=2:n
        %valeur de prediction
        z=Y(i-1)+h*F(T(i-1),Y(i-1));
        
        %correction
        Y(i)=Y(i-1)+h*(F(T(i-1),Y(i-1))+F(T(i),z))/2;
    end
end