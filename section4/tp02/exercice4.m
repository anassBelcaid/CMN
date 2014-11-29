%% exercice pour étudier la stabilité

%constantes
a=0;
b=50;
y0=1;

H=[30/16,2,30/14];

%boucle sur les pas
i=1;
for h=H
   
    %nouvelle figure
    figure()
    
    %Euler
    [T,Y]=euler_explicite(@fCauchy7,a,b,h,y0);
    
    %euler implicite
    [T,Y1]=euler_implicite(@fCauchy7,a,b,h,y0);
    %solution exacte
    E=exp(-T);
    
    %graphe
    hold on
    id=plot(T,Y,'b*--')
    plot(T,Y1,'ko--')
    plot(T,E,'r')
    legend('euler exp','Euler impl', 'exacte')
    i=i+1;
    title(strcat('graphe pour h=',num2str(h)))
end

saveas(id,'stabilite.pdf')