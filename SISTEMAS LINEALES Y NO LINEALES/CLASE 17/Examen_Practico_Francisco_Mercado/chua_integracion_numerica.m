close all;
clear all;
clc;

global a b
a=10.91865;
%a=10;
b=14;
[t,x]=ode45(@chua,[0 50],[0.1;0.1;0.1]);
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
    axis([-4 4 -4 4 -4 4])
    view(20,15);
    hold off
    pause(0.001)
end