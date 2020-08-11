close all
clc
clear 
%6.a

t=0:0.01:50;
x=2*t+8;
figure
plot(t,x);
title('Gráfica de una linea recta')
figure
x=sin(2*t);
plot(t,x)
title('Gráfica de una sinusoidal')

%6b
x=t.^2+8+t.^5;
figure
subplot(2,1,1);
plot(t,x);
x=sin(2*t).^2+cos(3*t);
subplot(2,1,2)
plot(t,x);

%6c
sn = @(x) tan(1./x);
figure
subplot(2,1,1)
fplot(sn,[0.01,0.1])

sn = @(x) x.^3+x.^2-x;
subplot(2,1,2)
fplot(sn,[-3,3])


%6d
x=-2:0.1:2;
y=x;
z=x.^2+y.^2;
figure
subplot(2,1,1)
plot3(x,y,z)
t = 0:pi/50:10*pi;
st = sin(t)./t;
ct = cos(t)./t;
subplot(2,1,2)
plot3(st,ct,t)

%6e
x = linspace(-2*pi,2*pi); 
y = linspace(0,4*pi);
[X,Y] = meshgrid(x,y);
Z = X.^2+cos(Y);

figure
subplot(2,1,1)
contour(X,Y,Z)

x = -5:0.02:5;
y = -8:0.02:8;
[X,Y] = meshgrid(x,y);
Z = -tan(X)+Y.^5;

subplot(2,1,2)
contour(X,Y,Z)

%6f

[x,y,z] = sphere(36);
figure
subplot(2,1,1)
surf(x,y,z);

x=-2:0.1:2;
y=-2:0.1:2;
[x,y]=meshgrid(x,y);
z=sin(x)+cos(y);
subplot(2,1,2)
surf(x,y,z); 

%6g

x=[-2.1:0.15:2.1];
y=[-6:0.15:6];
[X,Y]=meshgrid(x,y);
Z= 80*Y.^2.*exp(-X.^2 - 0.3*Y.^2);
figure
subplot(2,1,1)
mesh(X,Y,Z)
Z= 80*Y.^2.*sin(-X.^2 - 0.3*Y.^2);
subplot(2,1,2)
mesh(X,Y,Z)

%6h
x = -2:0.25:2;
[X,Y] = meshgrid(x);
figure
subplot(2,1,1)
Z = X.*exp(-Y.^2);
contour3(X,Y,Z,30)

subplot(2,1,2)
Z = sin(X)+cos(Y)- X.*exp(-X.^2-Y.^2);
contour3(X,Y,Z,30)





