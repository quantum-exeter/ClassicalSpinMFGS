###########################
#### spinComponents.jl ####
###########################

### Types ###
abstract type CouplingAngles end

struct CouplAng1D{T<:Real} <: CouplingAngles
    θ1::T
    ϕ1::T
end

struct CouplAng2D{T<:Real} <: CouplingAngles
    θ1::T
    ϕ1::T
    θ2::T
    ϕ2::T
end

struct CouplAng3D{T<:Real} <: CouplingAngles
    θ1::T
    ϕ1::T
    θ2::T
    ϕ2::T
    θ3::T
    ϕ3::T
end

### Spin Components ###
sx(θ, ϕ) = sin(θ)*cos(ϕ)
sy(θ, ϕ) = sin(θ)*sin(ϕ)
sz(θ) = cos(θ)

### Spin Couplings ###
scvect(θ, ϕ, ang::CouplAng1D) = [sx(θ, ϕ)*sin(ang.θ1)*cos(ang.ϕ1) + sy(θ, ϕ)*sin(ang.θ1)*cos(ang.ϕ1) + sz(θ)*cos(ang.θ1),
                                 0,
                                 0]
scvect(θ, ϕ, ang::CouplAng2D) = [sx(θ, ϕ)*sin(ang.θ1)*cos(ang.ϕ1) + sy(θ, ϕ)*sin(ang.θ1)*cos(ang.ϕ1) + sz(θ)*cos(ang.θ1),
                                 sx(θ, ϕ)*sin(ang.θ2)*cos(ang.ϕ2) + sy(θ, ϕ)*sin(ang.θ2)*cos(ang.ϕ2) + sz(θ)*cos(ang.θ2),
                                 0]
scvect(θ, ϕ, ang::CouplAng3D) = [sx(θ, ϕ)*sin(ang.θ1)*cos(ang.ϕ1) + sy(θ, ϕ)*sin(ang.θ1)*cos(ang.ϕ1) + sz(θ)*cos(ang.θ1),
                                 sx(θ, ϕ)*sin(ang.θ2)*cos(ang.ϕ2) + sy(θ, ϕ)*sin(ang.θ2)*cos(ang.ϕ2) + sz(θ)*cos(ang.θ2),
                                 sx(θ, ϕ)*sin(ang.θ3)*cos(ang.ϕ3) + sy(θ, ϕ)*sin(ang.θ3)*cos(ang.ϕ3) + sz(θ)*cos(ang.θ3)]