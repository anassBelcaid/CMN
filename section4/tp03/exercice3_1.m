%% script pour tester l'algorithme de gauss simple

%% préparer l'espace  de travail
clc                      %effacer l'ecran
clear all                %detruire toutes les variables


%Un système simple à résoudre 
N=10;

A=20*rand(10);
b=A*(1:10)';

% résoudre le système avec Gauss simple
x=gauss_elm_smp([A,b])

