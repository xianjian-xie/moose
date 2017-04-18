#ifndef GEOMETRICALCOMPONENT_H
#define GEOMETRICALCOMPONENT_H

#include "Component.h"
#include "RELAP7App.h"
#include <map>
#include <unordered_set>
#include <numeric>

class GeometricalComponent;

template <>
InputParameters validParams<GeometricalComponent>();

/**
 * Intermediate class for all geometrical components (i.e components that have position, direction,
 * etc. in space - they generate a mesh)
 */
class GeometricalComponent : public Component
{
public:
  GeometricalComponent(const InputParameters & parameters);
  virtual ~GeometricalComponent();

  virtual void setupMesh();
  virtual void displaceMesh();

  virtual Point getPosition() const { return _position; }
  virtual RealVectorValue getDirection() const { return _dir; }
  virtual Real getRotation() const { return _rotation; }

  virtual Real getNumNodes() const { return _n_nodes; }
  virtual Real getNumElems() const { return _n_elem; }
  virtual Real getLength() const { return _length; }

  virtual const std::vector<RELAP7::Connection> & getConnections(RELAP7::EEndType id) const;

protected:
  virtual void buildMesh() = 0;
  const FunctionName & getVariableFn(const FunctionName & fn_param_name);

  /// Node IDs
  unsigned int _first_node_id;
  unsigned int _last_node_id;

  /// Physical position in the space
  Point _position;

  /// Offset for mesh generation
  Point _offset;

  /// Direction this pipe is going to
  RealVectorValue _dir;

  /// Rotation of the component around x-axis in non-displaced space
  Real _rotation;

  /// True if simulation is using a second order mesh
  bool _2nd_order_mesh;

  /// Number of sections in the geometric component
  unsigned int _n_sections;

  /// Length of the geometric component along the main axis
  Real _length;

  /// Length of each subsection of the geometric component
  std::vector<Real> _lengths;

  /// Number of elements along the main axis
  unsigned int _n_elem;

  /// Number of elements in each subsection of the geometric component
  std::vector<unsigned int> _n_elems;

  /// Number of nodes along the main axis
  unsigned int _n_nodes;

  /// Node locations along the main axis
  std::vector<Real> _node_locations;

  std::map<RELAP7::EEndType, std::vector<RELAP7::Connection>> _connections;

private:
  unsigned int validateNSectionsConsistent(int n_lengths, int n_n_elems);
  void generateNodeLocations();
  unsigned int computeNumberOfNodes(unsigned int n_elems);
  std::vector<Real> getUniformNodeLocations(Real length, unsigned int n_nodes);
  void placeLocalNodeLocations(Real start_length,
                               unsigned int start_node,
                               std::vector<Real> & local_node_locations);
};

#endif /* GEOMETRICALCOMPONENT_H */
