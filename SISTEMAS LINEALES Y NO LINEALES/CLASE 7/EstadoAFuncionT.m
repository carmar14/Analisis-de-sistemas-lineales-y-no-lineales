clear all;
clc;

a=[0,1;-0.8,1.7];
b=[2;1];
c=[2,3;1,1];
d=[0;0];
[num,den]=ss2tf(a,b,c,d)


