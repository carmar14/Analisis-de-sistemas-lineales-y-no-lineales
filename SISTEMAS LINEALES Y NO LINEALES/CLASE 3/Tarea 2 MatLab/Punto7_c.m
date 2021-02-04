clear all;
close all;

k = 0:0.1:6;

y=1.0409-3.1374*0.923028.^(k*10)+2.0965*0.886972.^(k*10);

num=[0.004528 0.004528];
den=[1 -1.81 0.8187];
g=tf(num,den,0.1)

%graficación de funcion de transferencia ante un escalon y graficación de
%la respuesta temporal en el tiempo
figure;
step(g,k);
hold on
stem(k,y);
hold off