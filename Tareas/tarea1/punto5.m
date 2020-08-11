clear 
close all
clc
%Solución unica primer ejemplo
  
A1=[1 2 3;4 5 6; 3 1 -2];
B1=[9 ;24; 4];
X1=inv(A1)*B1; 

%Solución unica segundo ejemplo

A2=[0.8 -0.5 -0.15;-0.4 0.9 -0.3; -0.25 -0.5 0.85];
B2=[10; 25;20];
X2=inv(A2)*B2; 

%Infinitas soluciones primer ejemplo

A3=[2 0 -1 0;3 0 0 -4;0 1 0 -4];
B3=[0 ;0;0];
X3=pinv(A3)*B3; 

%Infinitas soluciones segundo ejemplo

A4=[1 1 -1;4 -2 7];
B4=[0; 0];
X4=pinv(A4)*B4; 