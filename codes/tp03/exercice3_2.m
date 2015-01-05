%% exercice pour comparer la qualité de la solution de plusieurs méthodes
% de résolution d'un system

n=30;

% matrice tridiagonale simple
%A=mat_def_pos(n);
%A=hilb(n);
%x=(1:n)';
%b=A*x;     
A=[3E-16 59.14;5.291 -6.13];
x=[10;1];
b=A*x;

%resolution par lu
[L,U]=lu_dcm(A);
y=rsl_tri_inf(L,b);
x1=rsl_tri_sup(U,y);

%premiere erreure
err1=norm(x1-x);


%resolution par gauss
x2=gauss_elm_smp([A,b]);
err2=norm(x2-x);


%gauss partial pivotation
x3=gauss_partial_pivot([A,b]);
err3=norm(x3-x);

fprintf('Lu=%e\t \t gauss=%e\t gauss pivot=%e\n',err1,err2,err3);