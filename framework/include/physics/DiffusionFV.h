//* This file is part of the MOOSE framework
//* https://www.mooseframework.org
//*
//* All rights reserved, see COPYRIGHT for full restrictions
//* https://github.com/idaholab/moose/blob/master/COPYRIGHT
//*
//* Licensed under LGPL 2.1, please see LICENSE for details
//* https://www.gnu.org/licenses/lgpl-2.1.html

#pragma once

#include "DiffusionPhysicsBase.h"

/**
 * Creates all the objects needed to solve the heat conduction equations with a cell-centered finite
 * volume discretization
 */
class DiffusionFV : public DiffusionPhysicsBase
{
public:
  static InputParameters validParams();

  DiffusionFV(const InputParameters & parameters);

private:
  void addNonlinearVariables() override;
  void addFVKernels() override;
  void addFVBCs() override;
};
