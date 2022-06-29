###########################
#### spinComponents.jl ####
###########################

### Spin Components ###
sx(θ, ϕ) = sin(θ)*cos(ϕ)
sy(θ, ϕ) = sin(θ)*sin(ϕ)
sz(θ) = cos(ϕ)

### Spin Couplings ###
θ1, ϕ1 = [π/2 0] # Direction 1
θ2, ϕ2 = [π/2 π/2] # Direciton 2
θ3, ϕ3 = [0 0] # Direction 3

s1(θ, ϕ) = sx(θ, ϕ)*sin(θ1)*cos(ϕ1) + sy(θ, ϕ)*sin(θ1)*cos(ϕ1) + sz(θ)*cos(θ1)
s2(θ, ϕ) = sx(θ, ϕ)*sin(θ2)*cos(ϕ2) + sy(θ, ϕ)*sin(θ2)*cos(ϕ2) + sz(θ)*cos(θ2)
s3(θ, ϕ) = sx(θ, ϕ)*sin(θ3)*cos(ϕ3) + sy(θ, ϕ)*sin(θ3)*cos(ϕ3) + sz(θ)*cos(θ3)