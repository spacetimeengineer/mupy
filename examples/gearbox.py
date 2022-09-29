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
gear_ratio = 2

""" System-Code Formating"""

block_length = str(block_length).replace(".", "P", 1)
shaft_radius = str(shaft_radius).replace(".", "P", 1)
x_block_units = str(x_block_units)
y_block_units = str(y_block_units)
bearing_insert_radius_mm = 16

""" Define Hardware Components"""
panel_b = mu.Hardware("panel_c", "CUBX0177-BPANS2-B"+block_length+"SR"+shaft_radius+"-X"+x_block_units+"Y"+y_block_units+"PP25-RF-SX0Y0-X1Y1-XO0YO0-X30Y30Z6-S-SX0Y0-X1Y1-XO0YO0-X16Y16Z15-S")
panel_c = mu.Hardware("panel_c", "CUBX0177-BPANS2-B"+block_length+"SR"+shaft_radius+"-X"+x_block_units+"Y"+y_block_units+"PP25-RF-SX0Y0-X1Y1-XO0YO0-X30Y30Z6-S-SX0Y0-X1Y1-XO0YO0-X16Y16Z15-S")
panel_d = mu.Hardware("panel_d", "CUBX0177-BPANS2-B"+block_length+"SR"+shaft_radius+"-X"+x_block_units+"Y"+y_block_units+"PP25-RF-SX0Y0-X1Y1-XO0YO0-X30Y30Z6-S-SX0Y0-X1Y1-XO0YO0-X16Y16Z15-S")
panel_e = mu.Hardware("panel_e", "CUBX0177-BPANS2-B"+block_length+"SR"+shaft_radius+"-X"+x_block_units+"Y"+y_block_units+"PP25-RF-SX0Y0-X1Y1-XO0YO0-X30Y30Z6-S-SX0Y0-X1Y1-XO0YO0-X16Y16Z15-S")
panel_f = mu.Hardware("panel_f", "CUBX0177-BPANS2-B"+block_length+"SR"+shaft_radius+"-X"+x_block_units+"Y"+y_block_units+"PP25-RF-SX0Y0-X1Y1-XO0YO0-X30Y30Z6-S-SX0Y0-X1Y1-XO0YO0-X16Y16Z15-S")


def panel_bearing_assembly_a():
    
    panel_bearing_assembly_a = mu.Assembly("panel_bearing_assembly_a")
    panel_a = mu.Hardware("panel_a", "CUBX0177-BPAN-B"+block_length+"SR"+shaft_radius+"-X8Y8PP18-RF-SX25Y25-X1Y1-XO0YO0-X16Y16Z20-C")
    panel_a.color = "#4287f5"
    panel_bearing_assembly_a.include(panel_a, mu.Coordinates(t0 = 0.1, tf = 0.4, x0 = 100 ,xf = 0, a0 = 180, b0 = 90, af = 180, bf = 90))
    panel_bearing_assembly_a.include(mu.Hardware("bearing", "CYLX0006-PIP-L5O8I2P5"), mu.Coordinates(t0 = 0.1, tf = 0.4, x0 = -40 ,xf = -1, a0 = 180, b0 = 90, af = 180, bf = 90))
    
    return panel_bearing_assembly_a
    

