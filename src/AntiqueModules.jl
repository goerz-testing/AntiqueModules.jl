module AntiqueModules

export eigenvalue

"""
    eigenvalue(model; numbers..., parameters...)

Return the eigenvalue for a given `model`, as characterized by the given
quantum numbers and parameters
"""
function eigenvalue end

include("hydrogen_atoms.jl")

end
