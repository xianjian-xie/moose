#ifndef CLOSURETESTACTION_H
#define CLOSURETESTACTION_H

#include "TestAction.h"

class ClosureTestAction;

template <>
InputParameters validParams<ClosureTestAction>();

/**
 * Action for setting up a closure test for 2-phase flow
 */
class ClosureTestAction : public TestAction
{
public:
  ClosureTestAction(InputParameters params);

protected:
  virtual void addInitialConditions() override;
  virtual void addSolutionVariables() override;
  virtual void addNonConstantAuxVariables() override;

  /// Name of the dummy variable that is solved for
  const VariableName _dummy_name;
  /// Wall temperature
  const VariableName _T_wall_name;

  /// True if T_wall was specified
  bool _has_T_wall;
  /// Wall temperature function name
  const FunctionName _T_wall_fn;
};

#endif /* CLOSURETESTACTION_H */
