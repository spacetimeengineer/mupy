
<!-- TABLE OF CONTENTS -->
<details>
  <summary>Table of Contents</summary>
  <ol>
    <li><a href="#About">About</a></li>
    <li>
      <a href="#Getting-Started">Getting Started</a>
      <ul>
        <li><a href="#linux-installation">Linux Installation</a></li>
        <li><a href="#windows-installation">Windows Installation</a></li>
        <li><a href="#macos-installation">MacOS Installation</a></li>
        <li><a href="#installation">Installation</a></li>
        <li><a href="#prerequisites">Prerequisites</a></li>
        <li><a href="#installation">Installation</a></li>
      </ul>
    </li>
    <li><a href="#usage">Usage</a></li>
    <li><a href="#roadmap">Roadmap</a></li>
    <li><a href="#contributing">Contributing</a></li>
   <li>
      <a href="#Liscense">Getting Started</a>
      <ul>
        <li><a href="#mupy">Prerequisites</a></li>
        <li><a href="#familycode">Installation</a></li>
      </ul>
    </li>
    <li><a href="#contacts">Contact</a></li>
    <li><a href="#acknowledgments">Acknowledgments</a></li>
  </ol>
</details>

# About

μpy or mupy is a shorthand for python manufacturing utility and reffers to a new system development technology implemented in the form of a python pip installable package. The μpy package essentially proposes to the open source community a new way to design, distrubute and manufacture technology with an emphasis on community, modularity, decentralization, scaling, customization, parametrization, encodability and certification. 

### Note from the developer


### Disclaimer



### Why build mupy

- To give the community access to quadrillions of 3D printable parts and counting. These parts are for recreation, utility and economic development. The large number of parts are available through the various permutations of parameterized scad functions that build 3D shapes and are referenced or identified by system-codes. 

    - System Code Example : CUBX0177-BPAN-B12SR3-X10Y10PP12-RT-SX10Y10-X1Y1-XO0YO0-X70Y70Z10-S

- To render simulations and manufacturing resources from system-codes directly ; Data compression through abstraction & quick development.

- To assign system-encodings, system-schemas and system-parameterizations to organically designed systems and hardware for later customization and recall.

- To give inventors, makers, engineers and artists a more powerful platform for distribution and where thier liscens is respected.


### How does it work?

There are two main interfaces for mupy, a command line interface (CLI) and an applications programming interface (API) They are described below.

- mucli - This is the manufacturing utility command line tool and is used to express the most rudimetry function of mupy ; to quickly render manufacturing resources from known system-code.

- mu.core - This library represents the general case for mupy use-case.

    - python3 scripting interface.
    - hardware class objects combine system-codes and names.

### Function

- Simulation

    - Simulate operation.

    - Simulate assembly.

    - Simulate manufacturing. (Advanced topic)

- Configuration

    - Giving users higher levels of configuration through abstraction tecquniques.

- Modularity

    - Countless parts available for render and in many cases parts interlock.
    
    - modularity makes assebly and manufacturing cheaper and quicker to scale.
    
    - Will help build efficiency of scale designs.
    


- Encodability

    - Hardware identified and described with system-codes.

- Distribution

    - New system codes and family codes can be provided by contributers.

- Manufacturing

    - 3D print systems in many cases, material independent or material specified.
    
- Context

    - Manufacturing context
    - Assembly context
    - Material context
    - Indentity context
    
- Certification

    - Like a package manager but configured for mupy requirements so that family codes provide permutations from scad parameterization.

- R & D

    - General purpose utility for many research and development needs.

### Form

- openscad horizontal abstraction layer

- python pip package

- command line interface - mucli

- application programming interface

- system schematic library

- part generator

- system generator

- system oriented data compression / abstraction engine

### Goals

- increase development speed

- reduce development cost

- decentralized manufacturing

- massive scale system development

- system schematic database

- expose programmers to mechanical engineering

- expose mechanical engineers to programming

- decentralized research and development

# Getting Started

There are a few types of users who may find great enjoyment using mupy :

- 3D printing enthusists - Reccomended usage : mucli

- Inventors - Reccomended usage : mu.core

- Library developers : - Reccomended usage : see contributing guidelines.

- Core developers : : - Reccomended usage : see contributing guidelines.


## Linux Installation

### Prerequisites

1.) Install openscad ( openscad programming language )

    apt install openscad

2.) Install python3-pip ( python package manager )

    apt install python3-pip

3.) Install git (if you plan to contribute or install by cloning) - Follow instrucations at https://www.atlassian.com/git/tutorials/install-git

    $ sudo apt-get update 
    
    $ sudo apt-get install git

### Install mupy

1.) Install mupy from the python3 package-manager.

    pip3 install mupy

## MacOS Installation

### Prerequisites

1.) Install homebrew  
    
    $ ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)" brew doctor
    
2.) Set python as an enviornmental varible. 

    $ export PATH="/usr/local/opt/python/libexec/bin:$PATH"
    
3.) Install git (if you plan to contribute or install by cloning)

    $ brew install git
    
