close all;

ftc=tf(2,[1 5])

ftd=c2d(ftc,0.02,'matched')

figure; %grafica de respuesta en el tiempo
step(ftc);
hold on
step(ftd);
hold off

figure;%grafica de polos en continua
pzmap(ftc)
grid on

figure;%grafica de polos en discreto
pzmap(ftd)
grid on