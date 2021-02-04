function mandelbrotnew(centro,lado,maxIter,N,color)
%mandelbrotnew([-0.82,-0.19], 0.3, 40, 400,'winter')
%mandelbrotnew([-0.5,0],3, 40, 400,'winter')


Xmin= centro(1)-lado/2;
Xmax = centro(1)+lado/2;
Ymin = centro(2)-lado/2; 
Ymax = centro(2)+lado/2;
x=linspace(Xmin,Xmax,N);

y=linspace(Ymin,Ymax ,N);
[Xf,Yf]=meshgrid(x,y);
for kx=1:N
    for ky=1:N
    Mf(kx,ky)=colorMandel(x(kx), y(ky), maxIter);
    end;
end;
figure
surface(Xf,Yf,Mf);
shading interp 

colormap(color)

function contador=colorMandel(x,y,maxIter)
c = x + i*y; 
z = 0; 
contador = 0;
while ( (abs(z) < 2.0) && (contador < maxIter) )
z = z^2 + (c);
%z = z^6 + (c);
contador=contador+1;
end;


