clear all;
close all;

t = 0:0.02:2;
y=1/2 -((1/2)*exp(-7*t))-(7/2)*(t.*exp(-7*t));

num=24.5;
den=[1 14 49];
g=tf(num,den)

%graficación de funcion de transferencia ante un escalon y graficación de
%la respuesta temporal en el tiempo
figure;
step(g,t,':diamondr');
hold on
plot(t,y);
hold off