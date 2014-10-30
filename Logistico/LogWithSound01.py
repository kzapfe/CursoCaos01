#Triple quotes mean doc string
""" Mapeo Logistico: DIagrama de bifurcaciones y Constantes de Feigenbaum
Con sonidp, porque porque no"""


import numpy as np
import time
from scipy.io.wavfile import write as writewav
from scipy.constants import pi

def OndaPlana(t, omega=440,fase=0):
    result=np.sin(omega*(t+fase)*2*pi)
    return result


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
        
        
pruebas=5000

xinicial=0.28768613
qaux=0.0
terma=500
muestras=200
kmin=2.9
kmax=4
datos=open('Bifurcaciones04.dat', 'w')
tolerancia=0.0005
soundata=[]
SampleRate=44100 #Muestreo por segundo
Samples=1764
HigherPitch=30000
basefreq=np.log(HigherPitch/20) #logaritmo del rango de la frecuancia de audicion humana

start_time=time.time()

for j in range(1,pruebas):
    konst=kmin+(kmax-kmin)*j/pruebas
    Punto=ParticulaLogistica(xinicial, konst)
    fases=[] #Una fase diferente para onda
    omega=[] #Una frecuencia diferente para cada Punto.q limite dado konst
    
    for k in range(0,terma):
        #primero termalizamos el asunto
        Punto.step()

    for k in range(0,muestras):
        Punto.step()
        print(konst, Punto.q, k, file=datos)
        omega.append(15*np.exp(basefreq*Punto.q))
        fases.append(np.modf(10*Punto.q)[0])

    for t in range(0, Samples):
        amplitud=0
        for k in range(0,muestras):       
            #amplitud+=OndaPlana(t/SampleRate*2*pi,omega[k],fases[k])
            amplitud+=OndaPlana(t/SampleRate*2*pi,omega[k])
        
        soundata.append(amplitud/muestras)

    print("vamos en la konstante", konst, "numero", j, "de" , pruebas)          
    
scaled = np.int16(soundata/np.max(np.abs(soundata)) * 32767)
writewav('CharagusquesPruebaLowerPitch.wav', 44100, scaled)

end_time=time.time()

tiempo=end_time - start_time

print (tiempo, " segundos nos tardamos  ---" )
