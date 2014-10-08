# Programa funcion de Julia para hacer el conjunto de Cantor Tripartito.
#the Cantor set is a totally disconnected perfect compact metric space. Indeed, in a sense it is the only one: every nonempty totally disconnected perfect compact metric space is homeomorphic to the Cantor set


#Al parecer Julia numera los arrays desde 1... no como c y esos...

type intervalo
    principio::Float64
    longitud::Float64
   # function fin()
   #     this=new()
   #     final=principio+longitud
   #     return final
   # end
end


function Tripartir(x::intervalo)
    long=x.longitud/3
    xnew1=intervalo(x.principio,long)
    xnew2=intervalo(x.principio+2*long,long)
    result=[xnew1,xnew2]
    return result
end

function flat(A)
    result = {}
    grep(a) = for x in a 
        isa(x,Array) ? grep(x) : push!(result,x)
    end
    grep(A)
    result
end
 

chanfles=intervalo(0,1)

println(chanfles.principio,"\t", chanfles.longitud)

curro=Tripartir(chanfles)

println(typeof(curro))

for j in curro
   # println(typeof(j))
    println(j.principio,"\t", j.longitud)
end

a=Array(intervalo,1)
iter=1


clunchis=map(Tripartir,curro)

println(typeof(clunchis))

for j in curro
    j=Tripartir(j)
    a=vcat(a,j)
   # println(typeof(j))
end

println(typeof(a), "\t", length(a))

for j in a
    #println(typeof(j))
    println("muak")
   # println(iter,"\t", j.principio,"\t", j.principio+j.longitud)
end

#def PartirIntervalo(inter):
#    com=inter[0]
#    fin=inter[1]
#    longitud=fin-com
    
              
