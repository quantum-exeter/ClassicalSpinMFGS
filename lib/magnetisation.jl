##########################
#### magnetisation.jl ####
##########################

### sx component for Gibbs state at temperature T ###
function sxGibbs(T) 
  𝒵 = 𝒵Gs(T)
  H(θ, ϕ) = HS(θ)
  I(θ, ϕ) = sx(θ, ϕ)*(1/𝒵)*exp(-(1/T)*HS(θ))*sin(θ)
  return dblquadgk(I, [0.0, 0.0], [π, 2π], atol=1e-6)
end

### sy component for Gibbs state at temperature T ###
function syGibbs(T)
  𝒵 = 𝒵Gs(T)
  H(θ, ϕ) = HS(θ)
  I(θ, ϕ) = sy(θ, ϕ)*(1/𝒵)*exp(-(1/T)*HS(θ))*sin(θ)
  return dblquadgk(I, [0.0, 0.0], [π, 2π], atol=1e-6)
end

### sz component for Gibbs state at temperature T ###
function szGibbs(T)
  𝒵 = 𝒵Gs(T)
  H(θ, ϕ) = HS(θ)
  I(θ, ϕ) = sz(θ)*(1/𝒵)*exp(-(1/T)*HS(θ))*sin(θ)
  return dblquadgk(I, [0.0, 0.0], [π, 2π], atol=1e-6)
end

### sx component for MF state at temperature T ###
function sx(T, ang::CouplingAngles, prm::Lorentzian)
  𝒵 = 𝒵s(T, ang, prm)
  H(θ, ϕ) = Heff(θ, ϕ, ang, prm)
  I(θ, ϕ) = sx(θ, ϕ)*(1/𝒵)*exp(-(1/T)*H(θ, ϕ))*sin(θ)
  return dblquadgk(I, [0.0, 0.0], [π, 2π], atol=1e-6)
end

### sy component for MF state at temperature T ###
function sy(T, ang::CouplingAngles, prm::Lorentzian)
  𝒵 = 𝒵s(T, ang, prm)
  H(θ, ϕ) = Heff(θ, ϕ, ang, prm)
  I(θ, ϕ) = sy(θ, ϕ)*(1/𝒵)*exp(-(1/T)*H(θ, ϕ))*sin(θ)
  return dblquadgk(I, [0.0, 0.0], [π, 2π],  atol=1e-6)
end

### sz component for MF state at temperature T ###
function sz(T, ang::CouplingAngles, prm::Lorentzian)
  𝒵 = 𝒵s(T, ang, prm)
  H(θ, ϕ) = Heff(θ, ϕ, ang, prm)
  I(θ, ϕ) = sz(θ)*(1/𝒵)*exp(-(1/T)*H(θ, ϕ))*sin(θ)
  return dblquadgk(I, [0.0, 0.0], [π, 2π])
end