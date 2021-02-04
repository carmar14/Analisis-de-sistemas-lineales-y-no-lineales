close all;
Clear all
clc;
%Encontrar los valores de P
l=[0,-2,0;1,-1,-1;0,2,-2];%
r=[-1;0;-1];
p=inv(x)*y;


x1=-10:0.2:10;
x2=-10:0.2:10;
%Evaluar si V es mayor que 0
[X1,X2]=meshgrid(x1,x2);
V=1.5*X1.^2-X1.*X2+X2.^2;
figure
surf(X1,X2,V)

%evaluar si la derivada de V es menor que 0
Vd=-X1.^2-X2+X1.*X2-X2.^2;
figure
surf(X1,X2,Vd);