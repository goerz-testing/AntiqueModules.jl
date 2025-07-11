module HydrogenAtoms

import ..eigenvalue

export HydrogenAtom, eigenvalue

"""
    H = HydrogenAtom(Z = 1, m_e = 1.0, a_0 = 1.0, E_h = 1.0, hbar = 1.0)
    H = HydrogenAtom(Z = 1, mₑ = 1.0, a₀ = 1.0, Eₕ = 1.0, ħ = 1.0)

# Arguments

* `Z`: …
* `m_e` (`mₑ`): …
* `a_0` (`a₀`): …
* `E_h` (`Eₕ`): …
* `hbar` (`ħ`): …

"""
struct HydrogenAtom
    Z::Int64
    m_e::Float64
    a_0::Float64
    E_h::Float64
    hbar::Float64
end

function HydrogenAtom(;
    Z = 1,
    m_e = 1.0,
    a_0 = 1.0,
    E_h = 1.0,
    hbar = 1.0,
    mₑ = m_e,
    a₀ = a_0,
    Eₕ = E_h,
    ħ = hbar
)
    return HydrogenAtom(Z, mₑ, a₀, Eₕ, ħ)
end


function Base.getproperty(H::HydrogenAtom, sym::Symbol)
    if sym == :mₑ
        return getfield(H, :m_e)
    elseif sym == :a₀
        return getfield(H, :a_0)
    elseif sym == :Eₕ
        return getfield(H, :E_h)
    elseif sym == :ħ
        return getfield(H, :hbar)
    else
        return getfield(H, sym)
    end
end

function Base.propertynames(H::HydrogenAtom)
    return (:Z, :m_e, :a_0, :E_h, :hbar, :mₑ, :a₀, :Eₕ, :ħ)
end


@doc raw"""
    eigenvalue(model::HydrogenAtom; n::Int=1)

```math
E_n
= -\frac{m_\mathrm{e} e^4 Z^2}{2n^2(4\pi\varepsilon_0)^2\hbar^2}
= -\frac{Z^2}{2n^2} E_\mathrm{h},
```
where ``E_\mathrm{h} = \frac{\hbar^2}{m_\mathrm{e}{a_0}^2} = \frac{e^2}{4\pi\varepsilon_0a_0} = \frac{m_\mathrm{e}e^4}{\left(4\pi\varepsilon_0\right)^2\hbar^2}`` is the Hartree energy, one of atomic unit. About atomic units, see section 3.9.2 of the [IUPAC GreenBook](https://iupac.org/what-we-do/books/greenbook/). In other units, ``E_\mathrm{h} = 27.211~386~245~988(53)~\mathrm{eV}`` from [here](https://physics.nist.gov/cgi-bin/cuu/Value?hrev).
"""
function eigenvalue(model::HydrogenAtom; n::Int = 1, Z = model.Z, E_h = model.E_h, Eₕ = E_h)
    if !(1 ≤ n)
        throw(DomainError("n = $n", "n must be 1 or more: 1 ≤ n."))
    end
    return -Z^2/(2*n^2) * Eₕ
end


end
