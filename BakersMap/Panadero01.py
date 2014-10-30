"""El mapeo del Panadero sobre el cuadrado Unitario:
El proposito del presente programa es dibujar las variedades Invariantes"""

#----------------------------------------------------------
def Mapeo(x,y):
    """ el mapeo del panadero, usando pasos auxiliares"""
    xprima=2*x
    yprima=y/2
    if (xprima > 1) :
        xprima=xprima-1
        yprima=yprima+0.5
        
    x=xprima
    y=yprima
    return x,y

# -----------------------------------------------------------
    

tmax=6
puntosmax=1000
datos=open('PuntosPanadero', 'w')
jmax=3

for j in range(2, jmax):
    #El punto que esta en la frontera superior
    xzero=(j/jmax)/3.
    yzero=0.999999
    alfa=xzero*yzero
    
    for k in range(0, puntosmax):
        xini=xzero*(1+k/puntosmax)
        yini=yzero/(1+k/puntosmax)

        x=xini
        y=yini
        
        print(x,y, alfa,k,0, file=datos)
        
        for t in range(0,tmax):
            x,y=Mapeo(x,y)
            print(x,y,alfa,k,t, file=datos)
            
        print("", file=datos)
    

    
    
