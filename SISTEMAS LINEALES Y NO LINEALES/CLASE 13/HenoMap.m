clear all
N=1000;
figure;axis([-1 1 -1 1]);
hold on;
[x1(1), x2(1)]=ginput(1);
for k=1:N-1;
    %[x1(k), x2(k)]=ginput(1);
    x1(k+1)=1-1.4*x1(k)^2+x2(k);
    x2(k+1)=0.3*x1(k);
    plot(x1(k+1),x2(k+1),'b.','MarkerSize',1);
end
