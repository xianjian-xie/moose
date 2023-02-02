//* This file is part of the MOOSE framework
//* https://www.mooseframework.org
//*
//* All rights reserved, see COPYRIGHT for full restrictions
//* https://github.com/idaholab/moose/blob/master/COPYRIGHT
//*
//* Licensed under LGPL 2.1, please see LICENSE for details
//* https://www.gnu.org/licenses/lgpl-2.1.html

#pragma once

#include "FunctorMaterial.h"

/**
 * This is the material class used to compute enthalpy for the incompressible/weakly-compressible
 * finite-volume implementation of the Navier-Stokes equations
 */
class NSMushyPorousFrictionMaterial : public FunctorMaterial
{
public:
  static InputParameters validParams();

  NSMushyPorousFrictionMaterial(const InputParameters & parameters);

protected:
  /// The liquid fraction
  const Moose::Functor<ADReal> & _fl;
  /// The dynamic viscosity
  const Moose::Functor<ADReal> & _mu;
  /// The liquid density
  const Moose::Functor<ADReal> & _rho_l;
  /// Dendrite spacing
  const Moose::Functor<ADReal> & _dendrite_spacing_scaling;

  /// Main closures parameters
  ADReal _c = 180;
  ADReal _s = 100;
  ADReal _fs_crit = 0.27;
  ADReal _forchheimer_coef = 0.55;
};
