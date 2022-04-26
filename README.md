
```bash

tree

```

# μ : manufacturing utility

μ is a novel technology and super-utility implemented in the form of an open source (3-Clause BSD) python pip installable package. More specifically it can be thought of as a horizontal abstraction layer which leverages and auguments the openscad programming language. On the more fundemental level however μ is really just a manufacturing-oriented compression algorithm ; It stores information, instructions and an incalculable amount of 3D printable renderings with discernable non-trivial differences in geometry and it's all just under one megabyte. The basic idea was to use this enviornment to develop extremely large systems but the modular aspect of this gave users configuration freedonm as well as a low cost alternative to development, Since everything was modular then we could take advantage of smaller manufcturing systems.

# History
This package was developed over six-year period where it bec as an internal utility to an innovation operation. When openscad was discovered by the author he became interested in modular hardware development. He believed that modular hardware developement would lead to the development of larger productswhich themselves could benifet from the efficiency of scale. Over time the parametrization that emerged from completed source code made it difficult to keep track of specific part implementations so an encoding scheme was developed to track these parts. Eventially a python package was designed to handle the rendersings by simple python3 libraires.

### Disclaimer

Everything discussed in this README.md deals with what it handles not what it does of mu in conjunction with an informed & motivated user. μ in it's current state is much like a programming language with no applications built.

### Prerequisites

    apt install openscad

### Installation

    pip3 install mu


# Goals
μ attempts to serve as a must-own utility for any serious engineer which gives users access to virtually unlimited parts the ability to design physical systems in a simple script format.



# Does it replace the need for CAD
In some cases it may, especially for users who need to design something quick and beautiful but who would prefer not to learn an entire IDE but in most cases it only auguments CAD and it would be more likely in the future that IDEs would integrate some μ-terminal instance into the IDE.

# Does it replace the need for Thingaverse
mu is similar to thingaverse except that thingaverse is more art driven. mu is precision driven.

### μ-terminal
μ comes with it bundled a command-line-interface application known as the μ-terminal or 'muterm' which behaves much like a linux terminal except that it only accepts special strings known as 'system codes'. muterm was developed to express to users μ's most rudimetry operation ; producing manufacturing resources for a given system code. In an idealized world, this utility would materialize an entire system (such as a 69 SS Chevelle) right in front of you upon pressing 'enter'. To enter muterm, in the linux terminal

    :~$ ./muterm 

Obviously only certain system-codes will be valid for for input. A simple example can be expressed by the following operation.

### A simple example
The CUBX0006 family was created for basic cubic stuctures ( there is only one CUBX0006 type : 'BLK' which stands for 'block' ) ; all 90 degree angles. It is one of the simplest. Here this code will generate a CUBX0006 rendering

    μ:# CUBX0006-BLK-L1000W200H15
    


![Alt Text](resources/CUBX0006-BLK-L1000W200H15.png)


### System Codes
A system-code serves to identify a general system (literally anything physical,especially technological or worth manufacturing) and generate resources and metadata which help users manufacture said system at reduced cost. These resources include CAD files and annotated openscad source code directories containing assembly and operational animation routines which help users record and transmit and intepret complex manufacturing and assembly information.


### System Schemas
System schemas also sometimes refered to less generally as hardware schemas are a pattern or archetype constant associated the form that defines the hardware itself. THese are best momemorized becasue one can more actuartly imagine parts if theyjust use the abstraction.

### System Sets
Any system code with unspecified parameters ; rendering a set of possible system configuration. the mu package cannot handle these objects yet but soon it will. 



### Concept

Can you take an R&D operation and find a better way to store, recall, assemble developed parts? Some kind of ingestion tool which 


### Scripting : hardware scripting

### Scripting : assembly scripting



### Certification
Originally there needed to be a way to ingest and store work from previous jobs.

Certification referes to the most powerful abstraction PSI offers is by far the highest value add to PSI and it's users. 
Certification refers to the process of one converting a well designed (python3 / openscad) script into a well defined well paramaterized family code which would express the same rules and features expressed by other hardware families. The scripting feature already gives users the ability to design and distribute thier designs but the certification process renders these designs into building blocks. In this way new users will have great ease developeing advanced systems.


### Scripting


### Current State

PSI in its current state exists much like Excaliber locked in it's stone ; Powerful but useless to those who have no vision and unable to wield it.

Due to the fact that there is a single developer, there is only a handful of hardware technologies. In another year or two there will be many more but limited to a single developers vision. 

### Docker ( optional )

If you prefer touse the provided docker image you will need to install docker at https://docs.docker.com/get-docker/ .


### Contacts:

| Project Team          | Email                          |
| --------------------- | ------------------------------ |
| Michael C Ryan        | spacetime.engineer@gmail.com   |



### Foo.py
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




### Interface


| Acronym               | Meaning                              |
| --------------------- | ------------------------------------ |
| (API)                 | Applications Programming Interface   |
| (CLI)  ( ψ:# )        | Command Line Interface               |



### Scope
This systems scope is just too large to even discuss. It was named manufacturing utility becasue it was meant to b an open source super tool which could help model the waywe build the future.

### Claim 
mu represents a technology which would eventually be required (in conjuction with other technologies such as AI, Quantum Computers, Cryptocurrency, ) to achieve a type 1 civilization. Mu prescribes a pathway to the development of the future and a new way to consider and even execute the future in a way that should amke everybody happy.  
