close all
clc
clear
syms s R L Kv Kf m1 k1 b1 m2 m3 b2 b3 k2;
%PRIMER PUNTO
%Repesentación en la variable de estado
A=[-R/L     0       -Kv/L       0       0           0       0;
    0       0       1           0       0           0       0;
    Kf/m1 -k1/m1    -b1/m1     k1/m1    b1/m1       0       0;
    0       0       0           0       1           0       0;
    0      k1/m2    b1/m2     -k1/m2 -(b1+b2)/m2    0       b2/m2;
    0       0       0           0       0           0       1;
    0       0       0           0       b2/m3       -k2/m3 -(b2+b3)/m3];
B=[1/L 0; zeros(5,2); 0 1/m3];

C=sym([1 zeros(1,6); zeros(1,5) 1 0]);

%SEGUNDO PUNTO

%Cálculo de la función de transferencia
ms=[s zeros(1,6);
    0 s zeros(1,5);
    zeros(1,2) s zeros(1,4);
    zeros(1,3) s zeros(1,3);
    zeros(1,4) s zeros(1,2)
    zeros(1,5) s 0;
    zeros(1,6) s] ;    %Matriz sI
siA=ms-A;  %Matriz sI-A
detsiA=det(siA);
invsiA=inv(siA);  %(sI-A)^-1
ftransfc=C*invsiA*B;  %H(S)=C(sI-A)^-1*B
[num1s,den1s]=numden(ftransfc(1,1));  %Y1(s)/U1(s)
[num2s,den2s]=numden(ftransfc(1,2));  %Y1(s)/U2(s)
[num3s,den3s]=numden(ftransfc(2,1));  %Y2(s)/U1(s)
[num4s,den4s]=numden(ftransfc(2,2));  %Y2(s)/U2(s)

num1s=collect(num1s,s);
den1s=collect(den1s,s);
num2s=collect(num2s,s);
den2s=collect(den2s,s);
num3s=collect(num3s,s);
den3s=collect(den3s,s);
num4s=collect(num4s,s);
den4s=collect(den4s,s);

%TERCER PUNTO
%Escogiendo valores
num1s=subs(num1s,[R L Kv Kf m1 k1 b1 m2 m3 b2 b3 k2],ones(1,12));
den1s=subs(den1s,[R L Kv Kf m1 k1 b1 m2 m3 b2 b3 k2],ones(1,12));
num2s=subs(num2s,[R L Kv Kf m1 k1 b1 m2 m3 b2 b3 k2],ones(1,12));
den2s=subs(den2s,[R L Kv Kf m1 k1 b1 m2 m3 b2 b3 k2],ones(1,12));
num3s=subs(num3s,[R L Kv Kf m1 k1 b1 m2 m3 b2 b3 k2],ones(1,12));
den3s=subs(den3s,[R L Kv Kf m1 k1 b1 m2 m3 b2 b3 k2],ones(1,12));
num4s=subs(num4s,[R L Kv Kf m1 k1 b1 m2 m3 b2 b3 k2],ones(1,12));
den4s=subs(den4s,[R L Kv Kf m1 k1 b1 m2 m3 b2 b3 k2],ones(1,12));

num1s=sym2poly(num1s);
den1s=sym2poly(den1s);
num2s=sym2poly(num2s);
den2s=sym2poly(den2s);
num3s=sym2poly(num3s);
den3s=sym2poly(den3s);
num4s=sym2poly(num4s);
den4s=sym2poly(den4s);

%Funciones de transferencia
ft1=tf(num1s,den1s);
ft2=tf(num2s,den2s);
ft3=tf(num3s,den3s);
ft4=tf(num4s,den4s);
zpk1=zpk(ft1);
zpk2=zpk(ft2);
zpk3=zpk(ft3);
zpk4=zpk(ft4);

%Respuesta temporal
figure
step(ft1)
title('Respuesta de la corriente ante la entrada de tensión')
ylabel('Corriente (A)')
xlabel('Tiempo')
[y1,t]=step(ft1);
figure
step(ft2)
title('Respuesta de la corriente ante la entrada de la fuerza en la masa 3')
ylabel('Corriente (A)')
xlabel('Tiempo')
y2=step(ft2);
figure
step(ft3)
title('Respuesta de la posición de la masa 3 ante la entrada de tensión')
ylabel('Posición de la masa 3 (m)')
xlabel('Tiempo')
y3=step(ft3);
figure
step(ft4)
title('Respuesta de la posición de la masa 3 ante la entrada de la fuerza en la masa 3')
ylabel('Posición de la masa 3 (m)')
xlabel('Tiempo')
y4=step(ft4);

