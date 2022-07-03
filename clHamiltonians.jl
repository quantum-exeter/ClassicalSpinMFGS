###########################
#### clHamiltonians.jl ####
###########################

### Reorganisation Energy ###
Q(prm::LorPrm) = (prm.α*ωL)/(2*prm.ω0^2)

# Effective Hamiltonians ##
Heff1D(θ, ϕ, ang1::CouplingAngles, prm1::LorPrm) = -sign(γ)*sz(θ) - Q(prm1)*sc(θ, ϕ, ang1)^2
Heff2D(θ, ϕ, ang1::CouplingAngles, ang2::CouplingAngles, prm1::LorPrm, prm2::LorPrm) = -sign(γ)*sz(θ) - Q(prm1)*sc(θ, ϕ, ang1)^2 - Q(prm2)*sc(θ, ϕ, ang2)^2
Heff3D(θ, ϕ, ang1::CouplingAngles, ang2::CouplingAngles, ang3::CouplingAngles, prm1::LorPrm, prm2::LorPrm, prm3::LorPrm) = -sign(γ)*sz(θ) - Q(prm1)*sc(θ, ϕ, ang1)^2 - Q(prm2)*sc(θ, ϕ, ang2)^2 - Q(prm3)*sc(θ, ϕ, ang3)^2