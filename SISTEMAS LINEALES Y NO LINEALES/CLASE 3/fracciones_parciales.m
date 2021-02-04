%%
%fracciones parciales continuo
clear all
clc
R=2;
L=0.001;
Num_IS=1/L;
Den_IS=[1 R/L 0];
[Texp,Raices,K]=residue(Num_IS,Den_IS)
%%
%fracciones parciales discreto
num=0.0476;
den=conv([1 -1],[1 -0.9048]);
[Texpd,raicesd,kd]=residue(num,den)
