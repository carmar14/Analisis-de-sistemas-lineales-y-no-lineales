function punto3(wn,T)

cont=0;

for k=-wn:0.01:0
    cont=cont+1;
    sigma(cont)=k;
    wd(cont)=sqrt(wn^2-sigma(cont)^2);
    pc=sigma(cont)+wd(cont)*i;
    pd=exp(pc*T);
    wnx(cont)=real(pc);
    wny(cont)=imag(pc);
    wndx(cont)=real(pd);
    wndy(cont)=imag(pd);

end

figure
zgrid
figure
plot(wnx,wny)
title('Curvas de wn contante en el plano s')
figure
plot(wndx,wndy)
title('Curvas de wn contante en el plano z')



