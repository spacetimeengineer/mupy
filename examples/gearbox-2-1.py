#!/usr/bin/env python3

"""
Note to user : This script as seen on github is used to illustrate the power of mupy parameterization and how it can be manipulated with python calls.
"""

""" Required Libray Imports. """
from pathlib import Path # Imports library nessecary for fetching terminal path information.
import mupy.core as mu # Imports mupy library.

""" Set Up Workspace. """
workspace_name = "gear_box_test" # Workspace name ; this will be the name of the workspace directory.
workspace = mu.WorkSpace(str(Path.home())+"/"+workspace_name) # Creates workspace.

""" Parametrization"""

block_length = 7.5
shaft_radius = 2.18
x_block_units = 8
y_block_units = 8

""" System-Code Formating"""

block_length = str(block_length).replace(".", "P", 1)
shaft_radius = str(shaft_radius).replace(".", "P", 1)
x_block_units = str(x_block_units)
y_block_units = str(y_block_units)
bearing_insert_radius_mm = 16

""" Define Hardware Components"""

panel_c = mu.Hardware("panel_c", "CUBX0177-BPAN-B"+block_length+"SR"+shaft_radius+"-X"+x_block_units+"Y"+y_block_units+"PP2-RF-SX25Y25-X1Y1-XO0YO0-X30Y30Z20-C")
panel_d = mu.Hardware("panel_d", "CUBX0177-BPAN-B"+block_length+"SR"+shaft_radius+"-X"+x_block_units+"Y"+y_block_units+"PP2-RF-SX25Y25-X1Y1-XO0YO0-X30Y30Z20-C")
panel_e = mu.Hardware("panel_e", "CUBX0177-BPAN-B"+block_length+"SR"+shaft_radius+"-X"+x_block_units+"Y"+y_block_units+"PP2-RF-SX25Y25-X1Y1-XO0YO0-X30Y30Z20-C")
panel_f = mu.Hardware("panel_f", "CUBX0177-BPAN-B"+block_length+"SR"+shaft_radius+"-X"+x_block_units+"Y"+y_block_units+"PP2-RF-SX25Y25-X1Y1-XO0YO0-X30Y30Z20-C")

panel_a = mu.Hardware("panel_a", "CUBX0177-BPAN-B"+block_length+"SR"+shaft_radius+"-X8Y8PP18-RF-SX25Y25-X1Y1-XO0YO0-X16Y16Z20-C")
bevel_gear_a = mu.Hardware("bevel_gear_a", "CRSPGR022-BG-M1P73-T40W9-P15H0C45-B4P95")
bevel_gear_a.color="blue"

panel_gear_assembly_a = mu.Assembly("panel_gear_assembly_a")
panel_gear_assembly_a.include(panel_a, mu.Coordinates(0.1,0.4,[-100,0,0],[-18.5,0,0],[180,90,0],[180,90,0]))
panel_gear_assembly_a.include(bevel_gear_a, mu.Coordinates(0.1,0.4,[100,0,0],[7.25,0,0],[0,90,0],[0,90,0]))

flywheel_adapter_a = mu.Hardware("flywheel_adapter_a","CUBX0177-FYAD-B12P5SR4")
axle_adapter_a = mu.Hardware("axle_adapter_a","CUBX0177-AXAD-B12P5SR4-PP17")

axle_adapter_flywheel_adapter_assembly_a = mu.Assembly("axle_adapter_bearing_adapter_assembly_a")
axle_adapter_flywheel_adapter_assembly_a.include(flywheel_adapter_a, mu.Coordinates(0.1,0.4,[-50,0,0],[-18.5,0,0],[0,90,0],[0,90,0]))
axle_adapter_flywheel_adapter_assembly_a.include(axle_adapter_a, mu.Coordinates(0.1,0.4,[50,0,0],[7.25,0,0],[0,90,0],[0,90,0]))

panel_assembly_a = mu.Assembly("panel_assembly_a")

panel_assembly_a.include(panel_gear_assembly_a, mu.Coordinates(0.4,0.9,[-100,0,0],[-50,0,0],[0,180,0],[0,180,0]))
panel_assembly_a.include(axle_adapter_flywheel_adapter_assembly_a, mu.Coordinates(0.4,0.9,[100,0,0],[50,0,0],[0,0,0],[0,0,0]))

panel_b = mu.Hardware("panel_b", "CUBX0177-BPAN-B"+block_length+"SR"+shaft_radius+"-X8Y8PP18-RF-SX25Y25-X1Y1-XO0YO0-X16Y16Z20-C")
bevel_gear_b = mu.Hardware("bevel_gear_b", "CRSPGR022-BG-M1P75-T20W9-P15H0C45-B4P9")

