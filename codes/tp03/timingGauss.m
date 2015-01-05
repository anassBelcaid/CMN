%% script pour vérifier l'hypothèse que gauss est un algorithme
% qui a besoin de 2/3 n^3 opérations

tailles=[10,20,40,80,160,320,640,1280,2540];
times=zeros(size(tailles));
L=length(tailles);

%opening the file
fid=fopen('timineGauss.txt','w');

for i = 1:L
    
   n=tailles(i);
   %generation du système
   A=mat_def_pos(n);
   b=A*(1:n)';
   
   %%timing the executions
   tic();
   x=gauss_elm_smp([A,b]);
   times(i)=toc();
   fprintf(fid,'%d\t%.4f\n',n,times(i));
end

