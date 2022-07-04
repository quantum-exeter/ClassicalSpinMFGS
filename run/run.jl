using CSV
using DataFrames

include("../lib/MFGS.jl")
using .MFGS

prm = LorPrm1D(2, 5, 10)
ang =  CouplAng1D(π/2, 0.0)

### Temperature Range ###
T = exp10.(range(-2, 3, length=100));

### z-Magnetisations ###
magz_list = [magz(i, ang, prm) for i in T]

### Store Values ###
df = DataFrame(hcat(T, magz_list), :auto)
CSV.write("C://Users//crh222//Data//Classical//test.csv",  df, header = ["T", "sz"]);