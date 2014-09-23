function mapeo(x,k)
    # La transformacion logistica
    result=k*x*(1.-x)
    return result
end

function dT(x,k)
    # La derivada de la transformacion logistica
    result=k*(1-2*x)
    return result
end

maxcasos=9000 # Resolucion en el parametro logistico
maxiter=4096 # Iteraciones de "termalizacion"
maxprints=512 # Iteraciones para imprimir

xini=0.28347928 # x inicial
kmin=2.8 # k inicial
kmax=3.58 # k final

#archivos de datos
arbol=open("ArbolFeigenBaum01.dat", "w")
derivadas=open("Derivada1024-01.dat", "w")


for j=1:maxcasos
    
    k=kmin+j*(kmax-kmin)/maxcasos
    x=xini
    
    for n=1:maxiter
        x=mapeo(x,k)
    end

    derivada=1
    
    for n=1:maxprints
        x=mapeo(x,k)
        derivada*=dT(x,k) # Que estoy haciendo aqui?
        println(arbol, k,"\t",x)     
    end

    if(abs(derivada)>0.5) #Y que representa esta condicion?
        println(derivadas, k,"\t",derivada)
    end
    

end

close(arbol)
close(derivadas)
