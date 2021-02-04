clear all
clc
[t,x]=ode45(@vdp1,[0 20],[0.5;0.5]);
figure
plot(t,x(:,1),t,x(:,2))
figure
plot(x(:,1),x(:,2))