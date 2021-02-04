%configuracion del  metodo numerico
h=0.01;%(decima parte de tao)
tmax=10;
ci1=0;
ci2=0;

%configuracion de sistema
k=1.5;
zita=1.0;
wn=3;

[t,x1,x2]=RK_prueba_2(h,tmax,ci1,ci2,k,zita,wn);
plot(t,x1,'b',t,x2,'r')