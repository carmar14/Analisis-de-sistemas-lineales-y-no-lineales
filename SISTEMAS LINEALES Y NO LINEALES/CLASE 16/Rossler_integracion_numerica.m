
global a c
a=0.1;
c=14;
[t,x]=ode45(@rossler,[0 20],[0.3;0.3;0.3]);
hf1=figure
plot(t,x(:,1),t,x(:,2),t,x(:,3))
hold on
%plot3(x(:,1),x(:,2),x(:,3))
hf2=figure
N=length(t);
for i=1:N
    figure(hf2)
    plot3(x(1:i,1),x(1:i,2),x(1:i,3),'-b');
    hold on
    plot3(x(i,1),x(i,2),x(i,3),'or');
    axis([-15 20 -15 20 -15 20])
    view(20,15);
    hold off
    pause(0.001)
end