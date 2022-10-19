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
panel_b = mu.Hardware("panel_c", "CUBX0177-BPANS2-B"+block_length+"SR"+shaft_radius+"-X"+x_block_units+"Y"+y_block_units+"PP25-RF-SX0Y0-X1Y1-XO0YO0-X30Y30Z6-S-SX0Y0-X1Y1-XO0YO0-X16Y16Z15-S") #Square waffle life panel for making boxes.
panel_c = mu.Hardware("panel_c", "CUBX0177-BPANS2-B"+block_length+"SR"+shaft_radius+"-X"+x_block_units+"Y"+y_block_units+"PP25-RF-SX0Y0-X1Y1-XO0YO0-X30Y30Z6-S-SX0Y0-X1Y1-XO0YO0-X16Y16Z15-S")
panel_d = mu.Hardware("panel_d", "CUBX0177-BPANS2-B"+block_length+"SR"+shaft_radius+"-X"+x_block_units+"Y"+y_block_units+"PP25-RF-SX0Y0-X1Y1-XO0YO0-X30Y30Z6-S-SX0Y0-X1Y1-XO0YO0-X16Y16Z15-S")
panel_e = mu.Hardware("panel_e", "CUBX0177-BPANS2-B"+block_length+"SR"+shaft_radius+"-X"+x_block_units+"Y"+y_block_units+"PP25-RF-SX0Y0-X1Y1-XO0YO0-X30Y30Z6-S-SX0Y0-X1Y1-XO0YO0-X16Y16Z15-S")
panel_f = mu.Hardware("panel_f", "CUBX0177-BPANS2-B"+block_length+"SR"+shaft_radius+"-X"+x_block_units+"Y"+y_block_units+"PP25-RF-SX0Y0-X1Y1-XO0YO0-X30Y30Z6-S-SX0Y0-X1Y1-XO0YO0-X16Y16Z15-S")


def panel_bearing_assembly_a(tag):
    """This assembly describes how a flanged bearing is snapped into the printed slot within the panel. This slot is sized for the bearing and care must be taken. This can be parameterized.

    Args:
        tag (str, optional): _description_. Defaults to "a".

    Returns:
        _type_: Returns a complete assembly in the form of a collection of scad files written to the workspace directory.
    """
    
    panel_bearing_assembly_a = mu.Assembly("panel_bearing_assembly_"+tag) # Manufacturing Notes : Ender 5 Pro Printer : 220 Degrees Farenheight Nozzel Temp / 60 Deegree Farenheight Bed Temp / 50 % Speed. Low infill / low quality or better.
    panel_a = mu.Hardware("panel_"+tag, "CUBX0177-BPAN-B"+block_length+"SR"+shaft_radius+"-X8Y8PP18-RF-SX25Y25-X1Y1-XO0YO0-X16Y16Z20-C")
    panel_a.color = "#4287f5" # Amazon PLA Purchase Link : https://www.amazon.com/Overture-Filament-Toughness-Enhanced-Dimensional/dp/B07VCPK9KC?th=1 : $25.99
    panel_bearing_assembly_a.include(panel_a,                                                                           mu.Coordinates(t0 = 0.1, tf = 0.4, x0 = 100 ,xf = 0,  a0 = 180, b0 = 90, af = 180, bf = 90))
    panel_bearing_assembly_a.include(mu.Hardware("bearing_"+tag, "CYLX0006-PIP-L5O8I2P5"),                              mu.Coordinates(t0 = 0.1, tf = 0.4, x0 = -40 ,xf = -1, a0 = 180, b0 = 90, af = 180, bf = 90)) # McMaster Carr Purchase Link :
    
    return panel_bearing_assembly_a
    

