clear 
close all
clc;

r1=1;
r2=1;
r3=2;
r4=4;
l1=2;
l2=3;
c=1/5;
%%Espacio estados continuo
ac=[(-r1-r2)/l1,-r1/l1,0;-r1/l2,(-r1-r3)/l2,1/l2;0,-1/c,-1/(r4*c)]
bc=[1/l1;0;1/(r4*c)]
cc=[0,0,-1]
dc=1;
figure
step(ac,bc,cc,dc)

%%Funcion de transferencia continua
[numc,denc]=ss2tf(ac,bc,cc,dc)
Fc=tf(numc,denc)
figure
step(Fc)
eig(Fc)

%%discretización de funcion de transferencia
ts=5;
tm=5/100;
Fd=c2d(Fc,tm,'zoh')
figure
step(Fd)

%%Espacio estado discreto
Fds=ss(Fd);
ad=Fds.A
bd=Fds.B
cd=Fds.C
dd=Fds.D
figure
step(Fds)

