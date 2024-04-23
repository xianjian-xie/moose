//* This file is part of the MOOSE framework
//* https://www.mooseframework.org
//*
//* All rights reserved, see COPYRIGHT for full restrictions
//* https://github.com/idaholab/moose/blob/master/COPYRIGHT
//*
//* Licensed under LGPL 2.1, please see LICENSE for details
//* https://www.gnu.org/licenses/lgpl-2.1.html

#include "NEML2TestModel.h"

namespace neml2
{
register_NEML2_object(NEML2TestModel);

OptionSet
NEML2TestModel::expected_options()
{
  using vecstr = std::vector<std::string>;
  auto options = Model::expected_options();
  options.set<VariableName>("A") = vecstr{"forces", std::string("A")};
  options.set<VariableName>("B") = vecstr{"forces", std::string("B")};
  options.set<VariableName>("sum") = vecstr{"state", "internal", "sum"};
  options.set<VariableName>("product") = vecstr{"state", "internal", "product"};
  options.set<bool>("use_AD_first_derivative") = true;
  options.set<bool>("use_AD_second_derivative") = true;
  return options;
}

NEML2TestModel::NEML2TestModel(const OptionSet & options)
  : Model(options),
    // inputs
    _input_a(declare_input_variable<Scalar>("A")),
    _input_b(declare_input_variable<Scalar>("B")),
    // outputs
    _sum(declare_output_variable<Scalar>("sum")),
    _product(declare_output_variable<Scalar>("product"))
{
}

void
NEML2TestModel::set_value(bool out, bool dout_din, bool d2out_din2)
{
  neml_assert_dbg(!d2out_din2, "I am too lazy to implement second derivatives");
  neml_assert_dbg(!dout_din, "Try AD");

  if (!out)
    return;

  // Grab the inputs
  const auto & A = _input_a;
  const auto & B = _input_b;

  // Compute outputs
  _sum = _input_a + _input_b;
  _product = _input_a * _input_b;
}

} // namespace neml2
