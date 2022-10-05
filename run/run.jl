using CSV
using DataFrames

include("../lib/MFGS.jl")
using .MFGS

# prma = 2.0, 0.001, 10.0
# prmb = 2.0, 0.001, 1.0

# prm = LorPrm1D(2.0, 0.001, 10.0) 
# prm = LorPrm2D(2.0, 0.001, 10.0, 2.0, 0.001, 10.0) 
prm = LorPrm3D(2.0, 0.001, 10.0, 2.0, 0.001, 10.0, 2.0, 0.001, 10.0) # Lorentzian parameters
# ang =  CouplAng1D(0.0, 0.0) # Coupling angles
# ang =  CouplAng2D(π/2, 0.0, 0.0, 0.0) # Coupling angles
ang =  CouplAng3D(π/2, 0.0, π/2, π/2, 0.0, 0.0) # Coupling angles

### Temperature Range ###
T = exp10.(range(-2, 3, length=2));

### z-Magnetisations ###
magx_list = [magx(i, ang, prm) for i in T]
magy_list = [magy(i, ang, prm) for i in T]
magz_list = [magz(i, ang, prm) for i in T]

### Store Values ###
df = DataFrame(hcat(T, magz_list, magy_list, magz_list), :auto)
CSV.write("C://Users//crh222//Data//RC//Classical//MFGS_3D_prma.csv",  df, header = ["T", "sx", "sy", "sz"])