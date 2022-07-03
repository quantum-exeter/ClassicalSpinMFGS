###########################
#### spinComponents.jl ####
###########################

### Spin Components ###
sx(θ, ϕ) = sin(θ)*cos(ϕ)
sy(θ, ϕ) = sin(θ)*sin(ϕ)
sz(θ) = cos(θ)

### Spin Coupling Operators ###

struct CouplingAngles
    θ
    ϕ
end

sc(θ, ϕ, ang::CouplingAngles) = sx(θ, ϕ)*sin(ang.θ)*cos(ang.ϕ) + sy(θ, ϕ)*sin(ang.θ)*cos(ang.ϕ) + sz(θ)*cos(ang.θ)