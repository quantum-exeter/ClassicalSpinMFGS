###########################
#### clHamiltonians.jl ####
###########################

### Reorganisation Energies ###
Q1 = (α1*ωL)/(2*ω01^2)
Q2 = (α2*ωL)/(2*ω02^2)
Q3 = (α3*ωL)/(2*ω03^2)

# Effective Hamiltonians ##
Heff1D(θ, ϕ) = -sign(γ)*sz(θ) - Q1*s1(θ, ϕ)^2
Heff2D(θ, ϕ) = -sign(γ)*sz(θ) - Q1*s1(θ, ϕ)^2 - Q2*s2(θ, ϕ)^2
Heff3D(θ, ϕ) = -sign(γ)*sz(θ) - Q1*s1(θ, ϕ)^2 - Q2*s2(θ, ϕ)^2 - Q3*s3(θ, ϕ)^2