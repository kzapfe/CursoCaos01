#Triple quotes mean doc string
""" Guion de python para jugar con el mapeo exponencial"""

import sys
import numpy as np

if len(sys.argv)<2:
    print ("Uso: poner numero de iteraciones y numero de variaciones de k")
    print ("python MapeoExponencial01.py <tmax> <cuantos-k>")
    sys.exit("hazlo bien la proxima vez")
    
def mapeo(x,k):
    return x*k

#El numero de iteraciones es el primer argumento despues del nombre
tmax=int(sys.argv[1])
#El numero de variantes de k es el segundo argumento despues del guion
pruebas=int(sys.argv[2])
xini=0.132997161
#asi se abre un archivo en python
archivo=open("Datos01.dat", 'w+')

#anidamos dos bucles, uno sobre la constante k
for j in range(1,pruebas):
    k=float(j)/pruebas+0.5
    x=xini    
   #y el otro sobre el tiempo
    for n in range(0,30):
        x=mapeo(x,k);
     
    print(k,x,xini,file=archivo)
#Como pueden notar, python separa los bucles POR INDENTACION.
#aqui la indentacion no es cuestion de gusto personal, es PARTE de la sintaxis.

    
