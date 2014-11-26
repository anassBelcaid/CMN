function [T,Y]=euler_implicite(F,a,b,y0,h)
  %fonction de résolution due problem de cauchy
  % par un schéma implicite
  
  %descritisation
  T=a:h:b;
  
  %initialisation
  n=length(T);
  Y=zeros(1,n);
  Y(1)=y0;
  
  %boucle principale
  for i=2:n
      %resoudre le system par la fonction adaptée 
      Y(i)=newton_adaptee(F,T(i-1),Y(i-1),h);
  end  
end
