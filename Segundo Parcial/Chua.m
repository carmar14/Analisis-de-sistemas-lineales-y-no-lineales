function dXdt=Chua(t,X)  %  
    a=9.5;%6;%15.6;%10.91865 %caos;
    B=14;%31;
%     a=10.91865 %caos;
%     B=17;
%     a=6;
%     B=14;
    d1=1/6;
    d3=1/16;
    %x1=X(1), x2=X(2), x3=X(3)
    phi=-d1*X(1)+d3*X(1)^3;
    dXdt=[a*(X(2)-phi); X(1)-X(2)+X(3); -B*X(2)];
%     dXdt=[a*(X(2)+d1*X(1)-d3*X(1)^3); X(1)-X(2)+X(3); -B*X(2)];
end