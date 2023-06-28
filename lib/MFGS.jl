module MFGS

    ### Import packages ###
    using LinearAlgebra
    using Kronecker
    using QuadGK

     ### Inclusions ###
    include("variables.jl")
    include("spinComponents.jl")
    include("hamiltonians.jl")
    include("integration.jl")
    include("partitionFunctions.jl")
    include("magnetisation.jl")

    ####################################
    ####################################
    ####################################

    ### Exports ###
    export LorPrm1D, LorPrm2D, LorPrm3D, CouplAng1D, CouplAng2D, CouplAng3D, sxGibbs, syGibbs, szGibbs, sx, sy, sz

end