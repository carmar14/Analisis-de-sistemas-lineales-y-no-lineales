%%
close all;
clear all;
clc;
%Declaracion de parametros
ks=1.61;jh=0.0021;m=0.403;g=-9.81;h=0.06;
km=0.00767;kg=70;jl=0.0059;rm=2.6;
%%
U=Entrada;
Y=Salida;
Phi=[Y(4:end-1),Y(3:end-2),Y(2:end-3),Y(1:end-4),U(4:end-1),U(3:end-2),U(2:end-3),U(1:end-4)]';
Yreal=[Y(5:end)]';
%%
Red=newff(Phi,Yreal,[10],{'tansig','purelin'},'trainlm');
Red.dividefcn=''
Red.trainParam.goal=0
Red.trainParam.epochs=500
Red=train(Red,Phi,Yreal);
%%
gensim(Red,0.06);