close all;
clear all;
cont=0;
for k=0:pi/100:pi
    cont=cont+1;
    pc=-k+k*i;
    pd=exp(pc);
    zitax(cont)=real(pc);zitay(cont)=imag(pc);
    zitaDx(cont)=real(pd);zitaDy(cont)=imag(pd);
end
figure
plot(zitax,zitay)
figure
plot(zitaDx,zitaDy)