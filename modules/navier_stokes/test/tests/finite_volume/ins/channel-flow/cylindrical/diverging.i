mu=1
rho=1
advected_interp_method='average'
velocity_interp_method='rc'
penalty=1e6
# we can think of the axis as a slip wall boundary, no normal velocity and no viscous shear
slip_wall_boundaries = 'left'

[Mesh]
  file = diverging.msh
  uniform_refine = 2
[]

[Problem]
  kernel_coverage_check = false
  fv_bcs_integrity_check = true
  coord_type = 'RZ'
[]

[Variables]
  [u]
    type = INSFVVelocityVariable
    initial_condition = 1e-15
  []
  [v]
    type = INSFVVelocityVariable
    initial_condition = 1e-15
  []
  [pressure]
    type = INSFVPressureVariable
  []
[]

[FVKernels]
  [mass]
    type = INSFVMassAdvection
    variable = pressure
    advected_interp_method = ${advected_interp_method}
    velocity_interp_method = ${velocity_interp_method}
    vel = 'velocity'
    pressure = pressure
    u = u
    v = v
    mu = ${mu}
    rho = ${rho}
    flow_boundaries = 'top bottom'
    slip_wall_boundaries = ${slip_wall_boundaries}
  []

  [u_advection]
    type = INSFVMomentumAdvection
    variable = u
    advected_quantity = 'rhou'
    vel = 'velocity'
    advected_interp_method = ${advected_interp_method}
    velocity_interp_method = ${velocity_interp_method}
    pressure = pressure
    u = u
    v = v
    mu = ${mu}
    rho = ${rho}
    flow_boundaries = 'top bottom'
    slip_wall_boundaries = ${slip_wall_boundaries}
  []
  [u_viscosity]
    type = FVDiffusion
    variable = u
    coeff = ${mu}
  []
  [u_pressure]
    type = INSFVMomentumPressure
    variable = u
    momentum_component = 'x'
    p = pressure
  []

  [v_advection]
    type = INSFVMomentumAdvection
    variable = v
    advected_quantity = 'rhov'
    vel = 'velocity'
    advected_interp_method = ${advected_interp_method}
    velocity_interp_method = ${velocity_interp_method}
    pressure = pressure
    u = u
    v = v
    mu = ${mu}
    rho = ${rho}
    flow_boundaries = 'top bottom'
    # we can think of the axis as a slip wall boundary, no normal velocity and no viscous shear
    slip_wall_boundaries = ${slip_wall_boundaries}
  []
  [v_viscosity]
    type = FVDiffusion
    variable = v
    coeff = ${mu}
  []
  [v_pressure]
    type = INSFVMomentumPressure
    variable = v
    momentum_component = 'y'
    p = pressure
  []
[]

[FVBCs]
  active = 'inlet-u inlet-v free-slip-wall-u free-slip-wall-v'

  [inlet-u]
    type = FVDirichletBC
    boundary = 'bottom'
    variable = u
    value = 0
  []
  [inlet-v]
    type = FVDirichletBC
    boundary = 'bottom'
    variable = v
    value = 1
  []
  [free-slip-wall-u]
    type = INSFVPenaltyFreeSlipBC
    boundary = 'right'
    variable = u
    momentum_component = x
    u = u
    v = v
    penalty = ${penalty}
  []
  [free-slip-wall-v]
    type = INSFVPenaltyFreeSlipBC
    boundary = 'right'
    variable = v
    momentum_component = y
    u = u
    v = v
    penalty = ${penalty}
  []
  [no-slip-wall-u]
    type = FVDirichletBC
    boundary = 'right'
    variable = u
    value = 0
  []
  [no-slip-wall-v]
    type = FVDirichletBC
    boundary = 'right'
    variable = v
    value = 0
  []
  [outlet-p]
    type = FVDirichletBC
    boundary = 'top'
    variable = pressure
    value = 0
  []
[]

[Materials]
  [ins_fv]
    type = INSFVMaterial
    u = 'u'
    v = 'v'
    pressure = 'pressure'
    rho = ${rho}
  []
[]

[Executioner]
  type = Steady
  solve_type = 'NEWTON'
  petsc_options = '-options_left'
  petsc_options_iname = '-pc_type -sub_pc_type -sub_pc_factor_shift_type -ksp_gmres_restart'
  petsc_options_value = 'asm      lu           NONZERO                   200'
  line_search = 'none'
[]

[Debug]
  show_var_residual_norms = true
[]

[Postprocessors]
  [in]
    type = SideIntegralVariablePostprocessor
    variable = v
    boundary = 'bottom'
  []
  [out]
    type = SideIntegralVariablePostprocessor
    variable = v
    boundary = 'top'
  []
  [num_lin]
    type = NumLinearIterations
    outputs = 'console'
  []
  [num_nl]
    type = NumNonlinearIterations
    outputs = 'console'
  []
  [cum_lin]
    type = CumulativeValuePostprocessor
    outputs = 'console'
    postprocessor = 'num_lin'
  []
  [cum_nl]
    type = CumulativeValuePostprocessor
    outputs = 'console'
    postprocessor = 'num_nl'
  []
[]

[Outputs]
  exodus = true
  csv = true
  [dof]
    type = DOFMap
    execute_on = 'initial'
  []
[]
