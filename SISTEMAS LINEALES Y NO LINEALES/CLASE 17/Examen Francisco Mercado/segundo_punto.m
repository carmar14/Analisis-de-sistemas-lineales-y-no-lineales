close all;
clear all;
clc;

L=[0,-2,0;1,-0.5,-1;0,2,-1];
r=[-1;0;-1];
p=inv(L)*r;


x1=-10:0.2:10;
x2=-10:0.2:10;
%Evaluar si V es mayor que 0
[X1,X2]=meshgrid(x1,x2);
V=(13/8)*X1.^2+(1/2)*X1.*X2+X2.^2;
figure
surf(X1,X2,V)

%evaluar si la derivada de V es menor que 0
Vd=-X1.*X2 -(1/2)*X1.^2 -(1/2)*X2.^2;
figure
surf(X1,X2,Vd);