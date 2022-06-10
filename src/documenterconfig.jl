
"""
    DocumenterConfig(modules[; title, homepage])

Alias to [`Pollen.LoadFrontendConfig`](#) that loads Documenter.jl-specific
configuration.

!!! warn "pages.jl file"
    Each module must have a "docs/pages.jl" file!
"""
function DocumenterConfig(index; title = "Documentation", homepage = "README.md")
    config = Dict(
        "title" => title,
        "defaultDocument" => homepage,
        "columnWidth" => 650,
        "linktree" => readindex(index)
    )
    return LoadFrontendConfig(config, "config.json")
end
