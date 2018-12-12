#ifndef TEMPERATUREWALL3EQNMATERIAL_H
#define TEMPERATUREWALL3EQNMATERIAL_H

#include "Material.h"

class TemperatureWall3EqnMaterial;

template <>
InputParameters validParams<TemperatureWall3EqnMaterial>();

/**
 * Computes T_wall from the constitutive model
 */
class TemperatureWall3EqnMaterial : public Material
{
public:
  TemperatureWall3EqnMaterial(const InputParameters & parameters);

protected:
  virtual void computeQpProperties();

  /// Wall temperature
  MaterialProperty<Real> & _T_wall;
  /// Wall heat flux
  const VariableValue & _q_wall;
  /// Heat transfer coefficient
  const VariableValue & _Hw;
  /// Fluid temperature
  const MaterialProperty<Real> & _T;
};

#endif /* TEMPERATUREWALL3EQNMATERIAL_H */
