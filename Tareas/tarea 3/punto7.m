clear all
close all
clc
% %primer sistema
% A1=[-5];
% B1=[1];
% C1=[2];
% [M, n]=size(B1);
% [m, N]=size(C1);
% D1=zeros(m,n);
% [num,den]=ss2tf(A1,B1,C1,D1)
% %segundo sistema
% A2=[0 1; -30 -12];
% B2=[0;1];
% C2=[20 0];
% [M, n]=size(B2);
% [m, N]=size(C2);
% D2=zeros(m,n);
% [num,den]=ss2tf(A2,B2,C2,D2)
% %tercer sistema
% A3=[0 1 0; 0 0 1; -52 -29 -8];
% B3=[0; 0; 1];
% C3=[26 0 0];
% [M, n]=size(B3);
% [m, N]=size(C3);
% D3=zeros(m,n);
% [num,den]=ss2tf(A3,B3,C3,D3)


%primer sistema
A1=[0 1; -10 -2];
B1=[0 ;1];
C1=[1 0];
[M, n]=size(B1);
[m, N]=size(C1);
D1=zeros(m,n);
[num,den]=ss2tf(A1,B1,C1,D1)
%segundo sistema
A2=[0 1 0; 0 0 1;-48 -44 -12];
B2=[0;0;1];
C2=[1 0 0];
[M, n]=size(B2);
[m, N]=size(C2);
D2=zeros(m,n);
[num,den]=ss2tf(A2,B2,C2,D2)
%tercer sistema
A3=[0 1 ; -0.7408 1.724];
B3=[0; 1];
C3=[0.02049 0.02264];
[M, n]=size(B3);
[m, N]=size(C3);
D3=zeros(m,n);
[num,den]=ss2tf(A3,B3,C3,D3)
%cuarto sistema
A4=[0 1 0; 0 0 1; 0.5488 -2.018 2.464];
B4=[0; 0; 1];
C4=[0.00133 0.006189 0.001795];
[M, n]=size(B4);
[m, N]=size(C4);
D4=zeros(m,n);
[num,den]=ss2tf(A4,B4,C4,D4)



