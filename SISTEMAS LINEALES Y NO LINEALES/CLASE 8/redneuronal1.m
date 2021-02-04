clear all;
%%
x=0:pi/10:2*pi;
f=sin(x);
plot(x,f,'ob')

%%
red=newff(x,f,[10],{'tansig','purelin'},'trainlm');
red.dividefcn='';
red=train(red,x,f);

%%
F=sim(red,x);
figure
plot(x,f,'ob',x,F,'*r');
