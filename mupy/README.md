### mupy-core

These classes are nessecary for building the mupy model in an object oriented fashion. The basic approach is to model everything in terms of hardware (think system-codes), assemblies of hardware (this implies that coordinates in 3D space must be assigned to the hardware for an assembly simulation to make sense) and assemblies (each with initial and final coordinates within some specified assembly epoch) of hardware and smaller assemblies ad infinitum.  

### mucli

Contains code that models the mucli command line tool.

### lib

Contains code that builds the hardware itself. This library will be continuously built indefinitely and the hope is that with the community's help over many years we can develop and identify together a series of reliable hardware families and assembled systems for wide-scale distribution. This is the approach to technological advancement proposed by mupy.


| script / directory            | Description                    |        Status       |
| --------------------- | ------------------------------ | ------------------------|
| hardware.py  | Python class for building digital twin representations of hardware for a given system code. |  This class is fundemental to the mupy-model currently.  |
| assembly.py  | Radius of bolt shaft. | number (Use 'P' to indicate decimal within numerical string)  |     This class is fundemental to the mupy-model currently.       |
| coordinates.py  | Radius of bolt shaft. | number (Use 'P' to indicate decimal within numerical string)  |     mm      |
| workspace.py  | Radius of bolt shaft. | number (Use 'P' to indicate decimal within numerical string)  |     mm      |
| core.py  | Radius of bolt shaft. | number (Use 'P' to indicate decimal within numerical string)  |     mm      |
| decode.py  | Radius of bolt shaft. | number (Use 'P' to indicate decimal within numerical string)  |     This class will be phased out for a sub-system that works more like an FTP / namespace or a better library structure.      |