panel_gear_assembly_b = mu.Assembly("panel_gear_assembly_b")
panel_gear_assembly_b.include(panel_b, mu.Coordinates(0.1,0.4,[-100,0,0],[-18.5,0,0],[180,90,0],[180,90,0]))
panel_gear_assembly_b.include(bevel_gear_b, mu.Coordinates(0.1,0.4,[100,0,0],[7.25,0,0],[0,90,0],[0,90,0]))
panel_gear_assembly_b.color="red"
flywheel_adapter_b = mu.Hardware("flywheel_adapter_b","CUBX0177-FYAD-B12P5SR4")
axle_adapter_b = mu.Hardware("axle_adapter_b","CUBX0177-AXAD-B12P5SR4-PP17")

axle_adapter_flywheel_adapter_assembly_b = mu.Assembly("axle_adapter_bearing_adapter_assembly_b")
axle_adapter_flywheel_adapter_assembly_b.include(flywheel_adapter_b, mu.Coordinates(0.1,0.4,[-50,0,0],[-18.5,0,0],[0,90,0],[0,90,0]))
axle_adapter_flywheel_adapter_assembly_b.include(axle_adapter_b, mu.Coordinates(0.1,0.4,[50,0,0],[7.25,0,0],[0,90,0],[0,90,0]))

panel_assembly_b = mu.Assembly("panel_assembly_b")
panel_assembly_b.include(panel_gear_assembly_b, mu.Coordinates(0.4,0.9,[-50,0,0],[-50,0,0],[0,180,0],[0,180,0]))
panel_assembly_b.include(axle_adapter_flywheel_adapter_assembly_b, mu.Coordinates(0.4,0.9,[300,0,0],[50,0,0],[0,0,0],[0,0,0]))

bearing_security_cap = mu.Hardware("bearing_security_cap_b","CUBX0177-BPANS2-B7P5SR2P2-X10Y10PP21-RF-SX0Y0-X1Y1-XO0YO0-X45Y45Z6-S-SX0Y0-X1Y1-XO0YO0-X12Y12Z15-S")
#bearing_security_cap = mu.Hardware("CUBX0177-SPANS2-B7P5SR2P2-X6Y6-SX0Y0-X1Y1-XO0YO0-X18Y18Z0P75-C-SX0Y0-X1Y1-XO0YO0-X7P5Y7P5Z10-S")

alpha = 200 
gearbox_assembly = mu.Assembly("gearbox_assembly")
gearbox_assembly.include(panel_assembly_a, mu.Coordinates(0,0.98,[0, 0 , 8 * float(block_length.replace("P", ".", 1)) / 2 + 500],[0, 0 , 8 * float(block_length.replace("P", ".", 1)) / 2 + 25],[0,-90,0],[0,-90,0]))
gearbox_assembly.include(panel_assembly_b, mu.Coordinates(0,0.98,[0, 8 * float(block_length.replace("P", ".", 1)) / 2 + 500, 0],[0, 8 * float(block_length.replace("P", ".", 1)) / 2 + 25, 0],[-90,0,90],[-90,0,90]))
gearbox_assembly.include(panel_c, mu.Coordinates(0.02,0.98,[ - 8 * float(block_length.replace("P", ".", 1)) / 2 - alpha, 0, 0 ],[ - 8 * float(block_length.replace("P", ".", 1)) / 2, 0, 0 ],[0,-90,0],[0,-90,0]))
gearbox_assembly.include(panel_d, mu.Coordinates(0.02,0.98,[0 , 0, -8 * float(block_length.replace("P", ".", 1)) / 2 - alpha],[0 , 0, -8 * float(block_length.replace("P", ".", 1)) / 2 ],[0,180,0],[0,180,0]))
gearbox_assembly.include(panel_e, mu.Coordinates(0.02,0.98,[0, - 8 * float(block_length.replace("P", ".", 1)) / 2 - alpha, 0 ],[0, - 8 * float(block_length.replace("P", ".", 1)) / 2, 0 ],[90,0,0],[90,0,0]))
gearbox_assembly.include(panel_f, mu.Coordinates(0.02,0.98,[8 * float(block_length.replace("P", ".", 1)) / 2 + alpha, 0 , 0],[8 * float(block_length.replace("P", ".", 1)) / 2, 0 , 0],[90,0,90],[90,0,90]))

workspace.run(gearbox_assembly, mu.Coordinates(0,1,[0,0,0],[0,0,0],[0,0,0],[0,0,0]))


# Print Manifest

CRSPGR022-BG-M1P73-T20W9-P15H0C45-B4P95 X 1
CUBX0177-BPIN-B7P5SR2P2-PL7PR1P2 X 6
UBX0177-AXAD-B7P5SR2P2-PP17
