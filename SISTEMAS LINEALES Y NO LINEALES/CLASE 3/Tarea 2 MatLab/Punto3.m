% Punto 3, ecuacion en diferencias por minimos cuadrados
close all;

u=Entrada;
y=Salida;

Yreal=y(3:end);
Phi=[-y(2:end-1),-y(1:end-2),u(2:end-1),u(1:end-2)];

Theta=Phi\Yreal


%sabiendo que el sistema de segundo orden es de la forma:
% H[z]=[b1Z^-1 + b2Z^-2]/[1 + a1Z^-1 + a2Z^-2) 
%se tiene:

num=[0,Theta(3),Theta(4)];
den=[1,Theta(1),Theta(2)];

Sys=tf(num,den,0.1,'variable','z^-1')
