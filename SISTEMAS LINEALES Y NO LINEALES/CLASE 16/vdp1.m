function dxdt = vdp1(t,x)
dxdt = [x(2); (1-x(1)^2)*x(2)-x(1)];
end
