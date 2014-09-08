function Cob_web(k,x0,n)
%% Este programa grafica la �rbita de una condici�n inicial al ser
% iterado n veces el mapeo log�stico (x_i=k*x_i-1*(1-x_1-1)),
% siendo k un valor real positivo que representa la relaci�n entre 
% reproducci�n y mortandad de una poblaci�n(0<k<4), x0 la condici�n inicial
% de fracci�n de poblaci�n en un territorio (0<x0<1) y n el n�mero de iteraciones.
%% Escribimos el intervalo y el tama�o de salto, usamos este vector para
% graficar el mapeo log�stico y la funci�n identidad
x=[0:0.001:1];
% la aplicaci�n log�stica y la identidad.
f=k*x.*(1-x);
Id=x;
% graficamos ambas funciones y pedimos que se mantengan 
plot (x,f,'b',x,Id,'g');
hold on
% f0 ser� la imagen inicial y la renombramos, siendo f0=f(x0)
f0=k*x0.*(1-x0);
%% Creamos 2 vectores que ser�n los que nos ayudaran a graficar la �rbita
% por ahora tienen dimensi�n 2x1, para evitar problemas al graficar.
% x1 es el vector asociado al dominio de la �rbita y Y1 a la imagen
X1=zeros(2,1);
Y1=zeros(2,1);
% asignamos valores a las entradas, para tener las coordenadas (x0,0) y 
% (x0,f0) que son la primera parte de la trayectoria de la condici�n
% inicial
X1(1,1)=x0;
X1(2,1)=x0;
Y1(2,1)=f0;
% graficamos las coordenadas, siendo X1 el dominio y Y1 la imagen, con
% formato de linea continua, cruces en las coordenadas y color rojo
plot (X1,Y1,'-xr');
hold on
%% Generamos un men� interactivo para poder visualizar la animaci�n
o=questdlg('Empezar animacion ahora?','Mensaje de control','si','no','si');
if strcmp(o,'si');
%% Aqu� generamos las dem�s coordenadas de la �rbita de la condici�n inicial
% comenzamos las iteraciones del mapeo log�stico, es decir
% f^n(x)=f(f(f...(f(x))))	
    for i=2:n+2
%% la imagen de la primera condici�n inicial, f0=f(x0) ahora ser�
% la nueva variable de la funci�n logistica, es decir, f1=f(f0)	    
        x0=f0;
% aqui igualamos a la imagen de la funci�n f con la identidad	         
        g=f0;
% aqu� se hace la iteraci�n f_n=f(f_n-1)
        f0=k*x0.*(1-x0);
% obtenidos los valores de las coordenas, se las asignamos a los vectores
% correspondientes. 
%% Se crean nuevas entradas impares para las coordenadas
% (x,g), es decir, las intersecciones con la identidad. Como ya tenemos las
% dos primeras entradas de los vectores, comenzamos a partir de 3, por eso
% i=2 en un principio, como ya se mencion�
        X1(2*i-1,1)=x0;
        Y1(2*i-1,1)=g;
        plot (X1,Y1,'-xr');
%% Se crean nuevas entradas pares para las coordenadas (x,f), es decir, 
% las subsecuentes intersecciones con la funci�n k*x*(1-x). Comenzamos en 4
        X1(2*i,1)=x0;
        Y1(2*i,1)=f0;
        plot (X1,Y1,'-xr');
%% se grafican ambas coordenadas en cada iteraci�n y con pause se da la 
% velocidad de la animaci�n         
        pause(1);
        hold on
    end
   
end
