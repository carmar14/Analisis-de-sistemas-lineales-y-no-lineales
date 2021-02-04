function [t,x1,x2]=RK_prueba_2(h,tmax,ci1,ci2,k,zita,wn)
t = 0:h:tmax;                                         
x1 = zeros(1,length(t)); 
x2 = zeros(1,length(t)); 
x1(1) = ci1;      
x2(1) = ci2;  
  
for i=1:(length(t)-1)        
     k_11= sistema1(t(i),x1(i),x2(i),k,zita,wn);
    k_12= sistema2(t(i),x1(i),x2(i),k,zita,wn);
    
    k_21 = sistema1(t(i)+0.5*h,x1(i)+0.5*h*k_11,x2(i)+0.5*h*k_12,k,zita,wn);
    k_22 = sistema2(t(i)+0.5*h,x1(i)+0.5*h*k_11,x2(i)+0.5*h*k_12,k,zita,wn);
    
    k_31 = sistema1((t(i)+0.5*h),(x1(i)+0.5*h*k_21),(x2(i)+0.5*h*k_22),k,zita,wn);
    k_32 = sistema2((t(i)+0.5*h),(x1(i)+0.5*h*k_21),(x2(i)+0.5*h*k_22),k,zita,wn);
    
    k_41 = sistema1((t(i)+h),(x1(i)+k_31*h),(x2(i)+k_32*h),k,zita,wn);
    k_42 = sistema2((t(i)+h),(x1(i)+k_31*h),(x2(i)+k_32*h),k,zita,wn);
    
    x1(i+1) = x1(i) + (1/6)*(k_11+2*k_21+2*k_31+k_41)*h;  
    x2(i+1) = x2(i) + (1/6)*(k_12+2*k_22+2*k_32+k_42)*h;  
end

function [derX1]=sistema1(t,x1,x2,k,zita,wn)
derX1=x2;

function [derX2]=sistema2(t,x1,x2,k,zita,wn)
derX2=k*wn^2-2*zita*wn*x2-wn^2*x1;