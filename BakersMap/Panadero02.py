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


#----------------------------------------------------------
def MapeoInverso(x,y):
    """ el mapeo del panadero, usando pasos auxiliares"""
    #Para invertir, solo cambiare el papel de x y y.
    #Tal ves sea mejor definirlo como Mapeo(y,x)=: MapeoInv(x,y)
    yprima=2*y
    xprima=x/2
    if (yprima > 1) :
        yprima=yprima-1
        xprima=xprima+0.5
        
    y=yprima
    x=xprima
    return x,y

# -----------------------------------------------------------
    




tmax=5
puntosmax=4000
datosf=open('PuntosVariedadInvarianteForward01.dat', 'w')
datosb=open('PuntosVariedadInvarianteBackward01.dat', 'w')
jmax=3


#El punto que esta en la frontera superior
xzero=0.2 #Punto MUY cercano a la variedad invariantes
yzero=0.2
alfa=xzero*yzero


for k in range(0, puntosmax):
    xini=xzero*(1+k/puntosmax)
    yini=yzero/(1+k/puntosmax)

    x=xini
    y=yini
    xback=x
    yback=y
    
    print(x,y, alfa,k,0, file=datosf)
    print(x,y, alfa,k,0, file=datosb)

    for t in range(0,tmax):
        x,y=Mapeo(x,y)
        xback,yback=MapeoInverso(xback,yback)
        print(x,y,alfa,k,t, file=datosf)
        print(xback,yback,alfa,k,t, file=datosb)
        
    

    
    
