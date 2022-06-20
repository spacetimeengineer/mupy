#!/usr/bin/env python3


from pathlib import Path
import mupy.core as mu



# A workspace represents a virtual 3D spce which serves as a virtual workbench except it is not a surface but a space.
""" Set Up Workspace """

workspace = mu.WorkSpace(str(Path.home())+"/utility_box")

""" Define Hardware Components"""
# Declare Hardware codes and unique part names.
panel_a = mu.Hardware("panel_a", "CUBX0177-BPAN-B25SR0-X8Y8PP2-RF-SX5Y3-X10Y5-XO0YO0-X5Y5Z10-S") # Constructs panel : This hardware component is a box panel of a CUBX0177 class hardware component. This CUBX0177 component
panel_b = mu.Hardware("panel_b", "CUBX0177-BPAN-B25SR0-X8Y8PP2-RT-SX5Y3-X0Y0-XO0YO0-X10Y10Z10-C") # Constructs panel A
panel_c = mu.Hardware("panel_c", "CUBX0177-BPAN-B25SR0-X8Y8PP2-RT-SX5Y10-X3Y8-XO0YO0-X5Y5Z10-S")
panel_d = mu.Hardware("panel_d", "CUBX0177-BPAN-B25SR0-X8Y8PP2-RF-SX5Y10-X8Y2-XO0YO0-X7Y5Z10-C")
panel_e = mu.Hardware("panel_e", "CUBX0177-BPAN-B25SR0-X8Y8PP2-RT-SX5Y5-X6Y3-XO0YO0-X10Y10Z10-S")
panel_f = mu.Hardware("panel_f", "CUBX0177-BPAN-B25SR0-X8Y8PP2-RF-SX5Y5-X0Y0-XO0YO0-X5Y5Z10-C")

"""Define Assembly"""

alpha = 200 # 'alpha' is an example of a 'nessecary factor' which if one is to parameterize a system then these may show up. In this case 'alpha' refers to the distance in millimeters that this particular utility box requires for it to be 'assembled'. These nessecary factors are often canidates for parameters which are to be certified for an encoding schema.
chamber_assembly = mu.Assembly("chamber_assembly") # Name the assembly.
chamber_assembly.include(panel_a, mu.Coordinates(0,1,[0, 0 , 8 * 25 / 2 + alpha],[0, 0 , 8 * 25 / 2 ],[0,0,0],[0,0,0])) # Coordinates complete!
chamber_assembly.include(panel_b, mu.Coordinates(0,1,[0, 8 * 25 / 2 + alpha, 0],[0, 8 * 25 / 2, 0],[0,0,0],[-90,0,0])) # Coordinates complete!
chamber_assembly.include(panel_c, mu.Coordinates(0,1,[ - 8 * 25 / 2 - alpha, 0, 0 ],[ - 8 * 25 / 2, 0, 0 ],[0,0,0],[0,-90,0])) # Coordinates complete!
chamber_assembly.include(panel_d, mu.Coordinates(0,1,[0 , 0, -8 * 25 / 2 - alpha],[0 , 0, -8 * 25 / 2 ],[0,0,0],[0,180,0])) # Coordinates complete!
chamber_assembly.include(panel_e, mu.Coordinates(0,1,[0, - 8 * 25 / 2 - alpha, 0 ],[0, - 8 * 25 / 2, 0 ],[0,0,0],[90,0,0])) # Coordinates complete!
chamber_assembly.include(panel_f, mu.Coordinates(0,1,[8 * 25 / 2 + alpha, 0 , 0],[8 * 25 / 2, 0 , 0],[0,0,0],[90,0,90])) # Coordinates complete!

workspace.run(chamber_assembly, mu.Coordinates(0,1,[0,0,0],[0,0,0],[0,0,0],[0,0,0]))







# Here is the thing -> I need a way to seamlessly classify and paramaterize and certify this script for encoding sessions.