figure
plot(0:0.01:20,step(ft1,0:0.01:20)+step(ft2,0:0.01:20))
hold on
plot(0:0.01:20,step(ft3,0:0.01:20)+step(ft4,0:0.01:20))
legend('Respuesta de la corriente ante las dos entradas','Respuesta de la posición de la masa 3 ante las dos entradas');
ylabel('Amplitud')
xlabel('Tiempo(s)')
% title('Respuesta de la corriente ante las dos entradas')
% ylabel('Corriente (A)')
% xlabel('Tiempo')
% figure
% plot(0:0.01:20,step(ft3,0:0.01:20)+step(ft4,0:0.01:20))
% title('Respuesta de la posición de la masa 3ante las dos entradas')
% ylabel('Corriente (A)')
% xlabel('Tiempo')

%Prueba con todos los numeros iguales

A=double(subs(A,[R L Kv Kf m1 k1 b1 m2 m3 b2 b3 k2],ones(1,12)));
B=double(subs(B,[R L Kv Kf m1 k1 b1 m2 m3 b2 b3 k2],ones(1,12)));
C=double(C);
B1=B(:,1);
B2=B(:,2);
[M, n]=size(B1);
[m, N]=size(C);
D=zeros(m,n);
[num1,den1]=ss2tf(A,B1,C,D);
[M, n]=size(B2);
D=zeros(m,n);
[num2,den2]=ss2tf(A,B2,C,D);

%Polos y ceros
zpk1p=zpk((tf(num1(1,:),den1)));  %Y1/U1
zpk2p=zpk((tf(num2(1,:),den2))); %Y1/U2
zpk3p=zpk((tf(num1(2,:),den1)));  %Y2/U1
zpk4p=zpk((tf(num2(2,:),den2)));  %Y2/U2

figure
step(tf(num1(1,:),den1))
title('Respuesta de la corriente ante la entrada de tensión')
ylabel('Corriente (A)')
xlabel('Tiempo')
y1p=step(tf(num1(1,:),den1));
figure
step(tf(num1(2,:),den1))
title('Respuesta de la posición de la masa 3 ante la entrada de tensión')
ylabel('Posición de la masa 3 (m)') 
xlabel('Tiempo')
y3p=step(tf(num1(2,:),den1));
figure
step(tf(num2(1,:),den2))
title('Respuesta de la corriente ante la entrada de la fuerza en la masa 3')
ylabel('Corriente (A)')
xlabel('Tiempo')
y2p=step(tf(num2(1,:),den2));
figure
step(tf(num2(2,:),den2))
title('Respuesta de la posición de la masa 3 ante la entrada de la fuerza en la masa 3')
ylabel('Posición de la masa 3 (m)')
xlabel('Tiempo')
y4p=step(tf(num2(2,:),den2));

figure
sys = ss(A,B,C,0);
step(sys)

%CUARTO PUNTO
%Discretización del sistema
pc=abs(min(real(roots(den1s))));   %Polo que contiene la dinámica mas rapida del sistema
Ts=1/(pc*10); %Periodo de muestreo
sysd=c2d(sys,Ts);    %Sistema  discreto

%Variables de estado discretas
Ad=sysd(1,1).a;
Bd=[sysd(1,1).b sysd(1,2).b];
Cd=[sysd(1,1).c ;sysd(2,1).c];

%Funciones de transferencia discreta
B1d=Bd(:,1);
B2d=Bd(:,2);
[M, n]=size(B1d);
[m, N]=size(Cd);
D=zeros(m,n);
[num1d,den1d]=ss2tf(Ad,B1d,Cd,D);
[num2d,den2d]=ss2tf(Ad,B2d,Cd,D);

ft1d=tf(num1d(1,:),den1d,Ts);   %Y1(z)/U1(z)
ft2d=tf(num2d(1,:),den2d,Ts);   %Y1(z)/U2(z)
ft3d=tf(num1d(2,:),den1d,Ts);   %Y2(z)/U1(z)
ft4d=tf(num2d(2,:),den2d,Ts);   %Y2(z)/U2(z)


