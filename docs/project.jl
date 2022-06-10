using Pollen
using Pkg

# The main package you are documenting
using SciMLDocs
import SciMLBase, LinearSolve, NonlinearSolve
m = SciMLDocs


# Packages that will be indexed in the documentation. Add additional modules
# to the list.
packages = [SciMLBase, LinearSolve, NonlinearSolve]

project = sciml_project(packages,
                        title = "SciML documentation",
                        homepage="NonlinearSolve/README.md")
