//* This file is part of the MOOSE framework
//* https://www.mooseframework.org
//*
//* All rights reserved, see COPYRIGHT for full restrictions
//* https://github.com/idaholab/moose/blob/master/COPYRIGHT
//*
//* Licensed under LGPL 2.1, please see LICENSE for details
//* https://www.gnu.org/licenses/lgpl-2.1.html

#pragma once

#include "SolidPropertiesMaterial.h"

class ThermalSolidProperties;

/**
 * Computes solid thermal properties as a function of temperature.
 */
class ThermalSolidPropertiesMaterial : public SolidPropertiesMaterial
{
public:
  static InputParameters validParams();

  ThermalSolidPropertiesMaterial(const InputParameters & parameters);

protected:
  virtual void computeQpProperties() override;

  /// Temperature
  const VariableValue & _temperature;

  /// Name of the isobaric specific heat
  const std::string _cp_name;

  /// Name of the thermal conductivity
  const std::string _k_name;

  /// Name of the density
  const std::string _rho_name;

  /// Isobaric specific heat capacity
  MaterialProperty<Real> & _cp;

  /// Thermal conductivity
  MaterialProperty<Real> & _k;

  /// Density
  MaterialProperty<Real> & _rho;

  /// Derivative of isobaric specific heat capacity w.r.t. temperature
  MaterialProperty<Real> & _dcp_dT;

  /// Derivative of thermal conductivity w.r.t. temperature
  MaterialProperty<Real> & _dk_dT;

  /// Derivative of density w.r.t. temperature
  MaterialProperty<Real> & _drho_dT;

  /// Solid properties
  const ThermalSolidProperties & _sp;
};
