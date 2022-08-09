//* This file is part of the MOOSE framework
//* https://www.mooseframework.org
//*
//* All rights reserved, see COPYRIGHT for full restrictions
//* https://github.com/idaholab/moose/blob/master/COPYRIGHT
//*
//* Licensed under LGPL 2.1, please see LICENSE for details
//* https://www.gnu.org/licenses/lgpl-2.1.html

#pragma once

#ifdef LIBTORCH_ENABLED
#include <torch/torch.h>
#endif

#include "GeneralVectorPostprocessor.h"

/**
 * A VectorPostprocessor which can print the parameter values of a
 * LibtorchArtificialNeuralNetwork from within a Controller object.
 */
class LibtorchArtificialNeuralNetParameters : public GeneralVectorPostprocessor
{
public:
  static InputParameters validParams();

  LibtorchArtificialNeuralNetParameters(const InputParameters & params);

  virtual void initialize() override {};
  virtual void execute() override;
  virtual void finalize() override {};

protected:
#ifdef LIBTORCH_ENABLED
  /// Fill the vector psotprocessor values with the parameters
  void fillParameterValues(const std::shared_ptr<torch::nn::Module> & ann);
#endif

  /// The name of the control objects which hold the neural networks
  std::string _control_name;
  /// A vector which stores the parameters of the neural net
  VectorPostprocessorValue & _nn_parameter_values;
};