def panel_gear_assembly_a(tag):
    
    """_summary_

    Returns:
        _type_: _description_
    """
    
    panel_gear_assembly_a = mu.Assembly("panel_gear_assembly_"+tag)
    primary_shaft_bolt = mu.Hardware("primary_shaft_bolt_"+tag,            "BOLTX0004-B1024-HEX-L50D7H3")
    panel_gear_assembly_a.include(primary_shaft_bolt,                                                                   mu.Coordinates(t0 = 0.1, tf = 0.4,   x0 = 300,   xf = 16,   b0 = 90, bf = 90,   c0 = 180, cf = 180))
    primary_shaft_bolt.color = "silver"
    panel_gear_assembly_a.include(mu.Hardware("shaft_small_washer_1_"+tag, "CYLX0006-PIP-L0P3175O4P7625I2P1844"),       mu.Coordinates(t0 = 0.1, tf = 0.4,   x0 = 160, xf = 15,     b0 = 90,  bf = 90,  c0 = 180, cf = 180))
    panel_gear_assembly_a.include(mu.Hardware("shaft_large_washer_1_"+tag, "CYLX0006-PIP-L0P3175O9P525I3P175"),         mu.Coordinates(t0 = 0.1, tf = 0.4,   x0 = 140, xf = 14.8,   b0 = 90,  bf = 90))
    
    
    bevel_gear = mu.Hardware("bevel_gear_"+tag,"CRSPGR022-BG-M1P73-T20W9-P15H0C45-B4P95")
    bevel_gear.color = "yellow"
    panel_gear_assembly_a.include(bevel_gear,  mu.Coordinates(t0 = 0.1, tf = 0.4, x0 = 120, xf = 7.25, b0 = 90, bf = 90))
    
    
    panel_gear_assembly_a.include(mu.Hardware("shaft_large_washer_2_"+tag, "CYLX0006-PIP-L0P3175O9P525I3P175"),         mu.Coordinates(t0 = 0.1, tf = 0.4,   x0 = 100,  xf = 7.15,  b0 = 90,  bf = 90))
    panel_gear_assembly_a.include(mu.Hardware("shaft_small_washer_2_"+tag, "CYLX0006-PIP-L0P3175O4P7625I2P1844"),       mu.Coordinates(t0 = 0.1, tf = 0.4,   x0 = 80,   xf = 7,     b0 = 90,  bf = 90))
    panel_gear_assembly_a.include(mu.Hardware("shaft_small_washer_3_"+tag, "CYLX0006-PIP-L0P3175O4P7625I2P1844"),       mu.Coordinates(t0 = 0.1, tf = 0.4,   x0 = 60,   xf = 2,     b0 = 90,  bf = 90))
    panel_gear_assembly_a.include(mu.Hardware("shaft_locknut_1_"+tag,      "BOLTX0004-N1024-HEX-D10H5"),                mu.Coordinates(t0 = 0.1, tf = 0.4,   x0 = 40,   xf = 4,     b0 = 90,  bf = 90))
    panel_gear_assembly_a.include(mu.Hardware("shaft_small_washer_4_"+tag, "CYLX0006-PIP-L0P3175O4P7625I2P1844"),       mu.Coordinates(t0 = 0.1, tf = 0.4,   x0 = 20,   xf = 1,     b0 = 90,  bf = 90))
    panel_gear_assembly_a.include(panel_bearing_assembly_a(tag),                                                        mu.Coordinates(t0 = 0.1, tf = 0.4,   x0 = -70,  xf = 0,     a0 = 180, b0 = 0,   af = 180, bf = 0))
    panel_gear_assembly_a.include(mu.Hardware("shaft_small_washer_5_"+tag, "CYLX0006-PIP-L0P3175O4P7625I2P1844"),       mu.Coordinates(t0 = 0.1, tf = 0.4,   x0 = -150, xf = -4,    a0 = 180, b0 = 90,  af = 180, bf = 90))
    panel_gear_assembly_a.include(mu.Hardware("shaft_locknut_2_"+tag,      "BOLTX0004-N1024-HEX-D10H5"),                mu.Coordinates(t0 = 0.1, tf = 0.4,   x0 = -160, xf = -7,    a0 = 180, b0 = 90,  af = 180, bf = 90))
    panel_gear_assembly_a.include(mu.Hardware("shaft_locknut_3_"+tag,      "BOLTX0004-N1024-HEX-D10H5"),                mu.Coordinates(t0 = 0.1, tf = 0.4,   x0 = -180, xf = -12.1, a0 = 180, b0 = 90,  af = 180, bf = 90))
    panel_gear_assembly_a.include(mu.Hardware("shaft_locknut_4_"+tag,      "BOLTX0004-N1024-HEX-D10H5"),                mu.Coordinates(t0 = 0.1, tf = 0.4,   x0 = -190, xf = -17.2, a0 = 180, b0 = 90,  af = 180, bf = 90))
    panel_gear_assembly_a.include(mu.Hardware("shaft_small_washer_6_"+tag, "CYLX0006-PIP-L0P3175O4P7625I2P1844"),       mu.Coordinates(t0 = 0.1, tf = 0.4,   x0 = -200, xf = -20,   a0 = 180, b0 = 90,  af = 180, bf = 90))

    return panel_gear_assembly_a


