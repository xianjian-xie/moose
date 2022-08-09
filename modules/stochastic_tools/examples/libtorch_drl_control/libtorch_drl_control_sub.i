air_density = 1.184 # kg/m3
air_cp = 1000 # J/(kg K)
air_effective_k = 0.5 # W/(m K)

[Mesh]
  [mesh]
    type = GeneratedMeshGenerator
    dim = 2
    xmin = 0.0
    xmax = 7.0
    ymin = 0.0
    ymax = 5.0
    nx = 70
    ny = 50
  []
[]

[Variables]
  [T]
    initial_condition = 297
  []
[]

[Kernels]
  [time_derivative]
    type = CoefTimeDerivative
    variable = T
    Coefficient = ${fparse air_density*air_cp}
  []
  [heat_conduction]
    type = ADMatDiffusion
    variable = T
    diffusivity = 'k'
  []
[]

[BCs]
  [top_flux]
    type = ADNeumannBC
    value = 0.0
    boundary = 'top'
    variable = T
  []
  [dirichlet]
    type = ADFunctionDirichletBC
    function = temp_env
    variable = T
    boundary = 'left right'
  []
[]

[Functions]
  [temp_env]
    type = ParsedFunction
    value = '15.0*sin(t/86400.0*pi) + 273.0'
  []
  [design_function]
    type = ParsedFunction
    value = '297'
  []
  [reward_function]
    type = DRLRewardFunction
    design_function = design_function
    observed_value = center_temp_tend
    c1 = 1
    c2 = 10
  []
[]

[Materials]
  [constant]
    type = ADGenericConstantMaterial
    prop_names = 'k'
    prop_values = ${air_effective_k}
  []
[]

[Postprocessors]
  [center_temp]
    type = PointValue
    variable = T
    point = '3.5 2.5 0.0'
    execute_on = 'INITIAL TIMESTEP_BEGIN'
  []
  [center_temp_tend]
    type = PointValue
    variable = T
    point = '3.5 2.5 0.0'
    execute_on = 'INITIAL TIMESTEP_END'
  []
  [env_temp]
    type = FunctionValuePostprocessor
    function = temp_env
    execute_on = 'INITIAL TIMESTEP_BEGIN'
  []
  [reward]
    type = FunctionValuePostprocessor
    function = reward_function
    execute_on = 'INITIAL TIMESTEP_END'
    indirect_dependencies = 'center_temp_tend env_temp'
  []
  [top_flux]
    type = Receiver
  []
  [log_prob_top_flux]
    type = Receiver
  []
[]

[Reporters]
  [T_reporter]
    type = AccumulateReporter
    reporters = 'center_temp_tend/value env_temp/value reward/value top_flux/value '
                'log_prob_top_flux/value'
  []
[]

[Controls]
  inactive = src_control_final
  [src_control]
    type = LibtorchDRLControl
    parameters = "BCs/top_flux/value"
    action_postprocessors = "top_flux"
    log_probability_postprocessors = "log_prob_top_flux"
    responses = 'center_temp env_temp'

    # keep consistent with LibtorchDRLControlTrainer
    input_timesteps = 1
    response_scaling_factors = '0.03 0.03'
    response_shift_factors = '270 270'
    action_standard_deviations = '0.1'
    action_scaling_factors = 100

    execute_on = 'TIMESTEP_BEGIN'
  []
  [src_control_final]
    type = LibtorchNeuralNetControl

    filename = mynet_control.net
    num_neurons_per_layer = '128 64 27'
    activation_function = 'relu'

    parameters = "BCs/top_flux/value"
    action_postprocessors = "top_flux"
    responses = 'center_temp env_temp'

    input_timesteps = 1
    response_scaling_factors = '0.03 0.03'
    response_shift_factors = '270 270'
    action_scaling_factors = 50

    execute_on = 'TIMESTEP_BEGIN'
  []
[]

[Executioner]
  type = Transient
  solve_type = 'NEWTON'

  petsc_options_iname = '-pc_type'
  petsc_options_value = 'lu'

  nl_rel_tol = 1e-7

  start_time = 0.0
  end_time = 86400
  dt = 900.0
[]

[Outputs]
  console = false
  [c]
    type = CSV
    execute_on = FINAL
  []
[]
