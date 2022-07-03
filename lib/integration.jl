########################
#### integration.jl ####
########################

using QuadGK

function dblquadgk(f, a::AbstractArray{T}, b::AbstractArray{T}; rtol=sqrt(eps(T)), atol=zero(T), maxevals=10^7, order=7) where T<:AbstractFloat
    J(x) = quadgk(y -> f(x,y), a[2], b[2], atol=atol, maxevals=maxevals, order=order)[1]
    K = quadgk(x -> J(x), a[1], b[1], atol=atol, maxevals=maxevals, order=order)[1]
    return K
end