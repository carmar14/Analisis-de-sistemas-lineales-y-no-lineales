%punto 4 item a
close all;
clear all;
t = 0:0.02:2;
y=1+((5/3)*exp(-8*t))-((8/3)*exp(-5*t));

num=40;
den=[1 13 40];
g=tf(num,den)

%graficación de funcion de transferencia ante un escalon y graficación de
%la respuesta temporal en el tiempo
figure;
step(g,t,':diamondr');
hold on
plot(t,y);
hold off