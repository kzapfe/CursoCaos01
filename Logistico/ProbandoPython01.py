from __future__ import division

def T(x,k):
    """Este es el mapeo logistico"""
    result=k*x*(1-x)
    return result

#alredo


pruebas=100
k=3.6
x=0.17826781

f1=open('./Logistico.dat', 'w+')

for j in range(1,pruebas):
    xaux=x
    x=T(x,k)
    print >>f1,  xaux,x

import numpy as np
 

f2=open('./Compuesto.dat', 'w+')

def G(x,k):
    """Este es el rescalamiento"""
    xc=1-1/k
    result=x*(1-2*xc)+xc
    return result

def Ginv(x,k): 
    xc=1-1/k    
    result=x*1./(1.-2*xc)-xc/(1.-2*xc)
    return result

print ""

for j in range(1,pruebas):
    xanterior=x
    x=G(x,k)
    x=T(T(x,k),k)
    x=Ginv(x,k)
    print >>f2, xanterior,x
