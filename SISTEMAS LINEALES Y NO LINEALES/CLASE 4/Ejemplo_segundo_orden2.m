
close all
ftc1=tf(1,[1 2 10]);
ftc2=tf(5,conv([1 2 10],[1 5]));
ftc3=tf(10,conv([1 2 10],[1 10]));
figure
hold on
step(ftc1)
step(ftc2)
step(ftc3)

axis([0 6 0 0.2])
hold off