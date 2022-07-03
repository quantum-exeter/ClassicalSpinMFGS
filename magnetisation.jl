##########################
#### magnetisation.jl ####
##########################

function mag1D(T, ang1::CouplingAngles, prm1::LorPrm)
  𝒵 = 𝒵s1D(T, ang1, prm1)
  H(θ_, ϕ_) = Heff1D(θ_, ϕ_, ang1, prm1)
  I(θ_, ϕ_) = sin(θ_)*cos(θ_)*(1/𝒵)*exp(-(1/T)*H(θ_, ϕ_))
  return dblquadgk(I, [0.0, 0.0], [π, 2π])
end

function mag2D(T, ang1::CouplingAngles, ang2::CouplingAngles, prm1::LorPrm, prm2::LorPrm)
  𝒵 = 𝒵s2D(T, ang1, ang2, prm1, prm2)
  H(θ_, ϕ_) = Heff2D(θ_, ϕ_, ang1, ang2, prm1, prm2)
  I(θ_, ϕ_) = sin(θ_)*cos(θ_)*(1/𝒵)*exp(-(1/T)*H(θ_, ϕ_))
  return dblquadgk(I, [0.0, 0.0], [π, 2π])
end

function mag3D(T, ang1::CouplingAngles, ang2::CouplingAngles, ang3::CouplingAngles, prm1::LorPrm, prm2::LorPrm, prm3::LorPrm)
  𝒵 = 𝒵s3D(T, ang1, ang2, ang3, prm1, prm2, prm3)
  H(θ_, ϕ_) = Heff3D(θ_, ϕ_, ang1, ang2, ang3, prm1, prm2, prm3)
  I(θ_, ϕ_) = sin(θ_)*cos(θ_)*(1/𝒵)*exp(-(1/T)*H(θ_, ϕ_))
  return dblquadgk(I, [0.0, 0.0], [π, 2π])
end