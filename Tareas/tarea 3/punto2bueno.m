clear all
close all
clc
%primer sistema
%ZOH
ft=tf(2,[1 5]);
figure
step(ft)
hold on
%ftd=tf(0.0381,[1 -0.905],1/50);
ftd=c2d(ft,1/50,'zoh');
step(ftd)
%Matched
ftd2=c2d(ft,1/50,'matched');
step(ftd2)

%segundo sistema
ft=tf(30,[1 12 36]);
figure
step(ft)
hold on
%ftd=tf(0.0381,[1 -0.905],1/50);
ftd3=c2d(ft,1/60,'zoh');
step(ftd3)
%Matched
ftd4=c2d(ft,1/60,'matched');
step(ftd4)
% %tercer sistema
ft=tf(20,[1 12 30]);
figure
step(ft)
hold on
%ftd=tf(0.0381,[1 -0.905],1/50);
ftd5=c2d(ft,1/80.45,'zoh');
step(ftd5)
%Matched
ftd6=c2d(ft,1/80.45,'matched');
step(ftd6)
% %cuarto sistema
ft=tf(5,[1 2 10]);
figure
step(ft)
hold on
%ftd=tf(0.0381,[1 -0.905],1/50);
ftd7=c2d(ft,0.1,'zoh');
step(ftd7)
%Matched
ftd8=c2d(ft,0.1,'matched');
step(ftd8)
