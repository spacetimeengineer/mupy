
## Directories & Files
### mupy-core

mupy.core refferes to the mupy model through the classes dedicated to describing it. The model is in flux but the system-code technology is somewhat understood. These classes are nessecary for building the mupy model in an object oriented fashion. The basic approach is to model everything in terms of hardware (think system-codes), assemblies of hardware (this implies that coordinates in 3D space must be assigned to the hardware for an assembly simulation to make sense) and assemblies (each with initial and final coordinates within some specified assembly epoch) of hardware and smaller assemblies ad infinitum.  

### mucli

Contains code that models the mucli command line tool.

### lib

Contains code that builds the hardware itself. This library will be continuously built indefinitely and the hope is that with the community's help over many years we can develop and identify together a series of reliable hardware families and assembled systems for wide-scale distribution. This is the approach to technological advancement proposed by mupy.

## Concepts

### Workspace
A workspace is essentially a directory structure or environment to place hardware or assemblies objects into. It is a python class object and possess other unique properties and functions which make it behave as a sort of virtual workbench. Some properties and functions :

  - Ensures hardware & assembly uniqueness within script.
  - Contains a run() function that initializes rendering sequence.
  - Only needs one arguments ; the final assembly.
    - All sub-assemblies and hardware are imported recursively.
  - Manages directory structure. Gives a home to parts which may be numerous.
  - 3D Workbench.

### Hardware
Hardware objects are the primary agents or mechanism for introducing system-codes into the scripting environment. These hardware objects may also call 3D renderings (.stl files) from local or remote URL adderess in place of the system-codes if desired. It is important to note here that if one is uninterestedin system-code technology then mupy still expressses great utility to user becasue simulation,operation and assembly and certification is still posssible through these features.

### Coordinates
In an assembly generally speaking, there needs to exist initial and final coordinates in 3D space within a certain time quantum since the assembly will exist as a hierarchical structure and will need to be organized down into multiple time domains. Keep in mind that multiple assemblies can exist in a single time quantum but not if they ever involve the same part. There are two classes of coordinates available for modification within the coordinates object. 

- Assembly Coordinates
- Operation Coordinates

They are essentially the same sub-oject conceptually except that operational coordinates are geometrically encompanssed within the frame of reference defined by the assembly coordinates. What this means is that you can think of operational coordinates as the secondary coordinate system or degree of freedom within the animation system used for operational style animations. Due to this feature, operations and assemblies can be animated simultaniously. This is extremely powerful.

### Assembly
Contains similar properties as a Hardware object except that it's primary purpose is to include Hardware objects and other assembly object into itself. It can be injected into other assemblies.
Additionally the assembly object was chosen as the primary mechanism for implementing mu packages.

### Epochs 
Every coordinate object contains and initial and final temporal epoch variable dentoed by 't0' and 'tf' respectivly where 0 ≤ t0 ≤ 1 and 0 ≤ tf ≤ 1. New coordinate objects will be instantiated for the epoch which was not covered for the before and after. This will give the effect that the objects exist but are stationary at thier pre programmed initial and final coordinates for a timespan equal to (t0 - 0). This is difficult to explain but an elegent solution.

## System Codes

### What is a system-code?
The special strings known as system-codes are probably the most important features to be dispensed by the mu technology but what are they exactly? The whole idea behind a system-code was that it was a string which represented a specific part, assembly, technology or most generally speaking, a system. It could be thought of as a seed which carried information regarding some system's geometry, operation, assembly, dissasembly and meta-data. A system-code decoding could be perfomed using mupy ; mupy generates a digital-twin representation of some system from it's corresponding system-code and the resources for manufacturing or assembling it.

### What is the big deal? What makes a system code powerful?
Consider every hardware element one might find in a hardware store and consider every meaningful aspect of that part as being something with could be subject to variance. For instance, the distance of a punched out hole in a bracket from it's edge for some screw to slide through and fasten with and the radius of said hole and the length of the edge of the bracket. Now consider that the person who authored such a part or piece of hardware did so with code and did so with meaningful intention and parametrization such that if someone else wanted to commit thier own configurations to the part they could, without hacking. Now consider that there existed parts which you could not find at a hardware store also, like a guitar or beauty products or food and consider all the possible permutations there might exist and consider all the things that have never been invented yet but might be. Now consider all the permutations that exist when assemblies of any combination and any complex hierarchy set are granted certification or alternativly systems-code-sets. Now consider how one might identify in a human-readable, meaningful, part-like or serial-code like way, an object or technology or system with such vast permutation sets and containing all it in a relativly short string. And you can pull those all into a script to build whatever assembly you like and you can cast that to another system-code. This is the definition of the physical becoming one with software. This will change the world.


### Properties

  - Follows general schema : <Family-Code>-<Type-Code>-<Param-Code>
  - Human decipherable
  - Identifies Geometry/Part/Hardware/Assembly/System
  - System-Seed
  - Encodable/Decodable
  - Schema-less : Each <Family-Code>-<Type-Code> permutation dictates it's own rules.
  - Constituent-Codes:
    - family-code : Serves as a name-space code. Ussually parts of the same style or shared functions belong to it.
    - type-code : Identifies a part without specifying parameters. What makes something a different type or family is for the author to decide.
    - parametrization-code : Stores information describing the input parameters of a system.


## Family Codes
Family codes serve as a kind of name-space code (it may be changed to a name-space code in time) which references a particular library of scad functions in most cases currently and is always set as the first code within the system-code string separated by a dash ('-'). A family code references a family of possible parts which is into 'types' which usually are of a similar style or framework regarding geometric rules set by the author. Types maintain their own parametrization or schema ; this means that for a given type the schema is specific to that type although it is possible that this rule can be relaxed in time with better programming ; meaning that even types can maintain shifting schemas depending on parametrization choices.

## Type Codes
A system-code serves to identify a general system (literally anything physical, especially technological or worth manufacturing) and generate resources and metadata which help users manufacture said system at reduced cost. These resources include CAD files and annotated openscad source code directories containing assembly and operational animation routines which help users record and transmit and interpret complex manufacturing and assembly information.

## Parametrization Codes

## Schemas
Schemas reference the pattern the system codes obey when storing parametrization information.


### Requirements of mupy

- Needs System-Codes

- Schema-less

- Publishable Package

- Assigned Assembly, Operational & Other Context

- Offers Applications Programming Interface (API)
