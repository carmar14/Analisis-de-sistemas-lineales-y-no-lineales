%%
%declaración de parametros
clear all
clc
a1=0.5;a2=3.5;m1=5;m2=6;s0=0.3;r1=4;r2=4;
%%
U=Entrada;
Y=Salida;
Phi=[Y(3:end-1),Y(2:end-2),Y(1:end-3),U(3:end-1),U(2:end-2),U(1:end-3)]';
Yreal=[Y(4:end)]';
%%
Red=newff(Phi,Yreal,[10],{'tansig','purelin'},'trainlm');
Red.dividefcn='';
Red.trainParam.goal=0;
Red.trainParam.epochs=3000;
Red=train(Red,Phi,Yreal);
%%
gensim(Red,0.6)