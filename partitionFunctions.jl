##############################
#### paritionFunctions.jl ####
##############################

include("integration.jl")
include("clHamiltonains.jl")

function 𝒵s(dim, T)
    I(θ_, ϕ_) = sin(θ_)*exp(-BigFloat((1/T)*Heff(dim, θ_, ϕ_)))
    return dblquadgk(I, [0.0, 0.0], [π, 2π])
end