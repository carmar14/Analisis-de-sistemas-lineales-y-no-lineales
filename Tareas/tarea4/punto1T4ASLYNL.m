clear all
close all
clc

%punto 1*******************
%a)************************
A=[1 0 0; 0 0 1; -1 -1 -1];
B=[0 -1 0]';
C=[1 0 1];

%Controlabilidad
Co=ctrb(A,B);
rank(Co)

%Observabilidad
Ob=obsv(A,C);
rank(Ob)

%Modo controlable
[Ac, Bc, Cc,T,K]=ctrbf(A,B,C);
%Modo observable
[Ao, Bo, Co,T,K]=obsvf(A,B,C);

%b)************************
A=[0 1 5; 2 0 1; 0 -2 -3];
B=[0 0 1]';
C=[3 4 1];

%Controlabilidad
Co=ctrb(A,B);
rank(Co)

%Observabilidad
Ob=obsv(A,C);
rank(Ob)

%Modo controlable
[Ac, Bc, Cc,T,K]=ctrbf(A,B,C);
%Modo observable
[Ao, Bo, Co,T,K]=obsvf(A,B,C);

%c)************************
A=[2 13 26; 1 -7 -14; 0 1 3];
B=[-2 1 0]';
C=[1 3 4];

%Controlabilidad
Co=ctrb(A,B);
rank(Co)

%Observabilidad
Ob=obsv(A,C);
rank(Ob)

%Modo controlable
[Ac, Bc, Cc,T,K]=ctrbf(A,B,C);
%Modo observable
[Ao, Bo, Co,T,K]=obsvf(A,B,C);

%*******************

%punto 3*******************
x1_raices=roots([-83.72 226.31 -229.62 103.79 -18.43 0.8]);
x2=(-x1_raices+1.2)/1.5;
%****************************


%punto 4*******************
%a)
syms x1 x2
x1punto=x1^2+2*x1*x2+x2^2-1;
x2punto=x1^2-2*x1*x2+x2^2-1;

dx1punto=jacobian(x1punto,[x1 x2]);
dx2punto=jacobian(x2punto,[x1 x2]);

A=[dx1punto;dx2punto];

Ape1=subs(A,[x1 x2],[1 0]);
av1=eig(Ape1);

Ape2=subs(A,[x1 x2],[-1 0]);
av2=eig(Ape2);

Ape3=subs(A,[x1 x2],[0 1]);
av3=eig(Ape3);

Ape4=subs(A,[x1 x2],[0 -1]);
av4=eig(Ape4);

%b)
syms x1 x2
x1punto=x2;
x2punto=-x1+x2*(1-3*x1^2-2*x2^2);

dx1punto=jacobian(x1punto,[x1 x2]);
dx2punto=jacobian(x2punto,[x1 x2]);

A=[dx1punto;dx2punto];

Ape=subs(A,[x1 x2],[0 0]);
av=eig(Ape);

%c)

syms x1 x2
x1punto=(1-x1)*x1-2*x1*x2/(1+x1);
x2punto=(2-x2/(1+x1))*x2;

dx1punto=jacobian(x1punto,[x1 x2]);
dx2punto=jacobian(x2punto,[x1 x2]);

A=[dx1punto;dx2punto];

Ape1=subs(A,[x1 x2],[0 0]);
av1=eig(Ape1);

Ape2=subs(A,[x1 x2],[1 0]);
av2=eig(Ape2);

Ape3=subs(A,[x1 x2],[0 2]);
av3=eig(Ape3);

Ape4=subs(A,[x1 x2],[-3 -4]);
av4=eig(Ape4);

%d)

syms x1 x2
x1punto=x1*(3-x1-x2);
x2punto=x2*(x1-1);

dx1punto=jacobian(x1punto,[x1 x2]);
dx2punto=jacobian(x2punto,[x1 x2]);

A=[dx1punto;dx2punto];

Ape1=subs(A,[x1 x2],[1 2]);
av1=eig(Ape1);

Ape2=subs(A,[x1 x2],[0 0]);
av2=eig(Ape2);

Ape3=subs(A,[x1 x2],[3 0]);
av3=eig(Ape3);

%e)

syms x1 x2
x1punto=x1^2+x2^2-1;
x2punto=x1^2-x2^2;

dx1punto=jacobian(x1punto,[x1 x2]);
dx2punto=jacobian(x2punto,[x1 x2]);

A=[dx1punto;dx2punto];

Ape1=subs(A,[x1 x2],[sqrt(0.5) sqrt(0.5)]);
av1=eig(Ape1);

Ape2=subs(A,[x1 x2],[sqrt(0.5) -sqrt(0.5)]);
av2=eig(Ape2);

Ape3=subs(A,[x1 x2],[-sqrt(0.5) sqrt(0.5)]);
av3=eig(Ape3);

Ape4=subs(A,[x1 x2],[-sqrt(0.5) -sqrt(0.5)]);
av4=eig(Ape4);

%****************************

%Punto 6 ****************************
%c)
% 
% syms x1 x2 u
% w0=1.5811e3;
% w1=1.6667e3;
% b=106.06;
% u=0.8;
% 
% x1punto=-w0*x2+u*w0*x2+b;
% x2punto=w0*x1-w1*x2-u*w0*x1;
% 
% dx1punto=jacobian(x1punto,[x1 x2]);
% dx2punto=jacobian(x2punto,[x1 x2]);
% % db1=jacobian(x1punto,u);
% % db2=jacobian(x2punto,u);
% 
% A=[dx1punto;dx2punto];
% B=[db1;db2];