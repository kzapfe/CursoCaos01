""" Mapeo de Chirikov version 01."""

import numpy as np

dospi=2*np.pi

class Particula:
    """ Una particula simplectica que empieca en algun lugar del
    intervalo 0 a 2*pi  y recibe patadas. """
    def __init__(self, init_q=0.719102,
                 init_p=0.181,
                 konst=0.153921):
        self.init_q=init_q
        self.init_p=init_p
        self.konst=konst
        self.q=self.init_q
        self.p=self.init_p

    def step(self):
        self.p=self.p+self.konst*np.sin(self.q)
        self.q=np.fmod(self.q+self.p,dospi)
        if(self.q<0):
            self.q+=dospi

numparticles=200
tmax=200

for i in range(1,numparticles):

    q=np.random.uniform(0, dospi)
    p=np.random.uniform(-1.0, 1.0)
    Punto=Particula(q,p)
    
    for j in range(1,tmax):
        Punto.step()
        print(Punto.q, Punto.p, j, i)

    print("")
    print("")


        
