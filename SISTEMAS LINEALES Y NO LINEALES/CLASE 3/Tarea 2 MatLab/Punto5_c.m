clear all;
close all;

t = 0:0.02:4;
y=2-2*exp(-4*t).*cos(3*t)-((8/3)*exp(-4*t).*sin(3*t));

num=50;
den=[1 8 25];
g=tf(num,den)

%graficación de funcion de transferencia ante un escalon y graficación de
%la respuesta temporal en el tiempo
figure;
step(g,t,':diamondr');
hold on
plot(t,y);
hold off