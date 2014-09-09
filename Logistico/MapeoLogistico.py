#Triple quotes mean doc string
""" ejercicio autodidacta de python numerico 01: Mapeo Logistico"""


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
        
        
pruebas=10
qaux=0.0

for j in range(1,pruebas):
    Punto=ParticulaLogistica(0.201,(4.*j)/pruebas)
    #Punto=ParticulaLogistica(0.322, 2.7189)    
    #print(Punto.konst)
    print(Punto.q, qaux, j)
    
    for k in range(0,30):
        qaux=Punto.q
        Punto.step()
        print(qaux, qaux, j)
        print(qaux, Punto.q, j)
     
    print("")
    print("")

