import numpy as np

dospi=2*np.pi
grav=1.0

class Pendulo:
    """ Una particula simplectica que empieca en algun lugar del
    intervalo 0 a 2*pi  y recibe patadas. """
    def __init__(self, init_q=0.719102,
                 init_p=0.181):
        self.init_q=init_q
        self.init_p=init_p
        self.q=self.init_q
        self.p=self.init_p

    def step(self, dt):
        self.p=self.p-grav*np.sin(self.q)*dt
        self.q=np.fmod(self.q+self.p*dt,dospi)
        if(self.q<-np.pi):
            self.q+=dospi
        if(self.q>np.pi):
            self.q-=dospi

            
numparticles=400
tmax=800
dt=0.01
archivo=open("EspacioFasePendulo02.dat", "w")


for i in range(1,numparticles):
    q=np.random.uniform(0, dospi)
    p=np.random.uniform(-2.0, 2.0)
    Punto=Pendulo(q,p)
    Energia=p*p/2-grav*np.cos(q)
    for j in range(1,tmax):
        Punto.step(dt)
        print(Punto.q, Punto.p, j, Energia, file=archivo)
        
    print("", file=archivo)
    
        
archivo.close()
