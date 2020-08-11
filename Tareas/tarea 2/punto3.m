%Entrada=U(1:N)
%Salida=Y(1:N)
clear
clc
close all


load('Datos_Tarea2_ASL_NL.mat')
U=Entrada;
Y=Salida;
Phi=[-Y(1:end-2) -Y(2:end-1) U(1:end-2) U(2:end-1)];
Y=[Y(3:end)];
Tetha=Phi\Y;  %Division izquierda \ usando minimos cuadrados


%Modelo ARX: Modelo discreto obtenido en ecuacion en diferencia es:
%Y(k)=-0.8187*Y(k-2)+1.7288*Y(k-1)+0.652*u(k-2)+0.0697*u(k-1);
y(1)=0;
y(2)=0;


for k=3:256
    y(k)=-0.8187*y(k-2)+1.7288*y(k-1)+0.652+0.0697;

end
plot(y,'ob')

% fplot('0.5-0.5*0.9048^x',[0 50],'ob')