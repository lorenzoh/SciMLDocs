
"""
Takes care of loading the page index for each package, i.e. the links shown in
the sidebar from the package's "docs/pages.jl" file and stitching them together.
"""


function readindex(f, pages::Vector)
    index = OrderedDict{String, Any}()
    for page in pages
        if page isa Pair
            name, subpage = page
            index[name] = readindex(f, subpage)
        else
            index[string(page)] = readindex(f, page)
        end
    end
    return index
end

readindex(f, page::String) = f(page)
function readindex(f, (name, val)::Pair{String, Any})
    if val isa AbstractString
        return f(val)
    else
        return readindex(f, val)
    end
end
readindex(page) = readindex(identity, page)


readpkgindex(m::Module) = readpkgindex(m, loadpkgindex(m))
readindex(f, m::Module) = readindex(p -> joinpath(string(m), p), loadpkgindex(m))

function readpkgindex(ms::Vector{Module})
    Dict(string(m) => readindex(f -> joinpath(string(m), f), loadpkgindex(m))
         for m in ms)
end

function loadpkgindex(m::Module)
    # needs latest branch that has pages.jl
    _m = Module(Symbol(UUIDs.uuid4()))
    pages_file = joinpath(Pkg.pkgdir(m, "docs", "pages.jl"))
    if !isfile(pages_file)
        throw(SystemError("Expected module `$m` to have a pages.jl file at \"$pages_file\", but it does not exist"))
    end
    return Base.include(_m, pages_file)
end
