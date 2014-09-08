c	Este programa escribe en un documento 
c	las coordenadas de la trayectoria de una condición inicial dada
c	despues de cierta cantidad de iteraciones del mapeo logístico.
	
c 	En Fortran es necesario una "subrutina" para
c	usar funciones que admitan variables reales 

c	Primero, especificamos el nombre de la función, 
c	en este caso se llama fx, y el nombre de su variable, x0
c	En el programa principal debemos respetar estos nombres
	function fx(x0)
c	con la siguiente linea, tanto la función como la variable serán de tipo real
c	asignandoles más espacio en la memoria (más cifras decimales)	
c	pues las letras f y x están dentro de los intervalos escritos
	implicit double precision (a-h,o-z)
c	el parámetro r de la función
	r=3.5
c	declaramos nuestra función con el parámetro r antes escrito	
	fx=r*x0*(1-x0)
c	este return es una especie de "go to". Permite a nuestra subrutina
c	ser llamada desde el programa principal	
	return
c	fin de la subrutina	
	end
	
c	Iniciamos el programa principal donde haremos el seguimiento
c	de alguna condición inicial tras ser iterada 20 veces	

	program cob_web	
c	igualmente, nuestras variables de la a-h y de la o-z
c	serán reales con más cifras decimales en la memoria	
	implicit double precision (a-h,o-z)	
c	abrimos el documento donde escribiremos las coordenadas de la condición
c	inicial tras las iteraciones	
	open(15,file="cob_web.dat",status="replace")
c	nuestra condición inicial x0	
	x0=0.6
c	escribimos la condición inicial en nuestro documento en una columna
c	y un cero en la otra, esto con el fin de tener la coordenada (x0,0)
c	así al plotear el documento, veremos donde inicia el recorrido	
	write(15,*) x0,0
c	esta es la imagen de la condición inicial, llamamos por primera vez
c	a nuestra subrutina, renombrandola con una variable f0	
	f0=fx(x0)
c	la escribimos en nuestro archivo, siendo la coordenada (x0,f0)
	write(15,*) x0,f0
c	comenzamos las iteraciones del mapeo logístico, es decir
c	f^n(x)=f(f(f...(f(x))))	
c	solo haremos 20 iteraciones, podrían ser más
	do j=1,20 
c	la imagen de la primera condición inicial, f0=f(x0) ahora será
c	la nueva variable de la función logistica, es decir, f1=f(f0)	
	 x0=f0
c	aqui igualamos a la imagen de la función f con la identidad	 
	 g=f0
c	aquí se hace la iteración una y otra vez, f^n(x)=f(f(f...(f(x))))		 
	 f0=fx(x0)
c	como el orden importa, sabemos que para generar el "caracol"
c	primero dibujamos una linea que va desde la condición inicial hasta
c	la imagen inicial, eso ya lo escribimos en los 2 writes de arriba
c	luego, trazamos una linea desde la primera imagen hasta la identidad
c	eso lo escribimos de la siguiente forma:	 
	 write(15,*) x0,g
c	y al final de la identidad regresamos a la función kx(1-x):	 
	 write(15,*) x0,f0
c	el proceso se repite 20 veces
	end do
c	de esta manera, generamos un programa que escribe en un documento 
c	las coordenadas de la trayectoria de una condición inicial dada
c	despues de cierta cantidad de iteraciones del mapeo logístico	
	end program
	
c	Para graficar en gnuplot:
c	f(x)=x
c	g(x)=3.5*x*(1-x)
c	set origin 0,0
c	set xrange [0:1]	
c	set yrange [0:1]
c	set size 0.7,1
c	plot 'cob_web.dat' w lines, f(x), g(x)