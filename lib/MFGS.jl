#################
#### MFGS.jl ####
#################

module MFGS

    using LinearAlgebra
    using Kronecker
    using QuadGK

    export LorPrm1D, LorPrm2D, LorPrm3D, CouplAng1D, CouplAng2D, CouplAng3D, mag

    include("variables.jl")
    include("spinComponents.jl")
    include("hamiltonians.jl")
    include("integration.jl")
    include("partitionFunctions.jl")
    include("magnetisation.jl")

end