using MKL
using CSV
using DataFrames
using ProgressMeter

include("../lib/MFGS.jl")
using .MFGS

### Parameters ###

## Lorentzian spectral density ##
# {ω_0, Γ, α}
#prma = 2., 0.001, 10.
#prmb = 2., 0.001, 1. 
#prmc = 2., 0.001, 0.1 

#prmd = 2., 0.6, 10.
#prme = 2., 0.6, 1.
#prmf = 2., 0.6, 0.1

#prmg = 2., 0.6, 20.
#prmh = 2., 0.6, 60.
#prmi = 2., 0.6, 80.
#prmj = 2., 0.6, 500.
#prmk = 2., 0.6, 1000.

prm = LorPrm1D(2., 0.6, 10.) 
# prm = LorPrm2D(2., 0.6, 10., 2., 0.6, 10.) 
# prm = LorPrm3D(2., 0.6, 10., 2., 0.6, 10., 2., 0.6, 10.)

## Coupling angles ##
ang =  CouplAng1D(atan(sqrt(2)), π/4)
# ang =  CouplAng2D(π/2, 0.0, π/2, π/2)
# ang =  CouplAng3D(π/2, 0.0, π/2, π/2, 0.0, 0.0)

### Temperature range ###
T = exp10.(range(-3, 2, length=200));

### Gibbs state spin values ###

## Initialise lists ##
sxGS_list = zeros(length(T))
syGS_list = zeros(length(T))
szGS_list = zeros(length(T))

@showprogress for i in eachindex(T)
    sxGS_list[i] = magGx(big(T[i]))
    syGS_list[i] = magGy(big(T[i]))
    szGS_list[i] = magGz(big(T[i]))
end

### MF state spin values ###

## Initialise lists ##
sxMFGS_list = zeros(length(T))
syMFGS_list = zeros(length(T))
szMFGS_list = zeros(length(T))

@showprogress for i in eachindex(T)
    sxMFGS_list[i] = magx(big(T[i]), ang, prm)
    syMFGS_list[i] = magy(big(T[i]), ang, prm)
    szMFGS_list[i] = magz(big(T[i]), ang, prm)
end

### Store values ###
dfGibbs = DataFrame(hcat(T, sxGS_list, syGS_list, szGS_list), :auto)
df = DataFrame(hcat(T, sxMFGS_list, syMFGS_list, szMFGS_list), :auto)

### Export ###
CSV.write("./paper_data/filename.csv",  dfGibbs, header = ["T", "sxGS", "syGS", "szGS"])
CSV.write("./paper_data/filename.csv",  df, header = ["T", "sxMFGS", "syMFGS", "szMFGS"])