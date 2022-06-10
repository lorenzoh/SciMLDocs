
"""
    DocumenterPages(modules) <: Rewriter

Loads all documents referenced in the `modules` sidebar and adds them to a
project.

!!! warn "pages.jl file"
    Each module must have a "docs/pages.jl" file!
"""
mutable struct DocumenterPages <: Pollen.Rewriter
    ms::Vector{Module}
    done::Bool
end
DocumenterPages(ms) = DocumenterPages(ms, false)

function Pollen.createsources!(rewriter::DocumenterPages)
    sources = Dict{String, Node}()
    rewriter.done && return sources
    for m in rewriter.ms
        readindex(loadpkgindex(m)) do f
            sources["$m/$f"] = Pollen.__loadfile(joinpath(Pkg.pkgdir(m), "docs/src", f))
        end
    end
    rewriter.done = true
    return sources
end
