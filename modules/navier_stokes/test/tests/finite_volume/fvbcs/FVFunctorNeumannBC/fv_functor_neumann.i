mu=1
rho=1
k=0.75
cp=1
alpha = 1
advected_interp_method='upwind'
velocity_interp_method='rc'

[GlobalParams]
  rhie_chow_user_object = 'rc'
[]

[UserObjects]
  [rc]
    type = INSFVRhieChowInterpolator
    u = vel_x
    v = vel_y
    pressure = pressure
  []
[]

[Mesh]
  [gen]
    type = GeneratedMeshGenerator
    dim = 2
    xmin = 0
    xmax = 5
    ymin = -1
    ymax = 1
    nx = 50
    ny = 16
  []
[]

[Problem]
  fv_bcs_integrity_check = true
[]

[Variables]
  [vel_x]
    type = INSFVVelocityVariable
    initial_condition = 1
  []
  [vel_y]
    type = INSFVVelocityVariable
    initial_condition = 1
  []
  [pressure]
    type = INSFVPressureVariable
  []
  [T_fluid]
    type = INSFVEnergyVariable
  []
[]

[FVKernels]
  [mass]
    type = INSFVMassAdvection
    variable = pressure
    advected_interp_method = ${advected_interp_method}
    velocity_interp_method = ${velocity_interp_method}
    rho = ${rho}
  []

  [u_advection]
    type = INSFVMomentumAdvection
    variable = vel_x
    advected_interp_method = ${advected_interp_method}
    velocity_interp_method = ${velocity_interp_method}
    rho = ${rho}
    momentum_component = 'x'
  []
  [u_viscosity]
    type = INSFVMomentumDiffusion
    variable = vel_x
    mu = ${mu}
    momentum_component = 'x'
  []
  [u_pressure]
    type = INSFVMomentumPressure
    variable = vel_x
    momentum_component = 'x'
    pressure = pressure
  []

  [v_advection]
    type = INSFVMomentumAdvection
    variable = vel_y
    advected_interp_method = ${advected_interp_method}
    velocity_interp_method = ${velocity_interp_method}
    rho = ${rho}
    momentum_component = 'y'
  []
  [v_viscosity]
    type = INSFVMomentumDiffusion
    variable = vel_y
    mu = ${mu}
    momentum_component = 'y'
  []
  [v_pressure]
    type = INSFVMomentumPressure
    variable = vel_y
    momentum_component = 'y'
    pressure = pressure
  []

  [energy_advection]
    type = INSFVEnergyAdvection
    variable = T_fluid
    velocity_interp_method = ${velocity_interp_method}
    advected_interp_method = ${advected_interp_method}
  []
  [energy_diffusion]
    type = FVDiffusion
    coeff = ${k}
    variable = T_fluid
  []
[]

[FVBCs]
  [inlet-u]
    type = INSFVInletVelocityBC
    boundary = 'left'
    variable = vel_x
    function = '1'
  []
  [inlet-v]
    type = INSFVInletVelocityBC
    boundary = 'left'
    variable = vel_y
    function = 0
  []
  [walls-u]
    type = INSFVNoSlipWallBC
    boundary = 'top bottom'
    variable = vel_x
    function = 0
  []
  [walls-v]
    type = INSFVNoSlipWallBC
    boundary = 'top bottom'
    variable = vel_y
    function = 0
  []
  [outlet_p]
    type = INSFVOutletPressureBC
    boundary = 'right'
    variable = pressure
    function = 0
  []
  [inlet_t]
    type = FVDirichletBC
    boundary = 'left'
    variable = T_fluid
    value = 1
  []

  [top_q]
    type = FVFunctorNeumannBC
    boundary = 'top'
    variable = T_fluid
    functor = 0.1
  []
[]

# [Functions]
#   [top_functor]
#     type = ADPiecewiseLinear
#     axis = x
#     x = '0 0.5 0.6 5'
#     y = '0 0   1   1'
#   []
# []

[Materials]
  [const_functor]
    type = ADGenericFunctorMaterial
    prop_names = 'cp alpha'
    prop_values = '${cp} ${alpha}'
  []
  [ins_fv]
    type = INSFVEnthalpyMaterial
    rho = ${rho}
    temperature = 'T_fluid'
  []
[]

[Postprocessors]
  [temp]
    type = ElementAverageValue
    variable = T_fluid
  []
  [temp_left]
    type = SideAverageValue
    variable = T_fluid
    boundary = 'left'
  []
  [temp_right]
    type = SideAverageValue
    variable = T_fluid
    boundary = 'right'
  []

  [mass_flow_rate]
    type = VolumetricFlowRate
    vel_x = vel_x
    vel_y = vel_y
    advected_quantity = ${rho}
    boundary = right
  []

  [enthalpy_flow_rate_out]
    type = VolumetricFlowRate
    vel_x = vel_x
    vel_y = vel_y
    advected_quantity = T_fluid
    boundary = right
  []

  [enthalpy_flow_rate_in]
    type = VolumetricFlowRate
    vel_x = vel_x
    vel_y = vel_y
    advected_quantity = T_fluid
    boundary = left
  []
[]

[Executioner]
  type = Steady
  solve_type = 'NEWTON'
  petsc_options_iname = '-pc_type -ksp_gmres_restart -sub_pc_type -sub_pc_factor_shift_type'
  petsc_options_value = 'asm      100                lu           NONZERO'
  line_search = 'none'
  nl_rel_tol = 1e-12
[]

[Outputs]
  exodus = true
  # csv = true
[]
