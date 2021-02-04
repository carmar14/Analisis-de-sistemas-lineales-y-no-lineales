clear all

%sistemas con numero de ecuaciones diferente al numero de incognitas

%Ejemplo de tres ecuaciones y dos incognitas
%2x+y=3
%2x-y=0
%x-2y=4
A=[2 1;2 -1;1 -2]%matriz de ecuaciones
B=[3;0;4]%matriz de resultados
AB=[A B]%Matriz apliada

rangoA=rank(A);
rangoAB=rank(AB);%si el rango de la matriz A y la matriz ampliada AB son iguales y el rango es igual numero de incongnitas el sistema tiene solucion
[f c]=size(A);


if (rangoA==rangoAB) && (c==rangoA)
    disp('El sistema tiene solución');
else
    disp('El sistema no tiene solución');
end

%ejemplo dos
%2x+y=3
%4x+2y=6
%6x+3y=9

K=[2,1;4,2;6,3]%Matris de ecuaciones
L=[3;6;9]%Matriz de resultados
KL=[K L]

rangoK=rank(K);
rangoKL=rank(KL);%si el rango de la matriz K y la matriz ampliada KL son iguales y el rango es igual numero de incongnitas el sistema tiene solucion
[i j]=size(K);


if (rangoK==rangoKL) && (j==rangoK)
    disp('El sistema tiene solución');
else
    disp('El sistema no tiene solución');
end