%Respuesta temporal del sistema
figure
step(tf(num1d(1,:),den1d,Ts))
title('Respuesta de la corriente ante la entrada de tensión')
ylabel('Corriente (A)')
xlabel('Tiempo')
y1p=step(tf(num1d(1,:),den1d,Ts));
figure
step(tf(num1d(2,:),den1d,Ts))
title('Respuesta de la posición de la masa 3 ante la entrada de tensión')
ylabel('Posición de la masa 3 (m)')
xlabel('Tiempo')
y3p=step(tf(num1d(2,:),den1d,Ts));
figure
step(tf(num2d(1,:),den2d,Ts))
title('Respuesta de la corriente ante la entrada de la fuerza en la masa 3')
ylabel('Corriente (A)')
xlabel('Tiempo')
y2p=step(tf(num2d(1,:),den2d,Ts));
figure
step(tf(num2d(2,:),den2d,Ts))
title('Respuesta de la posición de la masa 3 ante la entrada de la fuerza en la masa 3')
ylabel('Posición de la masa 3 (m)')
xlabel('Tiempo')
y4p=step(tf(num2d(2,:),den2d,Ts));

figure
plot(0:Ts:20,step(ft1d,0:Ts:20)+step(ft2d,0:Ts:20))
hold on
plot(0:Ts:20,step(ft3d,0:Ts:20)+step(ft4d,0:Ts:20))
legend('Respuesta de la corriente ante las dos entradas','Respuesta de la posición de la masa 3 ante las dos entradas');
ylabel('Amplitud')
xlabel('Tiempo(s)')

figure
step(sysd)

% close all

%s^7 + ((L*b1*m1*m3 + L*b2*m1*m2 + L*b1*m2*m3 + L*b2*m1*m3 + L*b3*m1*m2 + R*m1*m2*m3)*s^6)/(L*m1*m2*m3) + ((Kf*Kv*m2*m3 + L*b1*b2*m1 + L*b1*b2*m2 + L*b1*b3*m1 + L*b1*b2*m3 + L*b1*b3*m2 + L*b2*b3*m1 + R*b1*m1*m3 + R*b2*m1*m2 + R*b1*m2*m3 + R*b2*m1*m3 + R*b3*m1*m2 + L*k1*m1*m3 + L*k2*m1*m2 + L*k1*m2*m3)*s^5)/(L*m1*m2*m3) + ((Kf*Kv*b1*m3 + Kf*Kv*b2*m2 + Kf*Kv*b2*m3 + Kf*Kv*b3*m2 + L*b1*b2*b3 + R*b1*b2*m1 + R*b1*b2*m2 + R*b1*b3*m1 + R*b1*b2*m3 + R*b1*b3*m2 + R*b2*b3*m1 + L*b1*k2*m1 + L*b2*k1*m1 + L*b1*k2*m2 + L*b2*k1*m2 + L*b2*k2*m1 + L*b3*k1*m1 + L*b2*k1*m3 + L*b3*k1*m2 + R*k1*m1*m3 + R*k2*m1*m2 + R*k1*m2*m3)*s^4)/(L*m1*m2*m3) + ((Kf*Kv*b1*b2 + Kf*Kv*b1*b3 + Kf*Kv*b2*b3 + Kf*Kv*k1*m3 + Kf*Kv*k2*m2 + R*b1*b2*b3 + L*b1*b2*k2 + L*b2*b3*k1 + R*b1*k2*m1 + R*b2*k1*m1 + R*b1*k2*m2 + R*b2*k1*m2 + R*b2*k2*m1 + R*b3*k1*m1 + R*b2*k1*m3 + R*b3*k1*m2 + L*k1*k2*m1 + L*k1*k2*m2)*s^3)/(L*m1*m2*m3) + ((Kf*Kv*b1*k2 + Kf*Kv*b2*k1 + Kf*Kv*b2*k2 + Kf*Kv*b3*k1 + R*b1*b2*k2 + R*b2*b3*k1 + L*b2*k1*k2 + R*k1*k2*m1 + R*k1*k2*m2)*s^2)/(L*m1*m2*m3) + ((Kf*Kv*k1*k2 + R*b2*k1*k2)*s)/(L*m1*m2*m3)
 

%Variables de estado discretas X(k+1)
syms X_1K X_2K X_3K X_4K X_5K X_6K X_7K U_K1 U_K2;
X=[X_1K ;X_2K ;X_3K; X_4K; X_5K; X_6K; X_7K];
U=[U_K1 ;U_K2];
Xk=Ad*X+Bd*U;
X_1K=0;
X_2K=0;
X_3K=0;
X_4K=0;
X_5K=0;
X_6K=0;
X_7K=0;
U_K1=1;
U_K2=1;

