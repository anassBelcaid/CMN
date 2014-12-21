%% tester la méthode de relaxation et afficher son graphe d'itération
% en fonction du facteur de relaxation w


clc
clear all


%% générer un système avec A définie posotive
n=100;
A=mat_def_pos(n);

%on s'arrange a ce que la solution soit 1:10
b=A*(1:n)';


%résoudre le système avec jacobi
w=1.2;
[x,iter]=relaxation(A,b,w,zeros(size(b)),1E3,1E-2)


%descrtisation de la valeur de omega
Omega=linspace(0.2,1.9,100);
iters=zeros(100,1);


%boucle pour calculer le nombre d'itérations

for i=1:100
   
     %appel de relaxation 
     [x,iters(i)]=relaxation(A,b,Omega(i),zeros(size(b)),1E3,1E-2);

end

id=plot(Omega,iters,'r--','lineWidth',1.5)
title('nombre diterations en fonction de omega')
xlabel('w'); xlabel('nombre iteration')

saveas(id,'relaxation_iterations.png')

