using CSV
using DataFrames

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
# prm = LorPrm1D(2., 0.6, 1.) 
# prm = LorPrm2D(2., 0.001, 10., 2., 0.001, 10.) 
prm = LorPrm3D(2., 0.6, 1., 2., 0.6, 1., 2., 0.6, 1.) # Lorentzian parameters
# ang =  CouplAng1D(π/4, 0.0) # Coupling angles
# ang =  CouplAng2D(π/2, 0.0, π/2, π/2) # Coupling angles
ang =  CouplAng3D(π/2, 0.0, π/2, π/2, 0.0, 0.0) # Coupling angles

### Temperature Range ###
T = exp10.(range(-2, 3, length=100));

### z-Magnetisations ###
magx_list = [magx(i, ang, prm) for i in T]
magy_list = [magy(i, ang, prm) for i in T]
magz_list = [magz(i, ang, prm) for i in T]

### Store Values ###
df = DataFrame(hcat(T, magx_list, magy_list, magz_list), :auto)
CSV.write("C://Users//crh222//ClassicalSpinMFGS//paper_data//cl_MFGS_3D_prme.csv",  df, header = ["T", "sx", "sy", "sz"])