include("../lib/MFGS.jl")
using .MFGS

prm = LorPrm1D(7, 5, 10)
ang =  CouplAng1D(π/2, 0.0)

mag(1.0, ang, prm)