4a.) Install python3 and pip3 (https://docs.python-guide.org/starting/install3/osx/)

    $ brew install python3

4b.) Post-install routine.   

    $ brew postinstall python3

5.) Install openscad - Follow instructions at https://openscad.org/downloads.html or https://ports.macports.org/port/openscad/

### Install mupy

1.) Install mupy from the python3 package-manager.

    pip3 install mupy

## Windows Installation

### Prerequisites

1.) Install Python3 & pip3

    Navigate to https://www.python.org/downloads/
    
3.) Install git (if you plan to contribute or install by cloning)

    Navigate to https://gitforwindows.org/
    apt install openscad

### Install mupy

1.) Install mupy from the python3 package-manager.

    pip3 install mupy

## Docker Container ( optional )

If you prefer touse the provided docker image you will need to install docker at https://docs.docker.com/get-docker/ .

### Build image

    $ docker build -t mu .

### Run container

    $ docker run -i mu:latest


### SSH into container

 	$ docker exec -it mu:latest /bin/bash


### μ-terminal
μ comes with it bundled a command-line-interface application known as the μ-terminal or 'muterm' which behaves much like a linux terminal except that it only accepts special strings known as 'system codes'. muterm was developed to express to users μ's most rudimetry operation ; dispensing manufacturing resources for a given system code. To enter muterm, in the linux terminal

    :~$ ./muterm 

Obviously only certain system-codes will be valid for for input. A simple example can be expressed by the following operation.



The mucli is a general purpose utility and represents the most rudimetry operation of mu technology ; you give it a code and it sends back a system. Here is an example :

    μ:# CUBX0006-BLK-L1000W200H15
    
## Example

![Alt Text](resources/CUBX0006-BLK-L1000W200H15.png)

# muapi - mupy.core

A more complex interface would be the python shell or scripting enviornment.

### utility_box.py


```python
from src.workspace import WorkSpace
from src.hardware import Hardware
from src.coordinates import Coordinates
from src.assembly import Assembly


# A workspace represents a virtual 3D spce which serves as a virtual workbench except it is not a surface but a space.
""" Workspace """

workspace = WorkSpace("/home/mryan/Desktop/psi/modular_gearboxes/")

""" Hardware """
# Declare Hardware codes and unique part names.
panel_a = Hardware("panel_a", "CUBX0177-BPAN-B25SR2P5-X8Y8P18-RT-SX25Y25-X8Y8-X20Y20Z5")
panel_b = Hardware("panel_b", "CUBX0177-BPAN-B25SR2P5-X8Y8P18-RT-SX25Y25-X8Y8-X20Y20Z5")
panel_c = Hardware("panel_c", "CUBX0177-BPAN-B25SR2P5-X8Y8P18-RT-SX25Y25-X8Y8-X20Y20Z5")
panel_d = Hardware("panel_d", "CUBX0177-BPAN-B25SR2P5-X8Y8P18-RT-SX25Y25-X8Y8-X20Y20Z5")
panel_e = Hardware("panel_e", "CUBX0177-BPAN-B25SR2P5-X8Y8P18-RT-SX25Y25-X8Y8-X20Y20Z5")
panel_f = Hardware("panel_f", "CUBX0177-BPAN-B25SR2P5-X8Y8P18-RT-SX25Y25-X8Y8-X20Y20Z5")



alpha = 200 
chamber_assembly = Assembly("chamber_assembly")
chamber_assembly.include(panel_a, Coordinates(0,1,[0, 0 , 8 * 25 / 2 + alpha],[0, 0 , 8 * 25 / 2 ],[0,0,1000],[0,0,0])) # Coordinates complete!
chamber_assembly.include(panel_b, Coordinates(0,1,[0, 8 * 25 / 2 + alpha, 0],[0, 8 * 25 / 2, 0],[0,0,1000],[-90,0,0])) # Coordinates complete!
chamber_assembly.include(panel_c, Coordinates(0,1,[ - 8 * 25 / 2 - alpha, 0, 0 ],[ - 8 * 25 / 2, 0, 0 ],[0,0,1000],[0,-90,0])) # Coordinates complete!
chamber_assembly.include(panel_d, Coordinates(0,1,[0 , 0, -8 * 25 / 2 - alpha],[0 , 0, -8 * 25 / 2 ],[0,0,1000],[0,180,0])) # Coordinates complete!
chamber_assembly.include(panel_e, Coordinates(0,1,[0, - 8 * 25 / 2 - alpha, 0 ],[0, - 8 * 25 / 2, 0 ],[0,0,1000],[90,0,0])) # Coordinates complete!
chamber_assembly.include(panel_f, Coordinates(0,1,[8 * 25 / 2 + alpha, 0 , 0],[8 * 25 / 2, 0 , 0],[0,0,1000],[90,0,90])) # Coordinates complete!

workspace.run(chamber_assembly, Coordinates(0,1,[0,0,0],[0,0,0],[0,0,0],[0,0,0]))

```


![Alt Text](resources/utility_box.gif)

