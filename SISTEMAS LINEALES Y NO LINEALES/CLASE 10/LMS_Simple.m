% Simple example of least-squares 
% January 2018
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
%Parameters estimation
% left division (least-squares solution)
% Solve the system Phi*Theta=Y
Theta=Phi\YReal
%%
%Visualization of the obtained linear model
RangoU=0:0.5:5;
RangoY=-0.25:0.25:1.25;
[U3d,Y3d]=meshgrid(RangoU,RangoY);
Yest3d=-Theta(1)*Y3d+Theta(2)*U3d;
surf(Y3d,U3d,Yest3d);
view(125,25)
hold off
