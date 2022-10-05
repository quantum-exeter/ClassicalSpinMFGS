##########################
#### magnetisation.jl ####
##########################

function magx(T, ang::CouplingAngles, prm::Lorentzian)
  𝒵 = 𝒵s(T, ang, prm)
  H(θ, ϕ) = Heff(θ, ϕ, ang, prm)
  I(θ, ϕ) = sx(θ, ϕ)*(1/𝒵)*exp(-(1/T)*H(θ, ϕ))*sin(θ)
  return dblquadgk(I, [0.0, 0.0], [π, 2π])
end

function magy(T, ang::CouplingAngles, prm::Lorentzian)
  𝒵 = 𝒵s(T, ang, prm)
  H(θ, ϕ) = Heff(θ, ϕ, ang, prm)
  I(θ, ϕ) = sy(θ, ϕ)*(1/𝒵)*exp(-(1/T)*H(θ, ϕ))*sin(θ)
  return dblquadgk(I, [0.0, 0.0], [π, 2π])
end

function magz(T, ang::CouplingAngles, prm::Lorentzian)
  𝒵 = 𝒵s(T, ang, prm)
  H(θ, ϕ) = Heff(θ, ϕ, ang, prm)
  I(θ, ϕ) = sz(θ)*(1/𝒵)*exp(-(1/T)*H(θ, ϕ))*sin(θ)
  return dblquadgk(I, [0.0, 0.0], [π, 2π])
end