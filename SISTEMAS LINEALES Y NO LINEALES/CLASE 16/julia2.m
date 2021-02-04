function julia2(Xmin,Xmax,Ymin,Ymax,maxIter,N,color)
%julia2(-1,1,-1,1,50,500,'spring')
%julia2(-0.5,0.5,-0.5,0.5,50,500,'cool')


x=linspace(Xmin,Xmax,N);
y=linspace(Ymin,Ymax ,N);
[Xf,Yf]=meshgrid(x,y);
for kx=1:N
    for ky=1:N
    Mf(kx,ky)=colorJulia(x(kx), y(ky), maxIter);
    end;
end;
 
figure
surface(Xf,Yf,Mf);
%surface(Mf)
shading interp 
colormap(color)


function contador=colorJulia(x,y,maxIter)
z = x + i*y; 
contador = 0;

while (Escape(z)==1) && (contador < maxIter)
z = funcion_graficar(z); 
contador=contador+1;
end;

function condicion=Escape(z)
if (abs(imag(z))<50)
    condicion=1;
else
    condicion=0;
end;

function  eval_z=funcion_graficar(z)
% Se puede modificar número comple que se le suma a Z^2
%c=-0.7269+0.1889*i;
%c=0.5+0.2*i;
c=(-0.835-0.2321*i);

eval_z=z^2+(c);