def bearing_security_cap_panel_assembly(tag):
    """_summary_

    Args:
        tag (_type_): _description_

    Returns:
        _type_: _description_
    """    
    bearing_security_cap_panel_assembly = mu.Assembly("bearing_security_cap_panel_assembly_"+tag)
    
    
    bearing_cap_bolt_1_a = mu.Hardware("bearing_cap_bolt_1_"+tag, "BOLTX0004-B832-HEX-L25P4D7H2P5")
    bearing_cap_bolt_2_a = mu.Hardware("bearing_cap_bolt_2_"+tag, "BOLTX0004-B832-HEX-L25P4D7H2P5")

    bearing_security_cap_a = mu.Hardware("bearing_security_cap_"+tag, "CUBX0177-SPANS2-B7P5SR2P22-X6Y6-SX0Y0-X1Y1-XO0YO0-X19Y19Z0P75-C-SX0Y0-X1Y1-XO0YO0-X12Y12Z10-S")
    bearing_security_cap_a.color = "yellow"
    bearing_security_cap_panel_assembly.include(panel_gear_assembly_a(tag),                                                            mu.Coordinates())
    
    bearing_security_cap_panel_assembly.include(bearing_cap_bolt_1_a,                                                                  mu.Coordinates(t0 = 0.5, tf = 0.6,   x0 = -250, xf = -13, y0 = 7.5/2*5,  yf = 7.5/2*5,  z0 = 7.5/2*5,  zf = 7.5/2*5,  b0 = 90, bf = 90))
    bearing_security_cap_panel_assembly.include(bearing_cap_bolt_2_a,                                                                  mu.Coordinates(t0 = 0.5, tf = 0.6,   x0 = -250, xf = -13, y0 = -7.5/2*5, yf = -7.5/2*5, z0 = -7.5/2*5, zf = -7.5/2*5, b0 = 90, bf = 90))

    bearing_security_cap_panel_assembly.include(mu.Hardware("bearing_cap_top_washer_1_"+tag,    "CYLX0006-PIP-L0P3175O4P7625I2P1844"), mu.Coordinates(t0 = 0.5, tf = 0.6,   x0 = -220, xf = -11.5,  y0 = 7.5/2*5,  yf = 7.5/2*5,  z0 = 7.5/2*5,  zf = 7.5/2*5,  b0 = 90, bf = 90))
    bearing_security_cap_panel_assembly.include(mu.Hardware("bearing_cap_top_washer_2_"+tag,    "CYLX0006-PIP-L0P3175O4P7625I2P1844"), mu.Coordinates(t0 = 0.5, tf = 0.6,   x0 = -220, xf = -11.5,  y0 = -7.5/2*5, yf = -7.5/2*5, z0 = -7.5/2*5, zf = -7.5/2*5, b0 = 90, bf = 90))
    
    bearing_security_cap_panel_assembly.include(mu.Hardware("bearing_cap_bottom_washer_1_"+tag, "CYLX0006-PIP-L0P3175O4P7625I2P1844"), mu.Coordinates(t0 = 0.5, tf = 0.6,   x0 = 200, xf = 4,    y0 = 7.5/2*5,  yf = 7.5/2*5,  z0 = 7.5/2*5,  zf = 7.5/2*5,  b0 = 90, bf = 90))
    bearing_security_cap_panel_assembly.include(mu.Hardware("bearing_cap_bottom_washer_2_"+tag, "CYLX0006-PIP-L0P3175O4P7625I2P1844"), mu.Coordinates(t0 = 0.5, tf = 0.6,   x0 = 200, xf = 4,    y0 = -7.5/2*5, yf = -7.5/2*5, z0 = -7.5/2*5, zf = -7.5/2*5, b0 = 90, bf = 90))    
    
    bearing_security_cap_panel_assembly.include(mu.Hardware("bearing_cap_nut_1_"+tag,      "BOLTX0004-N832-HEX-D7H3"),                 mu.Coordinates(t0 = 0.5, tf = 0.6,   x0 = 300, xf = 6, y0 = 7.5/2*5,  yf = 7.5/2*5,  z0 = 7.5/2*5,  zf = 7.5/2*5,  b0 = 90, bf = 90))
    bearing_security_cap_panel_assembly.include(mu.Hardware("bearing_cap_nut_2_"+tag,      "BOLTX0004-N832-HEX-D7H3"),                 mu.Coordinates(t0 = 0.5, tf = 0.6,   x0 = 300, xf = 6, y0 = -7.5/2*5, yf = -7.5/2*5, z0 = -7.5/2*5, zf = -7.5/2*5, b0 = 90, bf = 90))
    
    
    
    bearing_security_cap_panel_assembly.include(bearing_security_cap_a, mu.Coordinates(t0 = 0.4, tf = 0.6,   x0 = -200, xf = -7.5, b0 = 90, bf = 90))
    
    #bearing_security_cap_panel_assembly.include(fastening_assembly(), mu.Coordinates(0.1,0.9,[0,0,0],[0,0,0],[0,90,0],[0,90,0]))
    #bearing_security_cap_panel_assembly.include(fastening_assembly(), mu.Coordinates(0.1,0.9,[0,0,0],[0,0,0],[0,90,0],[0,90,0]))

    return bearing_security_cap_panel_assembly
    


