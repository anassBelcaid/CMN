%% exercice pour étudier la stabilité

%constantes
a=0;
b=50;
y0=1;

%valeurs des pas
H=[30/16,2,30/14];
i=1;
for h=H
    
    %nouvelle figure
    figure()
    %Euler
    [T,Y]=euler_explicite(@fCauchy7,a,b,h,y0);
    
    %Euler implicite
    [T,Y1]=euler_implicite(@fCauchy7,a,b,h,y0);
    %exacte
    E=exp(-T);
    
    %graphique
    hold on
    id=plot(T,Y,'b*--')
    plot(T,Y1,'ko--')
    plot(T,E,'r-')
    legend('Euler exp','Euler imp','Exacte')
    title(strcat('graphe pour h=',num2str(h)))
    saveas(id,strcat('graphh=',num2str(h),'.pdf'))
end