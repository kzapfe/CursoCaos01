#Triple quotes mean doc string
""" Mapeo Logistico: DIagrama de bifurcaciones y Constantes de Feigenbaum"""


import numpy as np

class ParticulaLogistica:
    """ Una particula logistica que empieza en algun lugar
    del intervalo unitario con un valor de la constante k"""
    def __init__(self,
                 init_q=0.816381,
                 konst=0.109923):
        self.init_q=init_q
        self.konst=konst
        self.patadas=0
        self.q=self.init_q

    def step(self):
        self.q=self.konst*self.q*(1.-self.q)
        self.patadas+=1
        
        
pruebas=4000

xinicial=0.28768613
qaux=0.0
terma=500
muestras=100
kmin=2.9
kmax=4
datos=open('Bifurcaciones01.dat', 'w')

for j in range(1,pruebas):
    konst=kmin+(kmax-kmin)*j/pruebas
    Punto=ParticulaLogistica(xinicial, konst)
    
    for k in range(0,terma):
        #primero termalizamos el asunto
        Punto.step()

    for k in range(0,muestras):
        Punto.step()
        print(konst, Punto.q, k, file=datos)



