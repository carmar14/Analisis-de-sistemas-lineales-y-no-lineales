%% REGRESO [8 8 1] PARA LA SALIDA X
% Regresor [Y(k-8) Y(k-7) Y(k-6) Y(k-5) Y(k-4) Y(k-3) Y(k-2) Y(k-1)]
Y_x=Salida_X;
Ex=zeros(length(Y_x),1);
Phix=[Ex(1:end-8),Y_x(8:end-1),Y_x(7:end-2),Y_x(6:end-3),Y_x(5:end-4),Y_x(4:end-5),Y_x(3:end-6),Y_x(2:end-7),Y_x(1:end-8)]';
Yxd=[Y_x(9:end)]';
Nx=length(Y_x);
%%
%Red=newff(Phix,Yxd,[10],{'tansig','purelin'},'trainlm');
% Se puede porbar entrenando la red con el método de entrenamiento trainbr
Redx=newff(Phix,Yxd,[20],{'tansig','purelin'},'trainlm');
Redx.divideFcn='';
Redx.trainParam.goal=0;
Redx.trainParam.epochs=500;
Redx=train(Redx,Phix,Yxd);
% Redx.trainparam.epochs=2;
for i=1:200
    [Redx,tr,Yxd,Ex]=train(Redx,Phix,Yxd);
    %Actualizo las muestras del error
    % Por ser NNARMAX se necesita las muestras del error que se actualizan cada
    % vez que entrena la red
    Enew=[0 Ex]';
    Phix=[Enew(1:end-1),Y_x(8:end-1),Y_x(7:end-2),Y_x(6:end-3),Y_x(5:end-4),Y_x(4:end-5),Y_x(3:end-6),Y_x(2:end-7),Y_x(1:end-8)]';
%     Phix=[Y(1:N-1),U(1:N-1),Enew(1:N-1) ]';
end
%%
Tm=0.01;
gensim(Redx,Tm);
%% REGRESO [8 8 1] PARA LA SALIDA Y
% Regresor [Y(k-8) Y(k-7) Y(k-6) Y(k-5) Y(k-4) Y(k-3) Y(k-2) Y(k-1)]
Y_y=Salida_Y;
Ey=zeros(length(Y_y),1);
Phiy=[Ey(1:end-8),Y_y(8:end-1),Y_y(7:end-2),Y_y(6:end-3),Y_y(5:end-4),Y_y(4:end-5),Y_y(3:end-6),Y_y(2:end-7),Y_y(1:end-8)]';
Yyd=[Y_y(9:end)]';
Ny=length(Y_y);
%%
%Red=newff(Phiy,Yyd,[10],{'tansig','purelin'},'trainlm');
% Se puede porbar entrenando la red con el método de entrenamiento trainbr
Redy=newff(Phiy,Yyd,[8],{'tansig','purelin'},'trainlm');
Redy.divideFcn='';
Redy.trainParam.goal=0;
Redy.trainParam.epochs=100;
for i=1:200
    [Redy,tr,Yyd,Ey]=train(Redy,Phiy,Yyd);
    %Actualizo las muestras del error
    % Por ser NNARMAX se necesita las muestras del error que se actualizan cada
    % vez que entrena la red
    Enew=[0 Ey]';
    Phix=[Enew(1:end-8),Y_y(8:end-1),Y_y(7:end-2),Y_y(6:end-3),Y_y(5:end-4),Y_y(4:end-5),Y_y(3:end-6),Y_y(2:end-7),Y_y(1:end-8)]';
%     Phix=[Y(1:N-1),U(1:N-1),Enew(1:N-1) ]';
end
%%
Tm=0.01
gensim(Redy,Tm);
%% REGRESO [8 8 1] PARA LA SALIDA Z
% Regresor [Y(k-8) Y(k-7) Y(k-6) Y(k-5) Y(k-4) Y(k-3) Y(k-2) Y(k-1)]
Y_z=Salida_Z;
Ez=zeros(length(Y_z),1);
Phiz=[Ez(1:end-8),Y_z(8:end-1),Y_z(7:end-2),Y_z(6:end-3),Y_z(5:end-4),Y_z(4:end-5),Y_z(3:end-6),Y_z(2:end-7),Y_z(1:end-8)]';
Yzd=[Y_z(9:end)]';
Ny=length(Y_z);
%%
%Red=newff(Phiy,Yyd,[10],{'tansig','purelin'},'trainlm');
% Se puede porbar entrenando la red con el método de entrenamiento trainbr
Redz=newff(Phiy,Yyd,[8],{'tansig','purelin'},'trainlm');
Redz.divideFcn='';
Redz.trainParam.goal=0;
Redz.trainParam.epochs=100;
for i=1:200
    [Redz,tr,Yzd,Ez]=train(Redz,Phiz,Yzd);
    %Actualizo las muestras del error
    % Por ser NNARMAX se necesita las muestras del error que se actualizan cada
    % vez que entrena la red
    Enew=[0 Ez]';
    Phiz=[Enew(1:end-8),Y_z(8:end-1),Y_z(7:end-2),Y_z(6:end-3),Y_z(5:end-4),Y_z(4:end-5),Y_z(3:end-6),Y_z(2:end-7),Y_z(1:end-8)]';
%     Phix=[Y(1:N-1),U(1:N-1),Enew(1:N-1) ]';
end
%%
Tm=0.01
gensim(Redz,Tm);
%%

