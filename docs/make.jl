using AntiqueModules
using Documenter
import Pkg


PROJECT_TOML = Pkg.TOML.parsefile(joinpath(@__DIR__, "..", "Project.toml"))
VERSION = PROJECT_TOML["version"]
NAME = PROJECT_TOML["name"]
AUTHORS = join(PROJECT_TOML["authors"], ", ") * " and contributors"
GITHUB = "https://github.com/goerz-testing/AntiqueModules.jl"

println("Starting makedocs")

PAGES = ["Home" => "index.md", "API" => "api.md"]

makedocs(;
    authors = AUTHORS,
    sitename = "$NAME.jl",
    format = Documenter.HTML(;
        prettyurls = true,
        canonical = "https://goerz-testing.github.io/AntiqueModules.jl",
        edit_link = "master",
        footer = "[$NAME.jl]($GITHUB) v$VERSION docs powered by [Documenter.jl](https://github.com/JuliaDocs/Documenter.jl).",
        assets = String[],
    ),
    pages = PAGES,
)

println("Finished makedocs")

deploydocs(;
    repo = "github.com/goerz-testing/AntiqueModules.jl",
    devbranch = "master",
    push_preview = true
)
