clear 
close all
tini=0;
tfin=2*pi
N=100;
h=(tfin-tini)/N;
T=0:h:tfin;
F(1)=0;
for i=1:N;
    F(i+1)=F(i)+cos(T(i))*h;
end
plot(T,F);
grid on