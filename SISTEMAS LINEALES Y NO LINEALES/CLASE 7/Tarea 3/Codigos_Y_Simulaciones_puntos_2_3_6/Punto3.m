close all;
clear all;
cont=0;
wn=20;
for k=pi/2:pi/100:3*pi/2
    cont=cont+1;
    pc=wn*cos(k)+i*wn*sin(k);
    pd=exp(pc*0.1);
    zitax(cont)=real(pc);zitay(cont)=imag(pc);
    zitaDx(cont)=real(pd);zitaDy(cont)=imag(pd);
end
figure
plot(zitax,zitay)
figure
plot(zitaDx,zitaDy)