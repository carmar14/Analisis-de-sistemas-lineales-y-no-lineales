clear 
close all
tini=0;
tfin=10;
N=1000;
h=(tfin-tini)/N;
T=tini:h:tfin;
x1(1)=0;
x2(1)=0;
u=1;
for i=1:N
    x1(i+1)=x1(i)+ x2(i)*h;
    x2(i+1)=x2(i)+(-10*x1(i)-2*x2(i)+5*u)*h;
end
plot(T,x1,T,x2);
grid on