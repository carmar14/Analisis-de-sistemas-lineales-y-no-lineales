close all
clear
clc 

%Punto 2.a
%**************************************%
%Vector Fila
vf1=[1 2 3 4 5];
vf2=[6 7 8 9 10];

%Vector columna 
vc1=[1;2;3;4;5];
vc2=[6;7;8;9;10];


%Punto 2.b
%**************************************%
% Matriz cuadrada
%Orden de la matriz n
n=5;

for i=1:n
    for j=1:n
        mc1(i,j)=i;
    end
end 

n=7;

for i=1:n
    for j=1:n
        mc2(i,j)=i;
    end
end 

%Matriz rectangular
%Orden de la matriz mxn
m=3;
n=4;

for i=1:m
    for j=1:n
        mr1(i,j)=i;
    end
end 

m=7;
n=2;

for i=1:m
    for j=1:n
        mr2(i,j)=i;
    end
end 


%Punto 2.c
%**************************************%
%Matriz diagonal
%Orden de la matriz nxn
n=3;

for i=1:n
    for j=1:n
        if i==j
            md1(i,j)=randn;
        end
    end
end 

n=6;

for i=1:n
    for j=1:n
        if i==j
            md2(i,j)=randn;
        end
    end
end 

%Punto 2.d
%**************************************%
%Matriz triangular superior
%Orden de la matriz nxn
n=3;

mts1=triu(ones(n,n));

n=6;

mts2=triu(ones(n,n));

%Matriz triangular inferior
%Orden de la matriz nxn
n=4;

mti1=tril(ones(n,n));

n=7;

mti2=tril(ones(n,n));


%Punto 2.e
%**************************************%
%Matriz identidad
mi1=eye(4);
mi2=eye(7);

%Punto 2.f
%**************************************%
%Matriz simétrica

r = [2 4 7 8 1];
ms1=toeplitz(r);
r=[-6 7 -2 0 8 8 0 -1 -5];
ms2=toeplitz(r);





        
        