function dxdt = rossler(t,x)
global a c
dxdt = [-x(2)-x(3);
        x(1)+a*x(2);
        a+x(3)*(x(1)-c)];
end
