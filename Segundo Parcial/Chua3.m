function dXdt=Chua3(t,X)  %  
    a=9.5;%6;%9.5;% ;%15.6;%10.91865 %caos;
    B=14;%14; %31;
    C2=1;
    m0=-1.143;
    m1=-0.714;
%     a=10.91865 %caos;
%     B=17;
%     a=6;
%     B=14;
%     d1=1/6;
%     d3=1/16;
    %x1=X(1), x2=X(2), x3=X(3)
    phi=m1*X(1)+0.5*(m0-m1)*(abs(X(1)+1)-abs(X(1)-1)); %f(x1)
    dXdt=[a*(X(2)-X(1)-phi); C2*(X(1)-X(2)+X(3)); -B*X(2)];
end