### System Codes
A system-code serves to identify a general system (literally anything physical,especially technological or worth manufacturing) and generate resources and metadata which help users manufacture said system at reduced cost. These resources include CAD files and annotated openscad source code directories containing assembly and operational animation routines which help users record and transmit and intepret complex manufacturing and assembly information.

### Family Codes
A system-code serves to identify a general system (literally anything physical,especially technological or worth manufacturing) and generate resources and metadata which help users manufacture said system at reduced cost. These resources include CAD files and annotated openscad source code directories containing assembly and operational animation routines which help users record and transmit and intepret complex manufacturing and assembly information.

### Type Codes
A system-code serves to identify a general system (literally anything physical,especially technological or worth manufacturing) and generate resources and metadata which help users manufacture said system at reduced cost. These resources include CAD files and annotated openscad source code directories containing assembly and operational animation routines which help users record and transmit and intepret complex manufacturing and assembly information.

### System Schemas
System schemas also sometimes refered to less generally as hardware schemas are a pattern or archetype constant associated the form that defines the hardware itself. THese are best momemorized becasue one can more actuartly imagine parts if theyjust use the abstraction.

### System Sets
Any system code with unspecified parameters ; rendering a set of possible system configuration. the mu package cannot handle these objects yet but soon it will. 


### Certification
Certification can be thought of as a second order abstraction or iteration of the technology onto itself ; if one writes a script with the μ package and invokes a collection of system codes into an assembly then they should be able to identify some naturally occuring parameterization scheme once the system is optimized and second to assign a system schema to this assembly giving it configuration freedom within a single string and invokable from the μ-terminal. After this certification is complete, the mu termal can generate some corresponding assembly with just a single system code. Currently this process is manual and the best practices regarding this operation have not been identified as of this time.


One of the original purposes of mu in it's inception was a place to store old works. If a prototype had been developed then the parts or prototype itself would be cleaned and parameterized and then certified so that the system is now larger and more capable while at the same time the parts and any derividives are retained.




## History
This package was developed over 5 year period where it began as an experiment which supported a small innovation operation. 

### Project ρ

Project ρ (Recursive Hardware Operations) was a project which explored hardware modularity to it's manufacturing limit. The basic idea was to ask if there was some optimal set of shapes / limited parts which could make it easier to print and assemble anything. The idea was borrowed from legos except that the parts would need to be designed with specific requirements in mind that would improve the quality of any assembly especially when it comes to binding and unbinding. This was mostly implemented with 3D printers and the main goal of this project was to create hardware families which could satisfy a great deal of requirements pertaining to the possible decentralized development of large scale systems which granted effeciency-of-scale level cost-reduction. 

### Project ψ

Project ψ (Parametric System Instruction) was a project which explored hardware configuration, definition and assembly to it's manufacturing limit. This was the next stage in the evolution of this project. Project rho proved that there was no way in principle to establish a modular family which satisfied all requirements. From this the idea of the psi terminal was developed which said that some terminal should exist which takes in 'system-codes' which serve to identify a system in terms of it's properties.

### Project μ

Projct mu was a nessecary bleding of both projects with added features. and mupy was a python implementation.


## Roadmap

### Automated certification routines

This particular function is the golden function which would render this project truly powerful. Automated certification makes reference to the automation of a family code being injected into mupy. This function is desired for several reasons;

  - Family codes themselves are valuable, for each family code hat exists there exists anywhere from millions to quadrillions of permutations of renderings provided by mupy.
  - Scripted assemblies, if parameterized can be certified and this would make any scripter 1000 times as productive.
  - Encoding routines are automatically integrated into terminal.
  - New scad libraries could be integrated.
  - Makes namespace type 

### Contributing

Currently the best form of contribution would be to play offer suggestions for iprovement or they could develp scripts to be certified or open scad code to be certified (manually).


### Liscense



# FAQ
## Openscad

### How many system-codes are available?
Incalculable, since the family codes define thier own rules, it is difficult to measure the permutation count of parts. Currently in mupys infancy there are over a quadrillion parts. 

### What is the mupy interface?

    Command Line Interface - mucli (terminal interface)

    Applications Programming Interface - mu.core (scripting interface)

### Is it free?
Yes! but only the core technology is free, the various family code libraries which should each contain thier own license which states the conditions for use. In most cases it is free to use but read the license.

### Does mupy replace CAD?
Absolutely not, mupy is it's own thing. In some cases it may reduce the hours spent on CAD for people and in other cases it may increase the time people spend. In the future I see CAD applications just integrating a mucli-like application into it to get the best of both worlds.



### Contacts:

| Project Team          | Email                          |
| --------------------- | ------------------------------ |
| Michael C Ryan        | spacetime.engineer@gmail.com   |




<!-- ACKNOWLEDGMENTS -->
## Acknowledgments

* [Openscad Community](https://github.com/openscad/openscad)
* [Python community](https://www.python.org/)
* [PiPy community](https://www.python.org/)
* [Docker community](https://www.docker.com/)
