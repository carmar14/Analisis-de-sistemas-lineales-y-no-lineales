
global sigma ro beta
sigma=10;
ro=28;
beta=8/3;
[t,x]=ode45(@lorenzeq,[0 100],[0.5;0.5;0.5]);
figure
plot(t,x(:,1),t,x(:,2),t,x(:,3))
figure
%plot3(x(:,1),x(:,2),x(:,3))

N=length(t);
for i=1:N
    plot3(x(1:i,1),x(1:i,2),x(1:i,3),'-b');
    hold on
    plot3(x(i,1),x(i,2),x(i,3),'or');
    axis([-25 50 -25 50 -20 80])
    view(20,15);
    hold off
    pause(0.001)
end