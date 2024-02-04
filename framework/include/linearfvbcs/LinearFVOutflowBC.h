//* This file is part of the MOOSE framework
//* https://www.mooseframework.org
//*
//* All rights reserved, see COPYRIGHT for full restrictions
//* https://github.com/idaholab/moose/blob/master/COPYRIGHT
//*
//* Licensed under LGPL 2.1, please see LICENSE for details
//* https://www.gnu.org/licenses/lgpl-2.1.html

#pragma once

#include "LinearFVBoundaryCondition.h"

/**
 * Class implementing an outflow boundary condition for linear finite
 * volume variables
 */
class LinearFVOutflowBC : public LinearFVBoundaryCondition
{
public:
  static InputParameters validParams();

  /**
   * Class constructor.
   * @param parameters The InputParameters for the object
   */
  LinearFVOutflowBC(const InputParameters & parameters);

  /// Whether the face value on this boundary is determined using a linear
  /// extrapolation from the adjacent cell center.
  virtual bool needsExtrapolation() const override { return _two_term_expansion; }

  virtual Real computeBoundaryValue() const override;

  virtual Real computeBoundaryNormalGradient() const override;

  virtual Real computeBoundaryValueMatrixContribution() const override;

  virtual Real computeBoundaryValueRHSContribution() const override;

  virtual Real computeBoundaryGradientMatrixContribution() const override;

  virtual Real computeBoundaryGradientRHSContribution() const override;

protected:
  /// Computes the vector connecting the cell and boundary face centers.
  /// It is needed because sometimes boundaries can be assigned to internal faces as well.
  RealVectorValue computeCellToFaceVector() const;

  /// Switch for enabling linear extrapolation for the boundary face value
  const bool _two_term_expansion;

  /// The constant advecting velocity on the boundary face
  const RealVectorValue _velocity;
};
