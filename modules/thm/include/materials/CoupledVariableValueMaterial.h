#pragma once

#include "Material.h"

/**
 * Stores values of a variable into material properties
 */
class CoupledVariableValueMaterial : public Material
{
public:
  CoupledVariableValueMaterial(const InputParameters & parameters);

protected:
  virtual void computeQpProperties() override;

  /// The name of the material property where the values will be stored
  const MaterialPropertyName & _prop_name;
  /// Storage for the variable values
  MaterialProperty<Real> & _prop;
  /// The coupled variable values
  const VariableValue & _value;

public:
  static InputParameters validParams();
};
