#########################
#### hamiltonians.jl ####
#########################

### Types ###
abstract type Lorentzian end

struct LorPrm1D{T<:Real} <: Lorentzian
    ω01::T
    Γ1::T
    α1::T
end

struct LorPrm2D{T<:Real} <: Lorentzian
    ω01::T
    Γ1::T
    α1::T
    ω02::T
    Γ2::T
    α2::T
end

struct LorPrm3D{T<:Real} <: Lorentzian
    ω01::T
    Γ1::T
    α1::T
    ω02::T
    Γ2::T
    α2::T
    ω03::T
    Γ3::T
    α3::T
end

### Reorganisation Energies ###
Q(prm::LorPrm1D) = Diagonal([(prm.α1)/(2*prm.ω01^2),
                             0,
                             0])
Q(prm::LorPrm2D) = Diagonal([(prm.α1)/(2*prm.ω01^2),
                             (prm.α2)/(2*prm.ω02^2),
                             0])
Q(prm::LorPrm3D) = Diagonal([(prm.α1)/(2*prm.ω01^2),
                             (prm.α2)/(2*prm.ω02^2),
                             (prm.α3)/(2*prm.ω03^2)])

 ### System Hamiltonian ###
HS(θ) = -sign(γ)*sz(θ)

### Effective Hamiltonian ###
Heff(θ, ϕ, ang::CouplingAngles, prm::Lorentzian) = -sign(γ)*sz(θ) - transpose(scvect(θ, ϕ, ang))*Q(prm)*scvect(θ, ϕ, ang)