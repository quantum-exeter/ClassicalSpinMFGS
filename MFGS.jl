#################
#### MFGS.jl ####
#################

module MFGS

    using LinearAlgebra
    using Kronecker
    using QuadGK

    export LorPrm, CouplingAngles, ωL, mag1D, mag2D, mag3D

    include("types.jl")
    include("clVariables.jl")
    include("spinComponents.jl")
    include("clHamiltonians.jl")
    include("integration.jl")
    include("partitionFunctions.jl")
    include("magnetisation.jl")

end