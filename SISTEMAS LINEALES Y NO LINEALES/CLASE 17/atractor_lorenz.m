close all;
clear all;
clc;

global sig r b
%a=10.91865;
sig=10;
b=8/3;
r=28;
[t,x]=ode45(@Lorenz,[0 20],[1;1;1]);
hf1=figure
plot(t,x(:,1),t,x(:,2),t,x(:,3))
hold on
%plot3(x(:,1),x(:,2),x(:,3))
%%
hf2=figure
N=length(t);
for i=1:N
    figure(hf2)
    plot3(x(1:i,1),x(1:i,2),x(1:i,3),'-b');
    hold on
    plot3(x(i,1),x(i,2),x(i,3),'or');
    axis([-50 50 -50 50 -50 50])
    view(20,15);
    hold off
    pause(0.001)
end