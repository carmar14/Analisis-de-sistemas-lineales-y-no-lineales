%Punto5
clear 
close all
clc
fplot('2/5-2*exp(-5*x)/5',[0 6])
figure
fplot('2/3+0.4832*exp(-(6+sqrt(6))*x)-1.1498*exp(-(6-sqrt(6))*x)',[0 6])
figure
fplot('5/6-5*exp(-6*x)/6-5*x*exp(-6*x)',[0 6])
figure
fplot('1/2-exp(-x)*sin(3*x)/6-exp(-x)*cos(3*x)/2',[0 6])