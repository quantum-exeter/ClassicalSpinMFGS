##########################
#### magnetisation.jl ####
##########################

function magGx(T)
  𝒵 = 𝒵Gs(T)
  H(θ, ϕ) = HS(θ)
  I(θ, ϕ) = sx(θ, ϕ)*(1/𝒵)*exp(-(1/T)*HS(θ))*sin(θ)
  return dblquadgk(I, [0.0, 0.0], [π, 2π], atol=1e-6)
end

function magGy(T)
  𝒵 = 𝒵Gs(T)
  H(θ, ϕ) = HS(θ)
  I(θ, ϕ) = sy(θ, ϕ)*(1/𝒵)*exp(-(1/T)*HS(θ))*sin(θ)
  return dblquadgk(I, [0.0, 0.0], [π, 2π], atol=1e-6)
end

function magGz(T)
  𝒵 = 𝒵Gs(T)
  H(θ, ϕ) = HS(θ)
  I(θ, ϕ) = sz(θ)*(1/𝒵)*exp(-(1/T)*HS(θ))*sin(θ)
  return dblquadgk(I, [0.0, 0.0], [π, 2π], atol=1e-6)
end

function magx(T, ang::CouplingAngles, prm::Lorentzian)
  𝒵 = 𝒵s(T, ang, prm)
  H(θ, ϕ) = Heff(θ, ϕ, ang, prm)
  I(θ, ϕ) = sx(θ, ϕ)*(1/𝒵)*exp(-(1/T)*H(θ, ϕ))*sin(θ)
  return dblquadgk(I, [0.0, 0.0], [π, 2π], atol=1e-6)
end

function magy(T, ang::CouplingAngles, prm::Lorentzian)
  𝒵 = 𝒵s(T, ang, prm)
  H(θ, ϕ) = Heff(θ, ϕ, ang, prm)
  I(θ, ϕ) = sy(θ, ϕ)*(1/𝒵)*exp(-(1/T)*H(θ, ϕ))*sin(θ)
  return dblquadgk(I, [0.0, 0.0], [π, 2π],  atol=1e-6)
end

function magz(T, ang::CouplingAngles, prm::Lorentzian)
  𝒵 = 𝒵s(T, ang, prm)
  H(θ, ϕ) = Heff(θ, ϕ, ang, prm)
  I(θ, ϕ) = sz(θ)*(1/𝒵)*exp(-(1/T)*H(θ, ϕ))*sin(θ)
  return dblquadgk(I, [0.0, 0.0], [π, 2π])
end