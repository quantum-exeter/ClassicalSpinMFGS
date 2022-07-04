###########################
#### clHamiltonians.jl ####
###########################

### Reorganisation Energy ###
Q(prm::LorPrm) = (prm.α)/(2*prm.ω0^2)

# Effective Hamiltonians ##
Heff(θ, ϕ, ang1::CouplingAngles, prm1::LorPrm) = -sign(γ)*sz(θ) - Q(prm1)*sc(θ, ϕ, ang1)^2
Heff(θ, ϕ, ang1::CouplingAngles, prm1::LorPrm, ang2::CouplingAngles, prm2::LorPrm) = -sign(γ)*sz(θ) - Q(prm1)*sc(θ, ϕ, ang1)^2 - Q(prm2)*sc(θ, ϕ, ang2)^2
Heff(θ, ϕ, ang1::CouplingAngles, prm1::LorPrm, ang2::CouplingAngles, prm2::LorPrm, ang3::CouplingAngles, prm3::LorPrm) = -sign(γ)*sz(θ) - Q(prm1)*sc(θ, ϕ, ang1)^2 - Q(prm2)*sc(θ, ϕ, ang2)^2 - Q(prm3)*sc(θ, ϕ, ang3)^2