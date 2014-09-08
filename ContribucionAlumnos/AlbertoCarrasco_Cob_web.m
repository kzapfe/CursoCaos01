function Cob_web(k,x0,n)
%% Este programa grafica la órbita de una condición inicial al ser
% iterado n veces el mapeo logístico (x_i=k*x_i-1*(1-x_1-1)),
% siendo k un valor real positivo que representa la relación entre 
% reproducción y mortandad de una población(0<k<4), x0 la condición inicial
% de fracción de población en un territorio (0<x0<1) y n el número de iteraciones.
%% Escribimos el intervalo y el tamaño de salto, usamos este vector para
% graficar el mapeo logístico y la función identidad
x=[0:0.001:1];
% la aplicación logística y la identidad.
f=k*x.*(1-x);
Id=x;
% graficamos ambas funciones y pedimos que se mantengan 
plot (x,f,'b',x,Id,'g');
hold on
% f0 será la imagen inicial y la renombramos, siendo f0=f(x0)
f0=k*x0.*(1-x0);
%% Creamos 2 vectores que serán los que nos ayudaran a graficar la órbita
% por ahora tienen dimensión 2x1, para evitar problemas al graficar.
% x1 es el vector asociado al dominio de la órbita y Y1 a la imagen
X1=zeros(2,1);
Y1=zeros(2,1);
% asignamos valores a las entradas, para tener las coordenadas (x0,0) y 
% (x0,f0) que son la primera parte de la trayectoria de la condición
% inicial
X1(1,1)=x0;
X1(2,1)=x0;
Y1(2,1)=f0;
% graficamos las coordenadas, siendo X1 el dominio y Y1 la imagen, con
% formato de linea continua, cruces en las coordenadas y color rojo
plot (X1,Y1,'-xr');
hold on
%% Generamos un menú interactivo para poder visualizar la animación
o=questdlg('Empezar animacion ahora?','Mensaje de control','si','no','si');
if strcmp(o,'si');
%% Aquí generamos las demás coordenadas de la órbita de la condición inicial
% comenzamos las iteraciones del mapeo logístico, es decir
% f^n(x)=f(f(f...(f(x))))	
    for i=2:n+2
%% la imagen de la primera condición inicial, f0=f(x0) ahora será
% la nueva variable de la función logistica, es decir, f1=f(f0)	    
        x0=f0;
% aqui igualamos a la imagen de la función f con la identidad	         
        g=f0;
% aquí se hace la iteración f_n=f(f_n-1)
        f0=k*x0.*(1-x0);
% obtenidos los valores de las coordenas, se las asignamos a los vectores
% correspondientes. 
%% Se crean nuevas entradas impares para las coordenadas
% (x,g), es decir, las intersecciones con la identidad. Como ya tenemos las
% dos primeras entradas de los vectores, comenzamos a partir de 3, por eso
% i=2 en un principio, como ya se mencionó
        X1(2*i-1,1)=x0;
        Y1(2*i-1,1)=g;
        plot (X1,Y1,'-xr');
%% Se crean nuevas entradas pares para las coordenadas (x,f), es decir, 
% las subsecuentes intersecciones con la función k*x*(1-x). Comenzamos en 4
        X1(2*i,1)=x0;
        Y1(2*i,1)=f0;
        plot (X1,Y1,'-xr');
%% se grafican ambas coordenadas en cada iteración y con pause se da la 
% velocidad de la animación         
        pause(1);
        hold on
    end
   
end
