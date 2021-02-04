clear all
clc
g=10;
l=10;
k=8;
m=8;
%%
A1=[0,1;-g/l,-k/m]
eig(A1)
A2=[0,1;g/l,-k/m]
eig(A2)