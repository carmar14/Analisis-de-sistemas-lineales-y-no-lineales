clear all
clc
%%
%Punta a
num1=2;
den1=[1 4];
H1=tf(num1,den1);

Gz1=c2d(H1,0.025,'zoh')

%%
%punto b
num2=50;
den2=[1 8 25];
H2=tf(num2,den2);
Gz2=c2d(H2,0.025,'zoh')