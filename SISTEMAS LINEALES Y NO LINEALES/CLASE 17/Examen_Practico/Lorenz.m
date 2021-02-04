close all;
clear all;
clc,

sig=10;
b=8/3;
r=28;

%%
Y=Salida_X;
E=zeros(length(Y),1);
%Phi=[Y(8:end-1),Y(7:end-2),Y(6:end-3),Y(5:end-4),Y(4:end-5),Y(3:end-6),Y(2:end-7),Y(1:end-8)]';
Phi=[Y(8:end-1),Y(7:end-2),Y(6:end-3),Y(5:end-4),Y(4:end-5),Y(3:end-6),Y(2:end-7),Y(1:end-8),E(1:end-8)]';
Yreal=[Y(9:end)]';

%%
Red=newff(Phi,Yreal,[10],{'tansig','purelin'},'trainlm');
Red.dividefcn=''
Red.trainParam.goal=0
%Red.trainParam.epochs=500
Red=trainbr(Red,Phi,Yreal);
k=1
% for i=1:4
%     [Red,tr,Yreal,E]=train(Red,Phi,Yreal);
%     %Actualizo las muestras del error
%     % Por ser NNARMAX se necesita las muestras del error que se actualizan cada
%     % vez que entrena la red
%     Enew=[0 E]';
%     Phi=[Y(8:end-1),Y(7:end-2),Y(6:end-3),Y(5:end-4),Y(4:end-5),Y(3:end-6),Y(2:end-7),Y(1:end-8),Enew(1:end-1)]';
% %     Phix=[Y(1:N-1),U(1:N-1),Enew(1:N-1) ]';
% k=k+1
% end
%%
Y=Salida_X;
E=Error;
Phi=[Y(8:end-1),Y(7:end-2),Y(6:end-3),Y(5:end-4),Y(4:end-5),Y(3:end-6),Y(2:end-7),Y(1:end-8),E(1:end-8)]';
Yreal=[Y(9:end)]';
Red=trainbr(Red,Phi,Yreal);

%%
gensim(Red,0.001);