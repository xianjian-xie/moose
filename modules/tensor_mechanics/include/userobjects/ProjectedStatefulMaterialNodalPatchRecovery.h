//* This file is part of the MOOSE framework
//* https://www.mooseframework.org
//*
//* All rights reserved, see COPYRIGHT for full restrictions
//* https://github.com/idaholab/moose/blob/master/COPYRIGHT
//*
//* Licensed under LGPL 2.1, please see LICENSE for details
//* https://www.gnu.org/licenses/lgpl-2.1.html

#pragma once

// MOOSE includes
#include "NodalPatchRecoveryMaterialProperty.h"

/**
 * Nodal patch recovery for material property components for projected stateful properties
 */
class ProjectedStatefulMaterialNodalPatchRecovery : public NodalPatchRecoveryMaterialProperty
{
public:
  static InputParameters validParams();

  ProjectedStatefulMaterialNodalPatchRecovery(const InputParameters & parameters);

  virtual void initialSetup() override;
  virtual void subdomainSetup() override;

protected:
  virtual Real computeValue() override;

  const SubdomainID & _current_subdomain_id;

  std::set<MaterialBase *> _all_materials;
  std::vector<MaterialBase *> _active_materials;
};
