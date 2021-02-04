close all;
clear all
N=500;
figure;axis([-1 1 -1 1]);
hold on
[x1(1),x2(1)]=ginput(1);
%x1(1)=1;x2(1)=1;
for k=1:N-1
   x1(k+1)=0.14*x1(k)+x2(k);
   x2(k+1)=-1*x1(k)-0.1*x2(k);
   plot(x1(k),x2(k),'b*','MarkerSize',5)
   axis([-1 1 -1 1]);
end
figure 
stem(x1)
figure
stem (x2)