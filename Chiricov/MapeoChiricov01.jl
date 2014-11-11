# Mapeo de Chirikov en Julia. Veamos si aprendes a graficar en tiempo REAL

const k=1.17632

function patada(q,p)
    p=mod2pi(p+k*sin(q))
    q=mod2pi(q+p)
    return q,p
end

q=pi

tmax=600
condiciones=400

Puntos=open("PuntosMapeo01.dat","w")

for j=1:condiciones

    p=j/condiciones*2*pi
    
    for t=1:tmax
        q,p=patada(q,p)
        #El primer argumento de println es el archivo de datos
        println(Puntos, q,"\t",p,"\t",j,"\t",t)

    end

end

close(Puntos)

variedades=open("VariedadesInestables01.dat", "w")

lambdamas=(2+k+sqrt(4*k+k*k))/2
lambdamenos=(2+k-sqrt(4*k+k*k))/2

qzero=0.0
pzero=0.0

deltaq=0.01
deltap=deltaq*k/(lambdamas-1)

tmax=15
condiciones=20000


for j=1:condiciones

    q=qzero+deltaq*(j/condiciones)
    p=pzero+deltap*(j/condiciones)
    
    for t=1:tmax
        q,p=patada(q,p)
        #El primer argumento de println es el archivo de datos
        println(variedades, q,"\t",p,"\t",j,"\t",t)

    end

end
