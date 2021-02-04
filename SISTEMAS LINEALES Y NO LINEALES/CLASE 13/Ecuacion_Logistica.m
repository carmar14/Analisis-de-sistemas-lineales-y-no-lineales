clear all
close all;
N=500;
figure
c=3;
hold on
x(1)=0.1;
for n=1:N-1
    x(n+1)=c*x(n)*(1-x(n));
end
plot(x);

%%
%diagrama de difurcacion
close all
clc
N=100;
figure
c=linspace(0.0,3.9,100);
hold on
for k=1:length(c);
    x(1)=0.1;
    for n=1:N-1
        x(n+1)=c(k)*x(n)*(1-x(n));
        if(n>0.6*N)
            plot(c(k),x(n),'b.','MarkerSize',1)
        end
    end
end