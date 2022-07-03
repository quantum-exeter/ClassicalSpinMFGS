##############################
#### paritionFunctions.jl ####
##############################

function 𝒵s1D(T, ang1::CouplingAngles, prm1::LorPrm)
    I(θ_, ϕ_) = sin(θ_)*exp(-BigFloat((1/T)*Heff1D(θ_, ϕ_, ang1, prm1)))
    return dblquadgk(I, [0.0, 0.0], [π, 2π])
end

function 𝒵s2D(T, ang1::CouplingAngles, ang2::CouplingAngles, prm1::LorPrm, prm2::LorPrm)
    I(θ_, ϕ_) = sin(θ_)*exp(-BigFloat((1/T)*Heff2D(θ_, ϕ_, ang1, ang2, prm1, prm2)))
    return dblquadgk(I, [0.0, 0.0], [π, 2π])
end

function 𝒵s3D(T, ang1::CouplingAngles, ang2::CouplingAngles, ang3::CouplingAngles, prm1::LorPrm, prm2::LorPrm, prm3::LorPrm)
    I(θ_, ϕ_) = sin(θ_)*exp(-BigFloat((1/T)*Heff3D(θ_, ϕ_, ang1, ang2, ang3, prm1, prm2, prm3)))
    return dblquadgk(I, [0.0, 0.0], [π, 2π])
end