for i=1:500

  X_1K_1=(5223122979852103*U_K1)/144115188075855872 - (1409998524883549*U_K2)/18889465931478580854784 + (8674763615032865*X_1K)/9007199254740992 + (6058948258983975*X_2K)/9223372036854775808 - (320454737738513*X_3K)/9007199254740992 - (3029474129491989*X_4K)/4611686018427387904 - (378726978158461*X_5K)/576460752303423488 + (2819997049767097*X_6K)/37778931862957161709568 - (4729217547129841*X_7K)/590295810358705651712;
  X_2K_1=(2431031880569833*U_K1)/295147905179352825856 + (5681902287277365*U_K2)/75557863725914323419136 + (6134224350587911*X_1K)/9223372036854775808 + (9001208806238749*X_2K)/9007199254740992 + (5223123059294145*X_3K)/144115188075855872 + (6134219266297083*X_4K)/9223372036854775808 + (6134907742139311*X_5K)/9223372036854775808 - (5681902287277363*X_6K)/75557863725914323419136 + (4773280001032451*X_7K)/590295810358705651712;
  X_3K_1=(766778043823489*U_K1)/1152921504606846976 + (4773280001032453*U_K2)/590295810358705651712 + (5127275803816209*X_1K)/144115188075855872 - (5127265125823217*X_2K)/144115188075855872 + (4337382141203713*X_3K)/4503599627370496 + (5127265125823219*X_4K)/144115188075855872 + (5128419719950935*X_5K)/144115188075855872 - (2386640000516225*X_6K)/295147905179352825856 + (1496262287629811*X_7K)/2305843009213693952;
  X_4K_1=(1431017379227827*U_K1)/18889465931478580854784 + (4773932803362209*U_K2)/590295810358705651712 + (4817669862651809*X_1K)/590295810358705651712 + (6060325242123175*X_2K)/9223372036854775808 + (383431733883707*X_3K)/576460752303423488 + (9001280968371731*X_4K)/9007199254740992 + (2565380630222499*X_5K)/72057594037927936 - (4773932803362205*X_6K)/590295810358705651712 + (2993210508956437*X_7K)/4611686018427387904;
  X_5K_1=(4817669862651807*U_K1)/590295810358705651712 + (1496605254478219*U_K2)/2305843009213693952 + (3029815825267689*X_1K)/4611686018427387904 + (5034903326974069*X_2K)/144115188075855872 + (5128419719950937*X_3K)/144115188075855872 - (2517451663487035*X_4K)/72057594037927936 + (8371773045933345*X_5K)/9007199254740992 - (748302627239109*X_6K)/1152921504606846976 + (2471260046348451*X_7K)/72057594037927936;
  X_6K_1=(2682124015562647*U_K1)/4835703278458516698824704 + (3067800666863557*U_K2)/4611686018427387904 + (1409998524883549*X_1K)/18889465931478580854784 + (18474777116183*X_2K)/2305843009213693952 + (4773280001032451*X_3K)/590295810358705651712 - (4729542941742849*X_4K)/590295810358705651712 + (748302627239109*X_5K)/1152921504606846976 + (2250301864140881*X_6K)/2251799813685248 + (5129585071513689*X_7K)/144115188075855872;
  X_7K_1=(1409998524883549*U_K1)/18889465931478580854784 + (5129585071513689*U_K2)/144115188075855872 + (4729217547129841*X_1K)/590295810358705651712 + (184744953684273*X_2K)/288230376151711744 + (5985049150519245*X_3K)/9223372036854775808 - (5911838517896737*X_4K)/9223372036854775808 + (1235630023174225*X_5K)/36028797018963968 - (5129585071513687*X_6K)/144115188075855872 + (8365855436899619*X_7K)/9007199254740992;
 
  Y1_K(i)=X_1K;
  Y2_K(i)=X_6K;

%Se actualizan el valor de los estados para la siguiente iteración
  X_1K=X_1K_1;
  X_2K=X_2K_1;
  X_3K=X_3K_1;
  X_4K=X_4K_1;
  X_5K=X_5K_1;
  X_6K=X_6K_1;
  X_7K=X_7K_1;
  
end

figure
plot(Y1_K)
hold on
plot(Y2_K)
