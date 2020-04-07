#pragma once

#include "OneDIntegratedBC.h"

/**
 * A BC for the mass equation in which nothing is specified (i.e.
 * everything is allowed to be "free".
 */
class OneDMassFreeBC : public OneDIntegratedBC
{
public:
  OneDMassFreeBC(const InputParameters & parameters);

protected:
  virtual Real computeQpResidual();
  virtual Real computeQpJacobian();
  virtual Real computeQpOffDiagJacobian(unsigned jvar);

  // Coupled variables
  unsigned int _arhouA_var_number;
  const VariableValue & _arhouA;

public:
  static InputParameters validParams();
};