def panel_gear_assembly_a():
    
    panel_gear_assembly_a = mu.Assembly("panel_gear_assembly_a")
    primary_shaft_bolt = mu.Hardware("primary_shaft_bolt_a",   "BOLTX0004-B1024-HEX-L50D7H3")
    panel_gear_assembly_a.include(primary_shaft_bolt,              mu.Coordinates(t0 = 0.1, tf = 0.4, x0 = 300, xf = 16,   b0 = 90, bf = 90, c0 = 180, cf = 180))
    primary_shaft_bolt.color = "silver"
    panel_gear_assembly_a.include(mu.Hardware("shaft_small_washer_1_a", "CYLX0006-PIP-L0P3175O4P7625I2P1844"),       mu.Coordinates(t0 = 0.1, tf = 0.4,   x0 = 160, xf = 15,     b0 = 90,  bf = 90,  c0 = 180, cf = 180))
    panel_gear_assembly_a.include(mu.Hardware("shaft_large_washer_1_a", "CYLX0006-PIP-L0P3175O9P525I3P175"),         mu.Coordinates(t0 = 0.1, tf = 0.4,   x0 = 140, xf = 14.8,   b0 = 90,  bf = 90))
    
    
    bevel_gear = mu.Hardware("bevel_gear_a","CRSPGR022-BG-M1P73-T20W9-P15H0C45-B4P95")
    bevel_gear.color = "yellow"
    panel_gear_assembly_a.include(bevel_gear,  mu.Coordinates(t0 = 0.1, tf = 0.4, x0 = 120, xf = 7.25, b0 = 90, bf = 90))
    
    
    panel_gear_assembly_a.include(mu.Hardware("shaft_large_washer_2_a", "CYLX0006-PIP-L0P3175O9P525I3P175"),         mu.Coordinates(t0 = 0.1, tf = 0.4,   x0 = 100,  xf = 7.15,  b0 = 90,  bf = 90))
    panel_gear_assembly_a.include(mu.Hardware("shaft_small_washer_2_a", "CYLX0006-PIP-L0P3175O4P7625I2P1844"),       mu.Coordinates(t0 = 0.1, tf = 0.4,   x0 = 80,   xf = 7,     b0 = 90,  bf = 90))
    panel_gear_assembly_a.include(mu.Hardware("shaft_small_washer_3_a", "CYLX0006-PIP-L0P3175O4P7625I2P1844"),       mu.Coordinates(t0 = 0.1, tf = 0.4,   x0 = 60,   xf = 2,     b0 = 90,  bf = 90))
    panel_gear_assembly_a.include(mu.Hardware("shaft_locknut_a_1",      "BOLTX0004-N1024-HEX-D10H5"),                mu.Coordinates(t0 = 0.1, tf = 0.4,   x0 = 40,   xf = 4,     b0 = 90,  bf = 90))
    panel_gear_assembly_a.include(mu.Hardware("shaft_small_washer_4_a", "CYLX0006-PIP-L0P3175O4P7625I2P1844"),       mu.Coordinates(t0 = 0.1, tf = 0.4,   x0 = 20,   xf = 1,     b0 = 90,  bf = 90))
    panel_gear_assembly_a.include(panel_bearing_assembly_a(),                                                        mu.Coordinates(t0 = 0.1, tf = 0.4,   x0 = -70,  xf = 0,     a0 = 180, b0 = 0,   af = 180, bf = 0))
    panel_gear_assembly_a.include(mu.Hardware("shaft_small_washer_5_a", "CYLX0006-PIP-L0P3175O4P7625I2P1844"),       mu.Coordinates(t0 = 0.1, tf = 0.4,   x0 = -150, xf = -4,    a0 = 180, b0 = 90,  af = 180, bf = 90))
    panel_gear_assembly_a.include(mu.Hardware("shaft_locknut_2_a",      "BOLTX0004-N1024-HEX-D10H5"),                mu.Coordinates(t0 = 0.1, tf = 0.4,   x0 = -160, xf = -7,    a0 = 180, b0 = 90,  af = 180, bf = 90))
    panel_gear_assembly_a.include(mu.Hardware("shaft_locknut_3_a",      "BOLTX0004-N1024-HEX-D10H5"),                mu.Coordinates(t0 = 0.1, tf = 0.4,   x0 = -180, xf = -12.1, a0 = 180, b0 = 90,  af = 180, bf = 90))
    panel_gear_assembly_a.include(mu.Hardware("shaft_locknut_4_a",      "BOLTX0004-N1024-HEX-D10H5"),                mu.Coordinates(t0 = 0.1, tf = 0.4,   x0 = -190, xf = -17.2, a0 = 180, b0 = 90,  af = 180, bf = 90))
    panel_gear_assembly_a.include(mu.Hardware("shaft_small_washer_6_a", "CYLX0006-PIP-L0P3175O4P7625I2P1844"),       mu.Coordinates(t0 = 0.1, tf = 0.4,   x0 = -200, xf = -20,   a0 = 180, b0 = 90,  af = 180, bf = 90))

    return panel_gear_assembly_a


def bearing_security_cap_panel_assembly():
    
    bearing_security_cap_panel_assembly = mu.Assembly("bearing_security_cap_panel_assembly")
    
    flywheel_adapter_a = mu.Hardware("flywheel_adapter_a","CUBX0177-FYAD-B7P5SR"+shaft_radius)
    primary_shaft_bolt_1_a = mu.Hardware("primary_shaft_bolt_1_a", "BOLTX0004-B832-HEX-L25P4D4H2P5")
    primary_shaft_bolt_2_a = mu.Hardware("primary_shaft_bolt_2_a", "BOLTX0004-B832-HEX-L25P4D4H2P5")
    primary_shaft_bolt_3_a = mu.Hardware("primary_shaft_bolt_3_a", "BOLTX0004-B832-HEX-L25P4D4H2P5")
    primary_shaft_bolt_4_a = mu.Hardware("primary_shaft_bolt_4_a", "BOLTX0004-B832-HEX-L25P4D4H2P5")
   
    bearing_security_cap_a = mu.Hardware("bearing_security_cap_a", "BOLTX0004-B1024-HEX-L22D10H5")
    
    bearing_security_cap_panel_assembly.include(panel_gear_assembly_a(), mu.Coordinates(0.1,0.9,[0,0,0],[0,0,0],[0,90,0],[0,90,0]))
    bearing_security_cap_panel_assembly.include(bearing_security_cap_a, mu.Coordinates(0.1,0.9,[0,0,0],[0,0,0],[0,90,0],[0,90,0]))
    
    bearing_security_cap_panel_assembly.include(fastening_assembly(), mu.Coordinates(0.1,0.9,[0,0,0],[0,0,0],[0,90,0],[0,90,0]))
    bearing_security_cap_panel_assembly.include(fastening_assembly(), mu.Coordinates(0.1,0.9,[0,0,0],[0,0,0],[0,90,0],[0,90,0]))

    return bearing_security_cap_panel_assembly
    



