clear all;

A=[1,3;5,6]%Matriz 2x2
B=[4,1,7;1,4,6;4,6,2]%matriz 3x3

%Suma de matrices
C=A+A %suma de matrices 2x2
D=B+B %suma de matrices 3x3

%multiplicacion de matrices
E=A*A%multiplicacion de matrices 2x2
F=B*B%multiplicacion de matrices 3x3

%matriz inversa
G=inv(A) %inversa de matriz 2x2
H=inv(B) %inversa de matriz 3x3

%Auto valores y auo vectores de una matriz
[I,J]=eig(A) %auto valores de matriz 2x2
[K,L]=eig(B) %auto valores matriz 3x3


%Matriz Transpuesta
M=A'%matriz transpuesta de matriz 2x2
N=B'%matriz transpuesta de matriz 3x3

%Matriz adjunta
O=cof(A)'%Matriz adjunta de matriz 2x2
P=cof(B)'%Matriz adjunta de matriz 3x3

%rango de una matriz
Q=rank(A) %rango de la matriz 2x2
R=rank(B)%rango de matriz 3x3







%metodo para obtener cofactores
function Cof=cof(a);
%   Angelica Ochoa
%   Boston University
%   aochoa09@bu.edu
%   Last Modified: 8-Feb-2012

%% Check Input Argument
%----------------------
if isempty(a)
    error(message('cof:EmptyMatrix'));
end

%% Algorithm 
%-----------
[r c] = size(a);    %determine size of input           
m = ones(r,c);      %preallocate r x c cofactor matrix        
a_temp=a;           %create temporary matrix equal to input
for i = 1:r
    for k = 1:c
        a_temp([i],:)=[];   %remove ith row
        a_temp(:,[k])=[];   %remove kth row
        m(i,k) = ((-1)^(i+k))*det(a_temp);  %compute cofactor element
        a_temp=a;   %reset elements of temporary matrix to input elements
    end  
end

Cof=m;  %return cofactor matrix as output variable

end
