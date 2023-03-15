using MKL
using CSV
using DataFrames
using ProgressMeter

include("../lib/MFGS.jl")
using .MFGS

### Low Gamma ###
#prma = 2.0, 0.001, 10.0
#prmb = 2.0, 0.001, 1.0

### Weak ###
#prmc = 2.0, 0.001, 0.1

### High Gamma ###
#prmd = 2.0, 0.6, 10.0
#prme = 2.0, 0.6, 1.0

### Parameters ###
prm = LorPrm1D(2., 0.6, 10.) 
# prm = LorPrm2D(2., 0.001, 10., 2., 0.001, 10.) 
# prm = LorPrm3D(2., 0.6, 10., 2., 0.6, 10., 2., 0.6, 10.) # Lorentzian parameters
ang =  CouplAng1D(atan(sqrt(2)), π/4) # Coupling angles
# ang =  CouplAng2D(π/2, 0.0, π/2, π/2) # Coupling angles
# ang =  CouplAng3D(π/2, 0.0, π/2, π/2, 0.0, 0.0) # Coupling angles

### Temperature Range ###
T = exp10.(range(-3, 2, length=200));

### Gibbs Magnetisations ###

sxGS_list = zeros(length(T))
syGS_list = zeros(length(T))
szGS_list = zeros(length(T))

@showprogress for i in eachindex(T)
    sxGS_list[i] = magGx(big(T[i]))
    syGS_list[i] = magGy(big(T[i]))
    szGS_list[i] = magGz(big(T[i]))
end

### MFGS Magnetisations ###

sxMFGS_list = zeros(length(T))
syMFGS_list = zeros(length(T))
szMFGS_list = zeros(length(T))

@showprogress for i in eachindex(T)
    sxMFGS_list[i] = magx(big(T[i]), ang, prm)
    syMFGS_list[i] = magy(big(T[i]), ang, prm)
    szMFGS_list[i] = magz(big(T[i]), ang, prm)
end

### Store Values ###
dfGibbs = DataFrame(hcat(T, sxGS_list, syGS_list, szGS_list), :auto)
df = DataFrame(hcat(T, sxMFGS_list, syMFGS_list, szMFGS_list), :auto)

CSV.write("./paper_data/cl_Gibbs.csv",  dfGibbs, header = ["T", "sxGS", "syGS", "szGS"])
CSV.write("./paper_data/cl_MFGS_1D_prmd.csv",  df, header = ["T", "sxMFGS", "syMFGS", "szMFGS"])