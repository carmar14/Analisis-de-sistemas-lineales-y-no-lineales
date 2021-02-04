
%%
clc;
clear all;
close all;
K=1;
Tao=1;
ftp=tf(K,[Tao 1]);
figure;
step(ftp);

figure;
pzmap(ftp);
axis([-5 1 -2 2]);
grid on;

%%
K2=1;
Tao2=2;
ftp2=tf(K,[Tao2 1]);
figure;
step(ftp2);

figure;
pzmap(ftp2);
axis([-5 1 -2 2]);
grid on;