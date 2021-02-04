%%
U=Entrada;
Y=Salida;
Phi=[Y(1:end-1),U(1:end-1)]';
Yreal=[Y(2:end)]';
%%
Red=newff(Phi,Yreal,[10],{'tansig','purelin'},'trainlm');
Red.dividefcn=''
Red.trainParam.goal=0
Red.trainParam.epochs=200;
Red=train(Red,Phi,Yreal);
%%
gensim(Red,0.006);
%%
%Datos Arduino
WCO=[Red.iw{1} Red.b{1}]
WCS=[Red.lw{2,1} Red.b{2}]
minmax(Phi)
minmax(Yreal)
