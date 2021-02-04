% Simple example of least-squares 
%%
close all
U=Entrada(1:end);
Y=Salida(1:end);
Phi=[Y(2:end-1),Y(1:end-2),U(2:end-1),U(1:end-2)]';
YReal=[Y(3:end)]';

%%
%Parameters stimation
Red=newff(Phi,YReal,[10],{'tansig','purelin'},'trainlm');
Red.dividefcn='';
Red.Trainparam.epochs=500;
Red=train(Red,Phi,YReal);

%%
Ts=0.06
gensim(Red,Ts)
%%
%sacar pesos
Wco=Red.iw{1}%Capa entrada
Wcs=Red.LW{2,1}%Capa Salida
Bco=Red.b{1}%bias capa oculta
Bcs=Red.b{2}%bias capa salida
