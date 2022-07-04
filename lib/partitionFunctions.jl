##############################
#### paritionFunctions.jl ####
##############################

function 𝒵s(T, ang::CouplingAngles, prm::Lorentzian)
    I(θ, ϕ) = sin(θ)*exp(-BigFloat((1/T)*Heff(θ, ϕ, ang, prm)))
    return dblquadgk(I, [0.0, 0.0], [π, 2π])
end