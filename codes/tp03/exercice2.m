%% script pour résoudre des systèmes linéaires en utilisant différents
% methodes iteratives
clc
clear all


%% générer un système avec A définie posotive
n=10;
A=mat_def_pos(n);

%on s'arrange a ce que la solution soit 1:10
b=A*(1:n)';


%résoudre le système avec jacobi

[x,iter]=jacobi(A,b,zeros(size(b)),1E3,1E-2)

%% visualiser la courbe des nombres d'itérations
tailles=[10,20,40,80,160,320,640,1280,2540];
iters=zeros(size(tailles));
L=length(tailles);

%on sauvegarde les résultats dans un fichier
fid=open('jacobi_itertions.txt','w')
for i=1:L
    
    %extraire la taille
    n=tailles(i);
    
    %construire la matrice de taille n
    A=mat_def_pos(n);

    b=A*(1:n)';


    %résoudre le système avec jacobi
    [x,iters(i)]=jacobi(A,b,zeros(size(b)),1E3,1E-2);
    
    %sauvegarde des resultats
    fprintf('%d\t%d\n',n,iters(i));
end
fclose(fid);


%representation graphique
hold on
id1=plot(tailles,iters,'b*-')
xlabel('taille matrice');ylabel('iteration jacobi')
title('nombre d iterations de la methode de jacobi')
saveas(id1,'jacobi_iteration.png')