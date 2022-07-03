include("../MFGS.jl")
using .MFGS

prms = LorPrm(7, 5, 10)

prm1 = prms # Change the RHS here to change parameter set for coupling direction 1
prm2 = prms # Change the RHS here to change parameter set for coupling direction 2
prm3 = prms # Change the RHS here to change parameter set for coupling direction 3

ang1 =  CouplingAngles(π/2, 0)
ang2 =  CouplingAngles(π/2, π/2)
ang3 =  CouplingAngles(0, 0)

mag1D(1.0, ang1, prm1)