clear all;
clc;
%%punto 5
%Punto a
numa=0.06727;
dena=[1 -0.9231];
[aa,ba,ca,da]=tf2ss(numa,dena);

%Punto b
numb=[0.01847 0.001847];
denb=[1 -1.847 0.8521];
[ab,bb,cb,db]=tf2ss(numb,denb);

%Punto c
numc=[0.1411 0.2112 0.0224] ;
denc=[1 -36 0.168 -0.02556];
[ac,bc,cc,dc]=tf2ss(numc,denc);