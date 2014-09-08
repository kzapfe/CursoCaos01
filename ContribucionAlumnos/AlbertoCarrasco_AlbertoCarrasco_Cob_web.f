c	Este programa escribe en un documento 
c	las coordenadas de la trayectoria de una condici�n inicial dada
c	despues de cierta cantidad de iteraciones del mapeo log�stico.
	
c 	En Fortran es necesario una "subrutina" para
c	usar funciones que admitan variables reales 

c	Primero, especificamos el nombre de la funci�n, 
c	en este caso se llama fx, y el nombre de su variable, x0
c	En el programa principal debemos respetar estos nombres
	function fx(x0)
c	con la siguiente linea, tanto la funci�n como la variable ser�n de tipo real
c	asignandoles m�s espacio en la memoria (m�s cifras decimales)	
c	pues las letras f y x est�n dentro de los intervalos escritos
	implicit double precision (a-h,o-z)
c	el par�metro r de la funci�n
	r=3.5
c	declaramos nuestra funci�n con el par�metro r antes escrito	
	fx=r*x0*(1-x0)
c	este return es una especie de "go to". Permite a nuestra subrutina
c	ser llamada desde el programa principal	
	return
c	fin de la subrutina	
	end
	
c	Iniciamos el programa principal donde haremos el seguimiento
c	de alguna condici�n inicial tras ser iterada 20 veces	

	program cob_web	
c	igualmente, nuestras variables de la a-h y de la o-z
c	ser�n reales con m�s cifras decimales en la memoria	
	implicit double precision (a-h,o-z)	
c	abrimos el documento donde escribiremos las coordenadas de la condici�n
c	inicial tras las iteraciones	
	open(15,file="cob_web.dat",status="replace")
c	nuestra condici�n inicial x0	
	x0=0.6
c	escribimos la condici�n inicial en nuestro documento en una columna
c	y un cero en la otra, esto con el fin de tener la coordenada (x0,0)
c	as� al plotear el documento, veremos donde inicia el recorrido	
	write(15,*) x0,0
c	esta es la imagen de la condici�n inicial, llamamos por primera vez
c	a nuestra subrutina, renombrandola con una variable f0	
	f0=fx(x0)
c	la escribimos en nuestro archivo, siendo la coordenada (x0,f0)
	write(15,*) x0,f0
c	comenzamos las iteraciones del mapeo log�stico, es decir
c	f^n(x)=f(f(f...(f(x))))	
c	solo haremos 20 iteraciones, podr�an ser m�s
	do j=1,20 
c	la imagen de la primera condici�n inicial, f0=f(x0) ahora ser�
c	la nueva variable de la funci�n logistica, es decir, f1=f(f0)	
	 x0=f0
c	aqui igualamos a la imagen de la funci�n f con la identidad	 
	 g=f0
c	aqu� se hace la iteraci�n una y otra vez, f^n(x)=f(f(f...(f(x))))		 
	 f0=fx(x0)
c	como el orden importa, sabemos que para generar el "caracol"
c	primero dibujamos una linea que va desde la condici�n inicial hasta
c	la imagen inicial, eso ya lo escribimos en los 2 writes de arriba
c	luego, trazamos una linea desde la primera imagen hasta la identidad
c	eso lo escribimos de la siguiente forma:	 
	 write(15,*) x0,g
c	y al final de la identidad regresamos a la funci�n kx(1-x):	 
	 write(15,*) x0,f0
c	el proceso se repite 20 veces
	end do
c	de esta manera, generamos un programa que escribe en un documento 
c	las coordenadas de la trayectoria de una condici�n inicial dada
c	despues de cierta cantidad de iteraciones del mapeo log�stico	
	end program
	
c	Para graficar en gnuplot:
c	f(x)=x
c	g(x)=3.5*x*(1-x)
c	set origin 0,0
c	set xrange [0:1]	
c	set yrange [0:1]
c	set size 0.7,1
c	plot 'cob_web.dat' w lines, f(x), g(x)