function [T,Y]=rungeKutta(F,a,b,h,y0)
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
        %calculer les constantes des pas liés
        k1=F(T(i-1),Y(i-1));
        k2=F(T(i-1)+h/2,Y(i-1)+k1*h/2);
        k3=F(T(i-1)+h/2,Y(i-1)+k2*h/2);
        k4=F(T(i),Y(i-1)+k3*h);
        
        %formule
        Y(i)=Y(i-1)+h*(k1+2*k2+2*k3+k4)/6;
        
    end
end