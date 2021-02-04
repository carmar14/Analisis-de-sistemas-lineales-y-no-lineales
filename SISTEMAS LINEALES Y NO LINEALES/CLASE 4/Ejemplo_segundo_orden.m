close all;
k=1;
wn=3;
figure;
hold on
for zita=0:0.01:1
    ftc=tf(k*wn^2,[1 ,2*zita*wn ,wn^2]);
    step(ftc)
    axis([0 10 0 2])
end
hold off