%Solucion de matrices con numero de incognitas igual al numero de
%sistema de 2 incognitas y 2 ecuaciones
%3x+5y=9
%8x+12y=6

M=[3,5;8,12]%matriz de euaciones
R=[9;6]%matriz de resultados
V=inv(M)*R%Matriz de valores de incognita


%Sistema de 4 inconitas y 4 ecuaciones
%2a+3b+6c+5d=3
%3b+9c+5d=8
%45a+4b-6c+8d=5
%a+b+2c+d=2

A=[2,3,6,5;0,3,9,5;45,4,-6,8;1,1,2,1]%matriz de ecuaciones

B=[3;8;5;2]%Matriz de resultados

C=inv(A)*B %calculo de valores de variables