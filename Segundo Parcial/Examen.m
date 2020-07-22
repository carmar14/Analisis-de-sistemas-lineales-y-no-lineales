clear all
close all
clc
tamano=get(0,'ScreenSize');
tamano=[1 1 1300 800];

Xini=[0.7 0 0];%[5 -5 8];

[t,y]=ode45(@Chua,[0 50],Xini);
N=length(t);

%Animacion 
figure('position',[tamano(1) tamano(2) tamano(3) tamano(4)])
subplot(2,4,1)
   
for i=1:N
    subplot(2,4,1)
    plot3(y(1:i,1),y(1:i,2),y(1:i,3))
%     axis([-20 20 -20 20 -20 20])
    view(20,15)
    hold on
    plot3(y(i,1),y(i,2),y(i,3),'or')
    title('Atractor Extraño')
    xlabel('X1(t)')
    ylabel('X2(t)')
    zlabel('X3(t)')
    hold off
    
%     X1
    subplot(2,4,2)
    plot(t(1:i),y(1:i,1))
    hold on
    plot(t(i),y(i,1),'or')
    title('X1(t)')
    xlabel('t(s)')
    hold off
    
%     X2
    subplot(2,4,3)
    plot(t(1:i),y(1:i,2))
    hold on
    plot(t(i),y(i,2),'or')
    title('X2(t)')
    xlabel('t(s)')
    hold off
    
%     X3
    subplot(2,4,4)
    plot(t(1:i),y(1:i,3))
    hold on
    plot(t(i),y(i,3),'or')
    title('X3(t)')
    xlabel('t(s)')
    hold off
    
%     X1vsX2
    subplot(2,4,5)
    plot(y(1:i,1),y(1:i,2))
    hold on
    plot(y(i,1),y(i,2),'or')
    title('Plano de fase X1 vs X2')
    xlabel('X1')
    ylabel('X2')
    hold off
    
%     X2vsX3
    subplot(2,4,6)
    plot(y(1:i,2),y(1:i,3))
    hold on
    plot(y(i,2),y(i,3),'or')
    title('Plano de fase X2 vs X3')
    xlabel('X2')
    ylabel('X3')
    hold off
    
%     X3vsX1
    subplot(2,4,7)
    plot(y(1:i,1),y(1:i,3))
    hold on
    plot(y(i,1),y(i,3),'or')
    title('Plano de fase X1 vs X3')
    xlabel('X1')
     ylabel('X3')
    hold off
    
    pause(0.00002)
    
end

figure('position',[tamano(1) tamano(2) tamano(3) tamano(4)])
subplot(2,4,1)
% Atractor=figure(1);
% X1=figure(2);
% X2=figure(3);
% X3=figure(4);

% N=500;
% x(1)=0.1;
% a=linspace(0,12,1000);
% la=length(a);


subplot(2,4,1)
plot3(y(:,1),y(:,2),y(:,3))
%     axis([-20 20 -20 20 -20 20])
view(20,15)

title('Atractor Extraño')
xlabel('X1(t)')
ylabel('X2(t)')
zlabel('X3(t)')


%X1
subplot(2,4,2)
plot(t,y(:,1))
title('X1(t)')
xlabel('t(s)')

%X2
subplot(2,4,3)
plot(t,y(:,2))
title('X2(t)')
xlabel('t(s)')


% X3
subplot(2,4,4)
plot(t,y(:,3))
title('X3(t)')
xlabel('t(s)')


%X1vsX2
subplot(2,4,5)
plot(y(:,1),y(:,2))
title('X1 vs X2')
xlabel('X1')
ylabel('X2')

%X2vsX3
subplot(2,4,6)
plot(y(:,2),y(:,3))
title('X2 vs X3')
xlabel('X2')
ylabel('X3')


% X3vsX1
subplot(2,4,7)
plot(y(:,1),y(:,3))
title('X1 vs X3')
xlabel('X1')
ylabel('X3')


%Otro modelo
figure('position',[tamano(1) tamano(2) tamano(3) tamano(4)])
subplot(2,4,1)
% Atractor=figure(1);
% X1=figure(2);
% X2=figure(3);
% X3=figure(4);

% N=500;
% x(1)=0.1;
% a=linspace(0,12,1000);
% la=length(a);
Xini=[0.7 0 0];

[t,y]=ode45(@Chua3,[0 50],Xini);
N=length(t);

subplot(2,4,1)
plot3(y(:,1),y(:,2),y(:,3))
%     axis([-20 20 -20 20 -20 20])
view(20,15)

title('Atractor Extraño')
xlabel('X1(t)')
ylabel('X2(t)')
zlabel('X3(t)')


%X1
subplot(2,4,2)
plot(t,y(:,1))
title('X1(t)')
xlabel('t(s)')

%X2
subplot(2,4,3)
plot(t,y(:,2))
title('X2(t)')
xlabel('t(s)')


% X3
subplot(2,4,4)
plot(t,y(:,3))
title('X3(t)')
xlabel('t(s)')


%X1vsX2
subplot(2,4,5)
plot(y(:,1),y(:,2))
title('X1 vs X2')
xlabel('X1')
ylabel('X2')

%X2vsX3
subplot(2,4,6)
plot(y(:,2),y(:,3))
title('X2 vs X3')
xlabel('X2')
ylabel('X3')


% X3vsX1
subplot(2,4,7)
plot(y(:,1),y(:,3))
title('X1 vs X3')
xlabel('X1')
ylabel('X3')

% figure
% plot(t,y(:,1))
% title('Evolución en el tiempo de X1')
% 
% figure
% plot(t,y(:,2))
% title('Evolución en el tiempo de X2')
% 
% figure
% plot(t,y(:,3))
% title('Evolución en el tiempo de X3')


%Diagrama de Bifurcaciones
% 
% figure
% hold on
% % N=N/2;
% global alpha
% global i
% 
% alpha=linspace(6,11,1000);
% la=length(alpha);
% for i=1:la
%     for k=1:N-1
%         
%         [t,y]=ode45(@Chua2,[0 50],Xini);
%         count=find(t>30);
%         y=y(count,:); 
%         j = 1; 
%         n = length(y(:,1));  % find the length of vector x1(x in our problem)
%         for l = 2:n-1 
%             % check for the min value in 1st column of sol matrix
%             if (y(l-1,1)+eps) < y(l,1) && y(l,1) > (y(l+1,1)+eps)
%                 xmax(i,j)=y(l,1); % Sorting the values of x1 in increasing order
%                 j=j+1; 
%             end 
%         end 
%         
%         if j>1
%             plot(alpha(i),xmax(i,1:j-1),'b.','MarkerSize',2); 
%         end
%         
% %         if k>0.6*N && (k+1)<=length(y)
% %             plot(alpha(i),y(k+1,1),'b.','MakerSize',2)
% %         end
%     end
%     
% end



        
        
        