'''

def flywheel_adapter_panel_set_assembly():
    
    flywheel_adapter_panel_set_assembly.include(flywheel_adapter_boltset_assembly_a(), mu.Coordinates(0.1,0.4,[-100,0,0],[-18.5,0,0],[180,90,0],[180,90,0]))
    flywheel_adapter_panel_set_assembly.include(shaft_large_washer_3_a, mu.Coordinates(0.1,0.4,[-100,0,0],[-18.5,0,0],[180,90,0],[180,90,0]))
    flywheel_adapter_panel_set_assembly.include(shaft_small_washer_6_a, mu.Coordinates(0.1,0.4,[-100,0,0],[-18.5,0,0],[180,90,0],[180,90,0]))
    flywheel_adapter_panel_set_assembly.include(shaft_locknut_5_a, mu.Coordinates(0.1,0.4,[-100,0,0],[-18.5,0,0],[180,90,0],[180,90,0]))
    
    return flywheel_adapter_panel_set_assembly
    
'''




'''
flywheel_adapter_a = mu.Hardware("flywheel_adapter_a","CUBX0177-FYAD-B7P5SR"+shaft_radius)
axle_adapter_a = mu.Hardware("axle_adapter_a","CUBX0177-AXAD-B7P5SR"+shaft_radius+"-PP17")

axle_adapter_flywheel_adapter_assembly_a = mu.Assembly("axle_adapter_bearing_adapter_assembly_a")
axle_adapter_flywheel_adapter_assembly_a.include(flywheel_adapter_a, mu.Coordinates(0.1,0.4,[-50,0,0],[-18.5,0,0],[0,90,0],[0,90,0]))
axle_adapter_flywheel_adapter_assembly_a.include(axle_adapter_a, mu.Coordinates(0.1,0.4,[50,0,0],[7.25,0,0],[0,90,0],[0,90,0]))




panel_assembly_a = mu.Assembly("panel_assembly_a")

# This needs the bearing security cap.
# This needs and the washers and bolts.

panel_assembly_a.include(panel_gear_assembly_a, mu.Coordinates(0.4,0.9,[-100,0,0],[-50,0,0],[0,180,0],[0,180,0]))
panel_assembly_a.include(axle_adapter_flywheel_adapter_assembly_a, mu.Coordinates(0.4,0.9,[100,0,0],[50,0,0],[0,0,0],[0,0,0]))



small_washer = mu.Hardware("small_washer", "CYLX0006-PIP-L0P3175O4P7625I2P1844")
large_washer = mu.Hardware("large_washer", "CYLX0006-PIP-L0P3175O3P175I1P1938")



panel_b = mu.Hardware("panel_b", "CUBX0177-BPAN-B"+block_length+"SR"+shaft_radius+"-X8Y8PP18-RF-SX25Y25-X1Y1-XO0YO0-X16Y16Z20-C")
bearing_b = mu.Hardware("bearing", "CYLX0006-PIP-L5O8I2P5")
bevel_gear_b = mu.Hardware("bevel_gear_b", "CRSPGR022-BG-M1P73-T20W9-P15H0C45-B4P85")

panel_gear_assembly_b = mu.Assembly("panel_gear_assembly_b")
panel_gear_assembly_b.include(panel_b, mu.Coordinates(0.1,0.4,[-100,0,0],[-18.5,0,0],[180,90,0],[180,90,0]))
panel_gear_assembly_b.include(bevel_gear_b, mu.Coordinates(0.1,0.4,[100,0,0],[7.25,0,0],[0,90,0],[0,90,0]))
panel_gear_assembly_b.include(large_washer, mu.Coordinates(0.1,0.4,[150,0,0],[7.25,0,0],[0,90,0],[0,90,0]))
panel_gear_assembly_b.include(small_washer, mu.Coordinates(0.1,0.4,[200,0,0],[7.25,0,0],[0,90,0],[0,90,0]))
panel_gear_assembly_b.include(bearing_b, mu.Coordinates(0.1,0.4,[-400,0,0],[-18.5,0,0],[0,90,0],[0,90,0]))


panel_gear_assembly_b.color="green"
flywheel_adapter_b = mu.Hardware("flywheel_adapter_b","CUBX0177-FYAD-B7P5SR"+shaft_radius)
axle_adapter_b = mu.Hardware("axle_adapter_b","CUBX0177-AXAD-B7P5SR"+shaft_radius+"-PP17")

axle_adapter_flywheel_adapter_assembly_b = mu.Assembly("axle_adapter_bearing_adapter_assembly_b")
axle_adapter_flywheel_adapter_assembly_b.include(flywheel_adapter_b, mu.Coordinates(0.1,0.4,[-50,0,0],[-18.5,0,0],[0,90,0],[0,90,0]))
axle_adapter_flywheel_adapter_assembly_b.include(axle_adapter_b, mu.Coordinates(0.1,0.4,[50,0,0],[7.25,0,0],[0,90,0],[0,90,0]))

panel_assembly_b = mu.Assembly("panel_assembly_b")
panel_assembly_b.include(panel_gear_assembly_b, mu.Coordinates(0.4,0.9,[-50,0,0],[-50,0,0],[0,180,0],[0,180,0]))
panel_assembly_b.include(axle_adapter_flywheel_adapter_assembly_b, mu.Coordinates(0.4,0.9,[300,0,0],[50,0,0],[0,0,0],[0,0,0]))



bearing_security_cap = mu.Hardware("bearing_security_cap_b","CUBX0177-BPANS2-B7P5SR2P2-X10Y10PP21-RF-SX0Y0-X1Y1-XO0YO0-X45Y45Z6-S-SX0Y0-X1Y1-XO0YO0-X12Y12Z15-S")
#bearing_security_cap = mu.Hardware("CUBX0177-SPANS2-B7P5SR2P2-X6Y6-SX0Y0-X1Y1-XO0YO0-X18Y18Z0P75-C-SX0Y0-X1Y1-XO0YO0-X7P5Y7P5Z10-S")
'''
alpha = 200 
gearbox_assembly = mu.Assembly("gearbox_assembly")
#gearbox_assembly.include(panel_gear_assembly_a(), mu.Coordinates(0,0.98,[0, 0 , 8 * float(block_length.replace("P", ".", 1)) / 2 + 500],[0, 0 , 8 * float(block_length.replace("P", ".", 1)) / 2 + 25],[0,-90,0],[0,-90,0]))
#gearbox_assembly.include(panel_b, mu.Coordinates(0,0.98,[0, 8 * float(block_length.replace("P", ".", 1)) / 2 + 500, 0],[0, 8 * float(block_length.replace("P", ".", 1)) / 2 + 25, 0],[-90,0,90],[-90,0,90]))
gearbox_assembly.include(panel_c, mu.Coordinates(0.02,0.98,[ - 8 * float(block_length.replace("P", ".", 1)) / 2 - alpha, 0, 0 ],[ - 8 * float(block_length.replace("P", ".", 1)) / 2, 0, 0 ],[0,-90,0],[0,-90,0]))
gearbox_assembly.include(panel_d, mu.Coordinates(0.02,0.98,[0 , 0, -8 * float(block_length.replace("P", ".", 1)) / 2 - alpha],[0 , 0, -8 * float(block_length.replace("P", ".", 1)) / 2 ],[0,180,0],[0,180,0]))
gearbox_assembly.include(panel_e, mu.Coordinates(0.02,0.98,[0, - 8 * float(block_length.replace("P", ".", 1)) / 2 - alpha, 0 ],[0, - 8 * float(block_length.replace("P", ".", 1)) / 2, 0 ],[90,0,0],[90,0,0]))
gearbox_assembly.include(panel_f, mu.Coordinates(0.02,0.98,[8 * float(block_length.replace("P", ".", 1)) / 2 + alpha, 0 , 0],[8 * float(block_length.replace("P", ".", 1)) / 2, 0 , 0],[90,0,90],[90,0,90]))



# Print Manifest

# CRSPGR022-BG-M1P73-T20W9-P15H0C45-B4P95 X 1
# CUBX0177-BPIN-B7P5SR2P2-PL7PR1P2 X 6
# CUBX0177-AXAD-B7P5SR2P2-PP17




workspace.run(panel_gear_assembly_a(), mu.Coordinates(0,1,[0,0,0],[0,0,0],[0,0,0],[0,0,0]))