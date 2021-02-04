clear all;
close all;

k = 0:0.1:6;

y=0.8569-0.8569*0.90482.^(k*10).*cos(0.2507*k*10)-0.0875*0.90482.^(k*10).*sin(0.2507*k*10);

num=[0.02909 0.02721];
den=[1 -1.753 0.8187];
g=tf(num,den,0.1)

%graficación de funcion de transferencia ante un escalon y graficación de
%la respuesta temporal en el tiempo
figure;
step(g,k);
hold on
stem(k,y);
hold off