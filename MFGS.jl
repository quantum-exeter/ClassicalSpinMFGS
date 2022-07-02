#####################
#### MFGS.jl ####
#####################

module MFGS
    include("clHamiltonains.jl")
    include("partitionFunctions.jl")
    include("integration.jl")
    
    export magz

    function magz(dim, T)
      𝒵 = 𝒵s(dim, T)
        H(θ_, ϕ_) = Heff(dim, θ_, ϕ_)
        I(θ_, ϕ_) = sin(θ_)*cos(θ_)*(1/𝒵)*exp(-(1/T)*H(θ_, ϕ_))
     return dblquadgk(I, [0.0, 0.0], [π, 2π])
    end
    
end