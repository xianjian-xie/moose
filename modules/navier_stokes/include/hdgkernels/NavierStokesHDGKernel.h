//* This file is part of the MOOSE framework
//* https://www.mooseframework.org
//*
//* All rights reserved, see COPYRIGHT for full restrictions
//* https://github.com/idaholab/moose/blob/master/COPYRIGHT
//*
//* Licensed under LGPL 2.1, please see LICENSE for details
//* https://www.gnu.org/licenses/lgpl-2.1.html

#pragma once

#include "HDGKernel.h"
#include "NavierStokesHDGAssemblyHelper.h"

#include <vector>

class Function;

/**
 * Implements the steady incompressible Navier-Stokes equations for a hybridized discretization
 */
class NavierStokesHDGKernel : public HDGKernel, public NavierStokesHDGAssemblyHelper
{
public:
  static InputParameters validParams();

  NavierStokesHDGKernel(const InputParameters & parameters);

  virtual const MooseVariableBase & variable() const override { return _u_face_var; }

protected:
  virtual void onElement() override;
  virtual void onInternalSide() override;

  // body forces
  const Function & _body_force_x;
  const Function & _body_force_y;
  const Function & _body_force_z;
  std::vector<const Function *> _body_forces;
  const Function & _pressure_mms_forcing_function;
};
