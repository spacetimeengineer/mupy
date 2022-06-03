
<!-- TABLE OF CONTENTS -->
<details>
  <summary>Table of Contents</summary>
  <ol>
    <li>
      <a href="#about-the-project">About The Project</a>
      <ul>
        <li><a href="#built-with">Built With</a></li>
      </ul>
    </li>
    <li>
      <a href="#getting-started">Getting Started</a>
      <ul>
        <li><a href="#prerequisites">Prerequisites</a></li>
        <li><a href="#installation">Installation</a></li>
      </ul>
    </li>
    <li><a href="#usage">Usage</a></li>
    <li><a href="#roadmap">Roadmap</a></li>
    <li><a href="#contributing">Contributing</a></li>
    <li><a href="#license">License</a></li>
    <li><a href="#contacts">Contact</a></li>
    <li><a href="#acknowledgments">Acknowledgments</a></li>
  </ol>
</details>

# About This Project

## mupy : manufacturing utility

μ reffers to a novel technology & utility implemented in the form of an open source (3-Clause BSD) python pip installable package. In it's current form it identifies as a horizontal abstraction layer which leverages and auguments the openscad programming language. It's primary function is to help users develop anything 

## History
This package was developed over 4 year period where it began as an internal utility (project rho) which supported a small innovation operation. When openscad was discovered by the author he became interested in modular hardware development. Due to the scripting interface, paramaterization was natural. (project psi)He believed that modular hardware developement would lead to the development of larger products which themselves could benifet from the efficiency of scale. Over time the parametrization that emerged from completed source code made it difficult to keep track of specific part implementations so an encoding scheme was developed to track these parts. Eventially a python package was designed to handle the rendersings by simple python3 libraires.

### Project ρ

Project ρ (Recursive Hardware Operations) was a project which explored hardware modularity to it's manufacturing limit. This was mostly implemented with 3D printers and the main goal of this project was to create hardware families which could satisfy a great deal of requirements pertaining to the possible decentralized development of large scale systems which granted effeciency-of-scale level cost-reduction. 

### Project ψ

Project ψ (Parametric System Instruction) was a project which explored hardware configuration, definition and assembly to it's 

### Project μ

Projct mu was a nessecary bleding of both projects. and mupy was a python implementation.

# Getting Started

## Linux Installation

### Prerequisites

    apt install openscad

### Install mupy

    pip3 install mu

## MacOS Installation

### Prerequisites

    apt install openscad

### Install mupy

    pip3 install mu

## Windows Installation

### Prerequisites

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



## Examples

### muterm

The CUBX0006 family was created for basic cubic stuctures ( there is only one CUBX0006 type : 'BLK' which stands for 'block' ) ; all 90 degree angles. It is one of the simplest hardware families and this system code 'CUBX0006-BLK-L1000W200H15' will dispense a CUBX0006 rendering of 'Block' type with a length of 1000mm, a width of 200mm and a height of 15mm.

    μ:# CUBX0006-BLK-L1000W200H15
    


![Alt Text](resources/CUBX0006-BLK-L1000W200H15.png)

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


### System Schemas
System schemas also sometimes refered to less generally as hardware schemas are a pattern or archetype constant associated the form that defines the hardware itself. THese are best momemorized becasue one can more actuartly imagine parts if theyjust use the abstraction.

### System Sets
Any system code with unspecified parameters ; rendering a set of possible system configuration. the mu package cannot handle these objects yet but soon it will. 


### Certification
Certification can be thought of as a second order abstraction or iteration of the technology onto itself ; if one writes a script with the μ package and invokes a collection of system codes into an assembly then they should be able to identify some naturally occuring parameterization scheme once the system is optimized and second to assign a system schema to this assembly giving it configuration freedom within a single string and invokable from the μ-terminal. After this certification is complete, the mu termal can generate some corresponding assembly with just a single system code. Currently this process is manual and the best practices regarding this operation have not been identified as of this time.


One of the original purposes of mu in it's inception was a place to store old works. If a prototype had been developed then the parts or prototype itself would be cleaned and parameterized and then certified so that the system is now larger and more capable while at the same time the parts and any derividives are retained.

### Contributing




### Liscense




### Contacts:

| Project Team          | Email                          |
| --------------------- | ------------------------------ |
| Michael C Ryan        | spacetime.engineer@gmail.com   |




<!-- ACKNOWLEDGMENTS -->
## Acknowledgments

* [openscad Community](https://github.com/openscad/openscad)
* [python community](https://www.python.org/)