module AntiqueModules

export eigenvalue

"""
    eigenvalue(model; numbers..., parameters...)

Return the eigenvalue for a given `model`, as characterized by the given
quantum numbers and parameters.
"""
function eigenvalue end

abstract type AbstractModel end

function Base.show(io::IO, model::T) where {T<:AbstractModel}
    fields = fieldnames(T)
    Base.show_type_name(io, T.name)
    print(io, "(")
    n = length(fields)
    for (i, name) in pairs(fields)
        val = getfield(model, name)
        print(io, name, " = ", val)
        if i < n
            print(io, ", ")
        end
    end
    print(io, ")")
end


include("hydrogen_atoms.jl")
using .HydrogenAtoms: HydrogenAtom
export HydrogenAtom

end
