function mapeo(x,k)
    result=k*x*(1.-x)
    return result
end

maxcasos=1000
maxiter=400
maxprints=16

xini=0.28347928
kmin=1.
kmax=4.0


for j=1:maxcasos
    
    k=kmin+j*(kmax-kmin)/maxcasos
    x=xini
    
    for n=1:maxiter
        x=mapeo(x,k)
    end

    for n=1:maxprints
        x=mapeo(x,k)
        println(k,"\t",x)
    end

    println("\t")

end
