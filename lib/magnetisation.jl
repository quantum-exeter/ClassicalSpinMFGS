##########################
#### magnetisation.jl ####
##########################

function mag(T, ang::CouplingAngles, prm::Lorentzian)
  𝒵 = 𝒵s(T, ang, prm)
  H(θ, ϕ) = Heff(θ, ϕ, ang, prm)
  I(θ, ϕ) = sin(θ)*cos(θ)*(1/𝒵)*exp(-(1/T)*H(θ, ϕ))
  return dblquadgk(I, [0.0, 0.0], [π, 2π])
end