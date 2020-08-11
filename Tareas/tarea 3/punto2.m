clear all
close all
clc
%primer sistema
A1=[-5];
B1=[1];
C1=[2];
[M, n]=size(B1);
[m, N]=size(C1);
D1=zeros(m,n);
[num,den]=ss2tf(A1,B1,C1,D1)
%segundo sistema
A2=[0 1; -30 -12];
B2=[0;1];
C2=[20 0];
[M, n]=size(B2);
[m, N]=size(C2);
D2=zeros(m,n);
[num,den]=ss2tf(A2,B2,C2,D2)
%tercer sistema
A3=[0 1 0; 0 0 1; -52 -29 -8];
B3=[0; 0; 1];
C3=[26 0 0];
[M, n]=size(B3);
[m, N]=size(C3);
D3=zeros(m,n);
[num,den]=ss2tf(A3,B3,C3,D3)
