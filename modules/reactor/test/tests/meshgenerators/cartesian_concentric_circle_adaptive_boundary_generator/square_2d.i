[Mesh]
  [fmg]
    type = FileMeshGenerator
    file = square_in.e
  []
  [gen]
    type = CartesianConcentricCircleAdaptiveBoundaryMeshGenerator
    num_sectors_per_side = '4 4 4 4'
    background_intervals = 2
    square_size = 5.0
    sides_to_adapt = 0
    inputs = 'fmg'
  []
[]
