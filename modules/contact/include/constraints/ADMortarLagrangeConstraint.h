//* This file is part of the MOOSE framework
//* https://www.mooseframework.org
//*
//* All rights reserved, see COPYRIGHT for full restrictions
//* https://github.com/idaholab/moose/blob/master/COPYRIGHT
//*
//* Licensed under LGPL 2.1, please see LICENSE for details
//* https://www.gnu.org/licenses/lgpl-2.1.html

#pragma once

#include "ADMortarConstraint.h"

/**
 * This class enforces mortar constraints on lower dimensional domains, skipping interior nodes.
 * This class is intended to provide an alternative to imposing mortar constraints for finite
 * elements with nodal variables.
 */
class ADMortarLagrangeConstraint : public ADMortarConstraint
{
public:
  static InputParameters validParams();

  ADMortarLagrangeConstraint(const InputParameters & parameters);

protected:
  using ADMortarConstraint::computeResidual;
  /**
   * compute the residual for the specified element type
   */
  void computeResidual(Moose::MortarType mortar_type) override;

  using ADMortarConstraint::computeJacobian;
  /**
   * compute the Jacobian for the specified element type
   */
  void computeJacobian(Moose::MortarType mortar_type) override;
};
