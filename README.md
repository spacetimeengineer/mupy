### μ : Manufacturing Utility

μ is a novel technology implemented in the form of an open source (3-Clause BSD) python pip installable package. More specifically it can be thought of as a horizontal abstraction library which leverages and auguments the openscad programming language. On the most fundemental level however, mu is really a manufacturing-oriented data-compression algorithm. μ was born out of a home grown R&D operation which aimed to acomplish the following tasks :

- Maximize the utilization of 3D printing for economio / research and development
- Develop a decentralized manufacturing utility with a system-script or system-code.
- Give ambitious engineers a chance to develop 



### μ-terminal
μ comes with it bundled a command-line-interface application known as the μ-terminal or 'muterm' which behaves much like a linux terminal except that it only accepts special strings known as 'system codes'. muterm was developed to express to users μ's most rudimetry operation ; producing manufacturing resources for a given system code. In an idealized world, this utility would materialize an entire system (such as a 69 SS Chevelle) right in front of you upon pressing 'enter'. To enter muterm, in the linux terminal

    :~$ ./muterm 

Obviously only certain system-codes will be valid for for input. A simple example can be expressed by the following operation.


    μ:# CUBX0006-BLK-L1000W200H15
    

### System Codes
System codes are essentially encodings or simple-string representations of physical hardware or assemblies with specific intended geometry and dispenses digital renderings, simulations, resources and metadata upon pressing enter.


### System Schemas
System schemas also sometimes refered to less generally as hardware schemas are a pattern or archetype constant associated the form that defines the hardware itself. THese are best momemorized becasue one can more actuartly imagine parts if theyjust use the abstraction.

### System Sets
Any system code with unspecified parameters ; rendering a set of possible system configuration. the mu package cannot handle these objects yet but soon it will. 

### Claim 

mu represents a technology which would eventually be required (in conjuction with other technologies such as AI, Quantum Computers, Cryptocurrency, ) to achieve a type 1 civilization. Mu prescribes a pathway to the development of the future and a new way to consider and even execute the future in a way that should amke everybody happy.  

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



### Prerequisites

    apt install openscad

### Installation

    pip3 install psi


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