def flywheel_adapter_boltset_assembly_a(tag):
    """_summary_

    Args:
        tag (_type_): _description_

    Returns:
        _type_: _description_
    """    
    flywheel_adapter_boltset_assembly_a = mu.Assembly("flywheel_adapter_boltset_assembly_"+tag)
    flywheel_adapter_a = mu.Hardware("flywheel_adapter_"+tag,"CUBX0177-FYAD-B7P5SR"+shaft_radius)
    flywheel_adapter_a.color = "yellow"
    
    flywheel_adapter_boltset_assembly_a.include(flywheel_adapter_a, mu.Coordinates(t0 = 0.6, tf = 0.8,   x0 = -300, xf = -25, b0 = 90, bf = 90, c0 = 180, cf= 180))
    flywheel_adapter_boltset_assembly_a.include(bearing_security_cap_panel_assembly(tag), mu.Coordinates())
    
    #flywheel_adapter_panel_set_assembly.include(shaft_small_washer_6_a, mu.Coordinates(0.1,0.4,[-100,0,0],[-18.5,0,0],[180,90,0],[180,90,0]))
    #flywheel_adapter_panel_set_assembly.include(shaft_locknut_5_a, mu.Coordinates(0.1,0.4,[-100,0,0],[-18.5,0,0],[180,90,0],[180,90,0]))
    
    #flywheel_adapter_panel_set_assembly.include(flywheel_adapter_a, mu.Coordinates(0.1,0.4,[-100,0,0],[-18.5,0,0],[180,90,0],[180,90,0]))
    #flywheel_adapter_panel_set_assembly.include(shaft_large_washer_3_a, mu.Coordinates(0.1,0.4,[-100,0,0],[-18.5,0,0],[180,90,0],[180,90,0]))
    #flywheel_adapter_panel_set_assembly.include(shaft_small_washer_6_a, mu.Coordinates(0.1,0.4,[-100,0,0],[-18.5,0,0],[180,90,0],[180,90,0]))
    #flywheel_adapter_panel_set_assembly.include(shaft_locknut_5_a, mu.Coordinates(0.1,0.4,[-100,0,0],[-18.5,0,0],[180,90,0],[180,90,0]))
    
    return flywheel_adapter_boltset_assembly_a

