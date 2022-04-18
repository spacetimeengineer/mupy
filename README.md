### PSI ( Parametric System Instructions )

PSI is a strange but a powerful and proven technology which was born from an absolute nessecity to build big things. 




### Certification

Certification referes to the most powerful abstraction PSI offers is by far the highest value add to PSI and it's users. 
Certification refers to the process of one converting a well designed (python3 / openscad) script into a well defined well paramaterized family code which would express the same rules and features expressed by other hardware families. The scripting feature already gives users the ability to design and distribute thier designs but the certification process renders these designs into building blocks. In this way new users will have great ease developeing advanced systems.

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
