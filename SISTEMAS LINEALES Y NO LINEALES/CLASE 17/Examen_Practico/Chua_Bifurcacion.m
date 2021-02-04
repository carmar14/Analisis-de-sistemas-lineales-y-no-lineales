clear all
close all;
N=50;
a=10.91865;
b=14;
x(1)=0.1;
y(1)=0.1;
z(1)=0.1;
d1=1/6;
d3=1/16;
for n=1:N-1
    x(n+1)=a*(y(n)-(d3*x(n).^3-d1*x(n)));
    y(n+1)=x(n)-y(n)+z(n);
    z(n+1)=-b*y(n);
end
figure
plot3(x,y,z)
figure
plot(x);
figure
plot(y);
figure
plot(z);

% %%
% %diagrama de difurcacion
% close all
% clc
% N=100;
% figure
% c=linspace(0.0,3.9,100);
% hold on
% for k=1:length(c);
%     x(1)=0.1;
%     for n=1:N-1
%         x(n+1)=c(k)*x(n)*(1-x(n));
%         if(n>0.6*N)
%             plot(c(k),x(n),'b.','MarkerSize',1)
%         end
%     end
% end