def axle_adapter_assembly_a(tag):
    """_summary_

    Args:
        tag (_type_): _description_

    Returns:
        _type_: _description_
    """    
    axle_adapter_assembly_a = mu.Assembly("axle_adapter_assembly_"+tag)
    
    axle_adapter_a = mu.Hardware("axle_adapter_"+tag,"CUBX0177-AXAD-B7P5SR"+shaft_radius+"-PP17")
    axle_adapter_a.color = "#4287f5"
    
    axle_adapter_assembly_a.include(axle_adapter_a, mu.Coordinates(t0 = 0.7, tf = 0.9,   x0 = -300, xf = -40, b0 = 90, bf = 90, c0 = 180, cf= 180))
    axle_adapter_assembly_a.include(flywheel_adapter_boltset_assembly_a(tag), mu.Coordinates(a0 = 180, af = 180))
    

    
    return axle_adapter_assembly_a


def gearbox_assembly():
    """_summary_

    Returns:
        _type_: _description_
    """    
    alpha = 200 
    gearbox_assembly = mu.Assembly("gearbox_assembly")
    gearbox_assembly.include(axle_adapter_assembly_a("a"), mu.Coordinates(t0 = 0.7, tf = 0.9, z0 = 8 * float(block_length.replace("P", ".", 1)) / 2 + 500, zf = 8 * float(block_length.replace("P", ".", 1)) / 2, a0 = -180, af = -180, b0 = 90, bf = 90))
    gearbox_assembly.include(axle_adapter_assembly_a("b"), mu.Coordinates(t0 = 0.7, tf = 0.9, y0 = 8 * float(block_length.replace("P", ".", 1)) / 2 + 500, yf = 8 * float(block_length.replace("P", ".", 1)) / 2, a0 = -90, c0 = -90, af = -90, cf = -90))
    gearbox_assembly.include(panel_c, mu.Coordinates(0.02,0.98,[ - 8 * float(block_length.replace("P", ".", 1)) / 2 - alpha, 0, 0 ],[ - 8 * float(block_length.replace("P", ".", 1)) / 2, 0, 0 ],[0,-90,0],[0,-90,0]))
    gearbox_assembly.include(panel_d, mu.Coordinates(0.02,0.98,[0 , 0, -8 * float(block_length.replace("P", ".", 1)) / 2 - alpha],[0 , 0, -8 * float(block_length.replace("P", ".", 1)) / 2 ],[0,180,0],[0,180,0]))
    gearbox_assembly.include(panel_e, mu.Coordinates(0.02,0.98,[0, - 8 * float(block_length.replace("P", ".", 1)) / 2 - alpha, 0 ],[0, - 8 * float(block_length.replace("P", ".", 1)) / 2, 0 ],[90,0,0],[90,0,0]))
    gearbox_assembly.include(panel_f, mu.Coordinates(0.02,0.98,[8 * float(block_length.replace("P", ".", 1)) / 2 + alpha, 0 , 0],[8 * float(block_length.replace("P", ".", 1)) / 2, 0 , 0],[90,0,90],[90,0,90]))

    return gearbox_assembly



def pinset_assembly(tag):
    """_summary_

    Args:
        tag (_type_): _description_
    """    
    pass

workspace.run(gearbox_assembly(), mu.Coordinates(0,1,[0,0,0],[0,0,0],[0,0,0],[0,0,0]))