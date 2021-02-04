clear all;
close all;

k = 0:0.1:10;

y=0.7234-1.3367*0.9590.^(k*10)+0.6133*0.8960.^(k*10);

num=[0.001847 0.001847];
den=[1 -1.847 0.8521];
g=tf(num,den,0.1)

%graficación de funcion de transferencia ante un escalon y graficación de
%la respuesta temporal en el tiempo
figure;
step(g,k);
hold on
stem(k,y);
hold off