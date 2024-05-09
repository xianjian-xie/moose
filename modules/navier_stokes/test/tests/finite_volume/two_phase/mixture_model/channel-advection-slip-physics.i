mu = 1.0
rho = 10.0
mu_d = 0.1
rho_d = 1.0
l = 2
U = 1
dp = 0.01
inlet_phase_2 = 0.1
advected_interp_method = 'average'
velocity_interp_method = 'rc'

# TODO remove need for those
cp = 1
k = 1
cp_d = 1
k_d = 1

[Mesh]
  [gen]
    type = GeneratedMeshGenerator
    dim = 2
    xmin = 0
    xmax = '${fparse l * 5}'
    ymin = '${fparse -l / 2}'
    ymax = '${fparse l / 2}'
    nx = 10
    ny = 6
  []
  uniform_refine = 0
[]

[Physics]
  [NavierStokes]
    [Flow]
      [flow]
        compressibility = 'incompressible'

        density = 'rho_mixture'
        dynamic_viscosity = 'mu_mixture'

        # Initial conditions
        initial_velocity = '0 0 0'
        initial_pressure = 0

        # Boundary conditions
        inlet_boundaries = 'left'
        momentum_inlet_types = 'fixed-velocity'
        momentum_inlet_functors = '${U} 0'

        wall_boundaries = 'top bottom'
        momentum_wall_types = 'noslip noslip'

        outlet_boundaries = 'right'
        momentum_outlet_types = 'fixed-pressure'
        pressure_functors = '0'

        # Friction is done in drift flux term
        friction_types = "Darcy"
        friction_coeffs = "Darcy_coefficient_vec"
        standard_friction_formulation = true

        mass_advection_interpolation = '${advected_interp_method}'
        momentum_advection_interpolation = '${advected_interp_method}'
        velocity_interpolation = '${velocity_interp_method}'
        mu_interp_method = 'average'
      []
    []
    [TwoPhaseMixture]
      [mixture]
        liquid_phase_fraction_name = 'phase_1'
        dispersed_phase_fraction_name = 'phase_2'

        add_phase_transport_equation = true
        alpha_exc = 0.1
        phase_advection_interpolation = 'upwind'
        # see flow for inlet boundaries
        phase_fraction_inlet_type = 'fixed-value'
        phase_fraction_inlet_functors = '${inlet_phase_2}'

        ghost_layers = 5

        # Drift flux parameters
        add_drift_flux_momentum_terms = false
        density_interp_method = 'average'
        add_advection_slip_term = true
        slip_linear_friction_name = "Darcy_coefficient"

        # Base phase material properties
        first_phase_density_name = ${rho}
        first_phase_viscosity_name = ${mu}
        first_phase_specific_heat_name = ${cp}
        first_phase_thermal_conductivity_name = ${k}

        # Other phase material properties
        other_phase_density_name = ${rho_d}
        other_phase_viscosity_name = ${mu_d}
        other_phase_specific_heat_name = ${cp_d}
        other_phase_thermal_conductivity_name = ${k_d}
        particle_diameter = 0.01
        output_all_properties = true
      []
    []
  []
[]

[FunctorMaterials]
  [CD]
    type = NSFVDispersePhaseDragFunctorMaterial
    rho = 'rho_mixture'
    mu = mu_mixture
    u = 'vel_x'
    v = 'vel_y'
    particle_diameter = ${dp}
    outputs = 'all'
    output_properties = 'Darcy_coefficient'
  []
[]

[Executioner]
  type = Steady
  solve_type = 'NEWTON'
  nl_rel_tol = 1e-10
[]

[Preconditioning]
  [SMP]
    type = SMP
    full = true
    petsc_options_iname = '-pc_type -pc_factor_shift_type'
    petsc_options_value = 'lu       NONZERO'
  []
[]

[Outputs]
  print_linear_residuals = true
  print_nonlinear_residuals = true
  dofmap = true
  [out]
    type = Exodus
    hide = 'Re lin cum_lin'
  []
  [perf]
    type = PerfGraphOutput
  []
[]

[Postprocessors]
  [Re]
    type = ParsedPostprocessor
    expression = '${rho} * ${l} * ${U}'
  []
  [lin]
    type = NumLinearIterations
  []
  [cum_lin]
    type = CumulativeValuePostprocessor
    postprocessor = lin
  []
[]
