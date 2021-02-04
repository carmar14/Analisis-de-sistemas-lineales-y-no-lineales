function dxdt = Lorenz(t,x)
global sig r b
dxdt = [sig*(x(2)-x(1));
        x(1)*(r-x(3))-x(2);
       x(1)*x(2)-b*x(3)];
end
