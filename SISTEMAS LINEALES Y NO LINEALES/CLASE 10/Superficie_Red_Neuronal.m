%%
close all
U=Entrada;
Y=Salida;
Phi=[-Y(1:end-1),U(1:end-1)];
YReal=Y(2:end);
plot3(Y(1:end-1),U(1:end-1),Y(2:end),'or')
xlabel('Salida (k-1)')
ylabel('Entrada (k-1)')
zlabel('Salida Real (k)')
hold on
%%
%Visualization of the no linear model
RangoU=0:0.5:5;
RangoY=-0.25:0.05:1.25;
[U3d,Y3d]=meshgrid(RangoU,RangoY);

[F,C]=size(U3d);
YestRed=sim(Red,[reshape(Y3d,1,F*C);reshape(U3d,1,F*C)]);
Yest3d=reshape(YestRed,F,C);
surf(Y3d,U3d,Yest3d);
view(125,25)
hold off

figure
plot3(Y(1:end-1),U(1:end-1),Y(2:end),'ob');
hold on
Phi=[Y(1:end-1),U(1:end-1)]';
YestRed=sim(Red,Phi);
plot3([Y(1:end-1)],[U(1:end-1)],YestRed','*r');


