[Mesh]
  type = GeneratedMesh
  dim = 1
  nx = 1
[]

[Executioner]
  type = Transient
  num_steps = 3
[]

[Problem]
  type = TransientExternalProblem
[]

[AuxVariables]
  [copy]
    family = MONOMIAL
    order = CONSTANT
  []
[]

[AuxKernels]
  [copy]
    type = SelfAux
    variable = copy
    v = heat_source
  []
[]

[Postprocessors]
  [original]
     type = PointValue
     variable = heat_source
     point = '0.0 0.0 0.0'
  []
  [copy]
     type = PointValue
     variable = copy
     point = '0.0 0.0 0.0'
  []
[]

[Outputs]
  csv = true
[]
