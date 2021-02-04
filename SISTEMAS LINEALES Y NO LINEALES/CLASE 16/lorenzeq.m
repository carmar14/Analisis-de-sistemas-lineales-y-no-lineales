function dxdt = lorenzeq(t,x)
global sigma ro beta
dxdt = [sigma*(x(2)-x(1));
        ro*x(1)-x(2)-x(1)*x(3);
        x(1)*x(2)-beta*x(3)];
end
