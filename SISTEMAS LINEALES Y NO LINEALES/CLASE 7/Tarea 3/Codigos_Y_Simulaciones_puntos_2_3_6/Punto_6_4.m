clear all;
clc;
%%punto 4
%Punto a
numa=2;
dena=[1 4];
[aa,ba,ca,da]=tf2ss(numa,dena);

%Punto b
numb=50;
denb=[1 8 25];
[ab,bb,cb,db]=tf2ss(numb,denb);

%Punto c
numc=26;
denc=[1 8 29 52];
[ac,bc,cc,dc]=tf2ss(numc,denc);