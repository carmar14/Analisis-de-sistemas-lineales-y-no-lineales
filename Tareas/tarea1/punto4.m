clear 
close all
clc

%Suma de matrices

%2x2
a1=[1 2;4 7];
b1=[3 4; 1 8];
suma1=a1+b1;

%3x3
a2=[1 2 -1;4 7 0;0 3 -3];
b2=[3 4 -4; 1 8 7;-2 -4 8];
suma2=a2+b2;

%Multiplicacion de matrices

%2x2

mult1=a1*b1;

%3x3
mult2=a2*b2;

%Determinante de matrices

%2x2

det1=det(a1);
 
%3x3
det2=det(a2);

%Matriz inversa

%2x2

inv1=inv(a1);

%3x3
inv2=inv(a2);
 
%Autovalores y autovectores

%2x2

[avec1,av1]=eig(a1);

%3x3
[avec2,av2]=eig(a2);

%Matriz traspuesta
%2x2
mt1=a1';
%3x3
mt2=a2';

%Matriz adjunta= a la matriz traspuesta de la matriz de cofactores 
%2x2
[r c] = size(a1);              
madj1 = ones(r,c);          
a_temp1=a1;          
for i = 1:r
    for k = 1:c
        a_temp1([i],:)=[];  
        a_temp1(:,[k])=[];  
        madj1(i,k) = ((-1)^(i+k))*det(a_temp1);  %compute cofactor element
        a_temp1=a1;   
    end  
end
%3x3
[r c] = size(a2);              
madj2 = ones(r,c);          
a_temp2=a2;          
for i = 1:r
    for k = 1:c
        a_temp2([i],:)=[]; 
        a_temp2(:,[k])=[];
        madj2(i,k) = ((-1)^(i+k))*det(a_temp2);  %compute cofactor element
        a_temp2=a2;   
    end  
end

madj1=madj1';
madj2=madj2';

%Rango de una matriz
%2x2
rm1=rank(a1);
%3x3
rm2=rank(a2);




