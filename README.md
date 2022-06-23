
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

μ-py or mupy is a shorthand for python manufacturing utility and reffers to a new system development tech implemented in the form of a python pip installable package. mupy essentially proposes a new way to design and distrubute technology with an emphasis on decentralization, modularity, configuration, parametrization, encodability and scaling. 

### Function
simulates operation, assembly and manufacturing
encodes syste


- Simulation

- Configuration

- Modularity

- Encodability

- Distribution

- Manufacturing


### Form
In it's current form it identifies as a horizontal abstraction layer which leverages and auguments the openscad programming language.

# Getting Started

## Linux Installation

### Prerequisites

    apt install openscad

### Install mupy

    pip3 install mu

## MacOS Installation

### Prerequisites

1.) Install homebrew  
    
    $ ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)" brew doctor
    
2.) Set python as an enviornmental varible. 

    $ export PATH="/usr/local/opt/python/libexec/bin:$PATH"
    
2.) Install git

    $ brew install git
    
3.) Install python3 and pip3 (https://docs.python-guide.org/starting/install3/osx/)

    $ brew install python3
    $ brew postinstall python3
    apt install openscad

### Install mupy

    pip3 install mu

## Windows Installation

### Prerequisites

1.) Install Python3 & pip3

    Navigate to https://www.python.org/downloads/
    
3.) Install git

    Navigate to https://gitforwindows.org/
    apt install openscad

### Install mupy

    pip3 install mu

### μ-terminal
μ comes with it bundled a command-line-interface application known as the μ-terminal or 'muterm' which behaves much like a linux terminal except that it only accepts special strings known as 'system codes'. muterm was developed to express to users μ's most rudimetry operation ; dispensing manufacturing resources for a given system code. To enter muterm, in the linux terminal

    :~$ ./muterm 

Obviously only certain system-codes will be valid for for input. A simple example can be expressed by the following operation.


## Docker Container ( optional )

If you prefer touse the provided docker image you will need to install docker at https://docs.docker.com/get-docker/ .

### Build image

    $ docker build -t mu .

### Run container

    $ docker run -i mu:latest


### SSH into container

 	$ docker exec -it mu:latest /bin/bash


# mucli

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

openscad is a programming language dedicated to defining 3D geometric bodies. It is highly intuitive and extremely powerful and mupy leverages its technology.

openscad can do things other tools cant but it is too mathy to get popular. 
mupy makes it easier to usr but leverages its power.


## Does mupy replace CAD
In general No, mupy is not a repacement for CAD however it may reduce the hours spent on CAD in many use cases because mupy essentially auguments CAD. 

In time a mu termianl of sorts may be developed by the CAD developers. mupy technology is simply a way of doing things and it is very very fast.


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
