%%
% Regresor [Y(k-1) U(k-1) E(k-1)]
U=Entrada;
Y=Salida;
E=zeros(length(U),1);
Phi=[Y(1:end-1),U(1:end-1),E(1:end-1)]';
Yd=[Y(2:end)]';
N=length(U);

%%
%Red=newff(Phi,Yd,[15],{'tansig','purelin'},'trainlm');
% Se puede porbar entrenando la red con el método de entrenamiento trainbr
Red=newff(Phi,Yd,[15],{'tansig','purelin'},'trainbr');
Red.divideFcn='';

Red.trainparam.epochs=2;
for i=1:200
 [Red,tr,Yred,E]=train(Red,Phi,Yd);
  %Actualizo las muestras del error
  % Por ser NNARMAX se necesita las muestras del error que se actualizan cada
  % vez que entrena la red
  Enew=[0 E]';
  Phi=[Y(1:N-1),U(1:N-1),Enew(1:N-1) ]';
   
end;
gensim(Red,0.01);


