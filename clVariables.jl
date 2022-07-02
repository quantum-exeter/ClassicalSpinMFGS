########################
#### clVariables.jl ####
########################

γ = -1 # Gyronmagnetic ratio
Bext = 10 # External magnetic field
ωL = abs(γ)*Bext # Larmor frequency
s0 = 1/2 # Spin size

###  Lorentzian Parameters Sets ###
prma = [1.4 0.001 10]
prmb = [7 0 50]
prmc = [0.014 0 0.1]
prmd = [1.4 0 10000]
prme = [2 0.001 10]
prmf = [2 0.001 1]
prmg = [2 0.001 50]
prm5 = [7 5 100]

prm1 = prm5; # Change the RHS here to change parameter set for coupling direction 1
prm2 = prm5; # Change the RHS here to change parameter set for coupling direction 2
prm3 = prm5; # Change the RHS here to change parameter set for coupling direction 3

ω01, Γ1, α1 = prm1*ωL
ω02, Γ2, α2 = prm2*ωL
ω03, Γ3, α3 = prm3*ωL