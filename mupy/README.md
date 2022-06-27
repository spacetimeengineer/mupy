

### mupy-core

These classes are nessecary for building the mupy model in an object oriented fashion. The basic approach is to model everything in terms of hardware (think system-codes), assemblies of hardware (this implies that coordinates in 3D space must be assigned to the hardware for an assembly simulation to make sense) and assemblies (each with initial and final coordinates within some specified assembly epoch) of hardware and smaller assemblies ad infinitum.  

### mucli

Contains code that models the mucli command line tool.

### lib

Contains code that builds the hardware itself. This library will be continuously built indefinitely and the hope is that with the community's help over many years we can develop and identify together a series of reliable hardware families and assembled systems for wide-scale distribution. This is the approach to technological advancement proposed by mupy.

### index

| Class         | Description                    |        Example       |
| --------------------- | ------------------------------ | ------------------------|
| hardware.py  | X | X  |
| assembly.py  | X | X  |
| coordinates.py  | X | X |
| workspace.py  | f | f |
| core.py  |f | f  |
| decode.py  |f | f  |