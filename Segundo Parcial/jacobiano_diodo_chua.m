clear all
close all
clc

syms x1 x2 x3 a B d1 d3
x1punto=a*(x2+d1*x1-d3*x1^3) ;
x2punto=x1-x2+x3;
x3punto=-B*x2;

dx1punto=jacobian(x1punto,[x1 x2 x3]);
dx2punto=jacobian(x2punto,[x1 x2 x3]);
dx3punto=jacobian(x3punto,[x1 x2 x3]);

A=[dx1punto;dx2punto;dx3punto];

Ape1=subs(A,[x1 x2 x3],[0 0 0]);
av1=eig(Ape1);
av1=subs(av1,[d1 d3 a B],[-sqrt(16/6) sqrt(16/6) 6 14]);

Ape2=subs(A,[x1 x2 x3],[-sqrt(d1/d3) 0 sqrt(d1/d3)]);
av2=eig(Ape2);
av2=subs(av2,[d1 d3 a B],[-sqrt(16/6) sqrt(16/6) 6 14]);


Ape3=subs(A,[x1 x2 x3],[sqrt(d1/d3) 0 -sqrt(d1/d3)]);
av3=eig(Ape3);
av3=subs(av3,[d1 d3 a B],[-sqrt(16/6) sqrt(16/6) 6 14]);


% Ape1=subs(A,[x1 x2 x3],[0 0 0]);
% av1=eig(Ape1);
% av1
% 
% Ape2=subs(A,[x1 x2 x3],[-sqrt(16/6) 0 sqrt(16/6)]);
% av2=eig(Ape2);
% 
% Ape3=subs(A,[x1 x2 x3],[sqrt(16/6) 0 -sqrt(16/6)]);
% av3=eig(Ape3);