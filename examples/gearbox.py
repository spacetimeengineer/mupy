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

""" Define Hardware Components"""
panel_c = mu.Hardware("panel_c", "CUBX0177-BPAN-B12P5SR4-X8Y8PP2-RF-SX25Y25-X1Y1-XO0YO0-X30Y30Z20-C")
panel_d = mu.Hardware("panel_d", "CUBX0177-BPAN-B12P5SR4-X8Y8PP2-RF-SX25Y25-X1Y1-XO0YO0-X30Y30Z20-C")
panel_e = mu.Hardware("panel_e", "CUBX0177-BPAN-B12P5SR4-X8Y8PP2-RF-SX25Y25-X1Y1-XO0YO0-X30Y30Z20-C")
panel_f = mu.Hardware("panel_f", "CUBX0177-BPAN-B12P5SR4-X8Y8PP2-RF-SX25Y25-X1Y1-XO0YO0-X30Y30Z20-C")






panel_a = mu.Hardware("panel_a", "CUBX0177-BPAN-B12P5SR4-X8Y8PP18-RF-SX0Y0-X8Y8-XO0YO0-X20Y20Z5-C")
bevel_gear_a = mu.Hardware("bevel_gear_a", "CRSPGR022-BG-M2-T34W25-P15H0C45-B0")

panel_gear_assembly_a = mu.Assembly("panel_gear_assembly_a")
panel_gear_assembly_a.include(panel_a, mu.Coordinates(0.1,0.4,[-100,0,0],[-18.5,0,0],[0,90,0],[0,90,0]))
panel_gear_assembly_a.include(bevel_gear_a, mu.Coordinates(0.1,0.4,[100,0,0],[7.25,0,0],[0,90,0],[0,720+90,0]))

flywheel_adapter_a = mu.Hardware("flywheel_adapter_a","CUBX0177-FYAD-B12P5SR4")
axle_adapter_a = mu.Hardware("axle_adapter_a","CUBX0177-AXAD-B12P5SR4-PP17")

axle_adapter_flywheel_adapter_assembly_a = mu.Assembly("axle_adapter_bearing_adapter_assembly_a")
axle_adapter_flywheel_adapter_assembly_a.include(flywheel_adapter_a, mu.Coordinates(0.1,0.4,[-100,0,0],[-18.5,0,0],[0,90,0],[0,90,0]))
axle_adapter_flywheel_adapter_assembly_a.include(axle_adapter_a, mu.Coordinates(0.1,0.4,[100,0,0],[7.25,0,0],[0,90,0],[0,90,0]))

panel_assembly_a = mu.Assembly("panel_assembly_a")
panel_assembly_a.include(panel_gear_assembly_a, mu.Coordinates(0.4,0.9,[-300,0,0],[-50,0,0],[0,180,0],[0,180,0]))
panel_assembly_a.include(axle_adapter_flywheel_adapter_assembly_a, mu.Coordinates(0.4,0.9,[300,0,0],[50,0,0],[0,0,0],[0,0,0]))








panel_b = mu.Hardware("panel_b", "CUBX0177-BPAN-B12P5SR4-X8Y8PP18-RF-SX0Y0-X8Y8-XO0YO0-X20Y20Z5-C")
bevel_gear_b = mu.Hardware("bevel_gear_b", "CRSPGR022-BG-M2-T34W25-P15H0C45-B0")

panel_gear_assembly_b = mu.Assembly("panel_gear_assembly_b")
panel_gear_assembly_b.include(panel_b, mu.Coordinates(0.1,0.4,[-100,0,0],[-18.5,0,0],[0,90,0],[0,90,0]))
panel_gear_assembly_b.include(bevel_gear_b, mu.Coordinates(0.1,0.4,[100,0,0],[7.25,0,0],[0,90,0],[0,720+90,0]))

flywheel_adapter_b = mu.Hardware("flywheel_adapter_b","CUBX0177-FYAD-B12P5SR4")
axle_adapter_b = mu.Hardware("axle_adapter_b","CUBX0177-AXAD-B12P5SR4-PP17")

axle_adapter_flywheel_adapter_assembly_b = mu.Assembly("axle_adapter_bearing_adapter_assembly_b")
axle_adapter_flywheel_adapter_assembly_b.include(flywheel_adapter_b, mu.Coordinates(0.1,0.4,[-100,0,0],[-18.5,0,0],[0,90,0],[0,90,0]))
axle_adapter_flywheel_adapter_assembly_b.include(axle_adapter_b, mu.Coordinates(0.1,0.4,[100,0,0],[7.25,0,0],[0,90,0],[0,90,0]))

panel_assembly_b = mu.Assembly("panel_assembly_b")
panel_assembly_b.include(panel_gear_assembly_b, mu.Coordinates(0.4,0.9,[-300,0,0],[-50,0,0],[0,180,0],[0,180,0]))
panel_assembly_b.include(axle_adapter_flywheel_adapter_assembly_b, mu.Coordinates(0.4,0.9,[300,0,0],[50,0,0],[0,0,0],[0,0,0]))







""" Define assembly. """
alpha = 200 
gearbox_assembly = mu.Assembly("gearbox_assembly")
gearbox_assembly.include(panel_assembly_a, mu.Coordinates(0.1,0.9,[0, 0 , 8 * 12.5 / 2 + 500],[0, 0 , 8 * 12.5 / 2 + 50],[0,-90,0],[0,-90,0]))
gearbox_assembly.include(panel_assembly_b, mu.Coordinates(0.1,0.9,[0, 8 * 12.5 / 2 + 500, 0],[0, 8 * 12.5 / 2 + 50, 0],[-90,0,90],[-90,0,90]))
gearbox_assembly.include(panel_c, mu.Coordinates(0.1,0.9,[ - 8 * 12.5 / 2 - alpha, 0, 0 ],[ - 8 * 12.5 / 2, 0, 0 ],[0,-90,0],[0,-90,0]))
gearbox_assembly.include(panel_d, mu.Coordinates(0.1,0.9,[0 , 0, -8 * 12.5 / 2 - alpha],[0 , 0, -8 * 12.5 / 2 ],[0,180,0],[0,180,0]))
gearbox_assembly.include(panel_e, mu.Coordinates(0.1,0.9,[0, - 8 * 12.5 / 2 - alpha, 0 ],[0, - 8 * 12.5 / 2, 0 ],[90,0,0],[90,0,0]))
gearbox_assembly.include(panel_f, mu.Coordinates(0.1,0.9,[8 * 12.5 / 2 + alpha, 0 , 0],[8 * 12.5 / 2, 0 , 0],[90,0,90],[90,0,90]))





""" Run """
workspace.run(gearbox_assembly, mu.Coordinates(0,1,[0,0,0],[0,0,0],[0,0,0],[0,0,0]))