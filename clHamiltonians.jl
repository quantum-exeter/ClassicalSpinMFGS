###########################
#### clHamiltonians.jl ####
###########################

include("clVariables.jl")
include("spinComponents.jl")

### Reorganisation Energies ###
Q1 = (α1*ωL)/(2*ω01^2)
Q2 = (α2*ωL)/(2*ω02^2)
Q3 = (α3*ωL)/(2*ω03^2)

# Effective Hamiltonians ##
Heff1D(θ, ϕ) = -sign(γ)*sz(θ) - Q1*s1(θ, ϕ)^2
Heff2D(θ, ϕ) = -sign(γ)*sz(θ) - Q1*s1(θ, ϕ)^2 - Q2*s2(θ, ϕ)^2
Heff3D(θ, ϕ) = -sign(γ)*sz(θ) - Q1*s1(θ, ϕ)^2 - Q2*s2(θ, ϕ)^2 - Q3*s3(θ, ϕ)^2

function Heff(dim, θ, ϕ)
    if dim == 1
        return Heff1D(θ, ϕ)
    elseif dim == 2
        return Heff2D(θ, ϕ)
    elseif dim == 3 
        return Heff3D(θ, ϕ)
    else
        print("Please return a dimension of either 1, 2 or 3.")
    end
end