using Pollen
using Pkg

# The main package you are documenting
using SciMLDocs
import Latexify, LaTeXStrings, Plots, Unitful
import RecursiveFactorization
import BenchmarkTools, Catalyst, CommonSolve, DataDrivenDiffEq, DiffEqDocs, DiffEqFlux,
       DiffEqNoiseProcess, DiffEqOperators, DiffEqProblemLibrary, #DiffEqParamEstim,
       DiffEqSensitivity, DifferentialEquations, ExponentialUtilities,
       GlobalSensitivity, Integrals, LabelledArrays, LinearSolve, MethodOfLines,
       ModelingToolkit, #ModelingToolkitStandardLibrary, MultiScaleArrays, NBodySimulator,
       NeuralOperators, NeuralPDE, NonlinearSolve, Optimization, OrdinaryDiffEq,
       ParameterizedFunctions, PoissonRandom, PolyChaos, QuadGK, QuasiMonteCarlo,
       RecursiveArrayTools, ReservoirComputing, SciMLBase, SciMLOperators, SpecialFunctions,
       Surrogates, SymbolicNumericIntegration


# Packages that will be indexed in the documentation
packages = [Catalyst, CommonSolve, #DataDrivenDiffEq,
       DiffEqFlux,
       DiffEqNoiseProcess, DiffEqOperators, #DiffEqProblemLibrary,
       DiffEqSensitivity,
       #DifferentialEquations, OrdinaryDiffEq
       ExponentialUtilities,
       GlobalSensitivity, Integrals, LabelledArrays, LinearSolve, MethodOfLines,
       ModelingToolkit,
       NeuralOperators, NeuralPDE, NonlinearSolve, Optimization,
       ParameterizedFunctions, PoissonRandom, PolyChaos, #QuadGK,
       QuasiMonteCarlo,
       RecursiveArrayTools,
       SciMLBase, SciMLOperators,
       Surrogates, SymbolicNumericIntegration]
       # No pages.jl file:
       # QuadGK, SpecialFunctions, ReservoirComputing
       # Failed precompilation
       # NBodySimulator, DiffEqParamEstim, MultiScaleArrays, ModelingToolkitStandardLibrary

index = [
    "Equation Solvers" =>
        [
            LinearSolve,
            NonlinearSolve,
            "DifferentialEquations" => DiffEqDocs,
            Integrals,
            Optimization
        ],
    "Partial Differential Equation Solvers" =>
        [MethodOfLines, NeuralPDE, NeuralOperators, "FEniCS", DiffEqOperators],
    "Modeling Tools" => [
        ModelingToolkit,
        # ModelingToolkitStandardLibrary,
        Catalyst,
        # NBodySimulator,
        ParameterizedFunctions,
    ],
    "Inverse Problems" => [
        DiffEqSensitivity,
        # DiffEqParamEstim,
    ],
    "AbstractArray Libraries" =>
        [
            RecursiveArrayTools,
            LabelledArrays,
            # MultiScaleArrays,
        ],
    "Uncertainty Quantification" => [PolyChaos],
    "Simulation Analysis" => [GlobalSensitivity],
    "Symbolic Analysis" => [SymbolicNumericIntegration],
    "Interfaces" => [SciMLBase, SciMLOperators, CommonSolve],
    "Numerical Utilities" => [
        Surrogates,
        ExponentialUtilities,
        DiffEqNoiseProcess,
        PoissonRandom,
        QuasiMonteCarlo,
        # DataInterpolations,
        # FFTW,
        # RuntimeGeneratedFunctions,
        # MuladdMacro,
    ],
    "Machine Learning" => [DiffEqFlux],
    "Learning Resources" => [],
    "Developer Documentation" => ["SciMLStyle", "COLPRAC", "DiffEqDevDocs"],
]


project = sciml_project(packages,
                        index,
                        title = "SciML",
                        homepage="NonlinearSolve/index.md")
