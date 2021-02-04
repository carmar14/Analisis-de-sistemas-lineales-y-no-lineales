function dxdt = chua(t,x)
global a b
d1=1/6;
d3=1/16;
dxdt = [a*(x(2)-(d3*x(1)^3-d1*x(1)));
        x(1)-x(2)+x(3);
       -b*x(2)];
end
