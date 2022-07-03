#################
#### MFGS.jl ####
#################

module MFGS

    using LinearAlgebra
    using Kronecker
    using QuadGK

    export LorPrm, CouplingAngles, ωL, mag1D, mag2D, mag3D

    include("variables.jl")
    include("spinComponents.jl")
    include("hamiltonians.jl")
    include("integration.jl")
    include("partitionFunctions.jl")
    include("magnetisation.jl")

end