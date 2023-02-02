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
class NSFVMixtureMaterial : public FunctorMaterial
{
public:
  static InputParameters validParams();

  NSFVMixtureMaterial(const InputParameters & parameters);

protected:
  /// vector of phase 1 properties
  std::vector<const Moose::Functor<ADReal> *> _phase_1_properties;

  /// vector of phase 2 properties
  std::vector<const Moose::Functor<ADReal> *> _phase_2_properties;

  /// vector of phase 1 properties names
  std::vector<MooseFunctorName> _phase_1_names;

  /// vector of phase 2 properties names
  std::vector<MooseFunctorName> _phase_2_names;

  /// vector of mixture properties names
  std::vector<MooseFunctorName> _mixture_names;

  /// Phase 1 fraction
  const Moose::Functor<ADReal> & _phase_1_fraction;
};
