function sciml_project(packages::Vector{Module}, index = packages; kwargs...)
    Project(
        Pollen.Rewriter[
            # Reads the markdown files in the docs/ folder
            DocumenterPages(packages),

            # For automatic hyperreferences of package symbols in code blocks/source files
            ParseCode(),

            # Creates reference pages for all symbols in packages and includes
            # source files
            PackageDocumentation(packages),

            # Finds links between pages and creates backlink index
            DocumentGraph(),

            SearchIndex(),

            # Loads the sidebar index and some other metadata
            DocumenterConfig(packages; kwargs...),
            SaveAttributes((:title,), useoutputs=false),
        ],
    )
end
