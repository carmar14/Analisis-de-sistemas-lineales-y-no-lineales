close all
clear; clc;
figure
B=14; global a; 
d1=1/6;
d3=1/16;
arange = 6:0.001:12;       % Rango para alpha a
k = 0; tspan = 0:0.1:50;     
xmax = [];             
for a = arange 

    f=@(t,X)[a*(X(2)+d1*X(1)-d3*X(1)^3); X(1)-X(2)+X(3); -B*X(2)];
    x0 = [0.7 0 0];                   % condiciones iniciales
    k = k + 1; 
    [t,x] = ode45(f,tspan,x0);        % Solucion del sisterma
    count = find(t>30);  %t>30 tiempo de estabilizacion
    x = x(count,:); 
    j = 1; 
    n = length(x(:,1)); 
    for i = 2:n-1 
        
        if (x(i-1,1)+eps) < x(i,1) && x(i,1) > (x(i+1,1)+eps)
            xmax(k,j)=x(i,1); 
            j=j+1; 
        end 
    end 
   
    if j>1 
        plot(a,xmax(k,1:j-1),'k.'); 
    end 
    hold on; 
    index(k)=j-1; 
end 
xlabel('Parámetro Alpha'); 
ylabel('x1(t)'); 
title('Diagrama de bifurcacion para alpha con Beta=14'); 