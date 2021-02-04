clear all;
close all;

k = 0:0.1:6;

y=0.8747-0.8747*(0.9231.^(k*10));

num=0.06727;
den=[1 -0.9231];
g=tf(num,den,0.1)

%graficación de funcion de transferencia ante un escalon y graficación de
%la respuesta temporal en el tiempo
figure;
step(g,k);
hold on
stem(k,y);
hold off