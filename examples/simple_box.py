#!/usr/bin/env python3

""" Required Libray Imports. """
from pathlib import Path # Imports library nessecary for fetching terminal path information.
import mupy.core as mu # Imports mupy library.

""" Sets up workspace. The workspace name will serve to be the name of the workspace directory. This implementation writes workspace directory relative to home directory."""

workspace_name = "simple_box"
workspace = mu.WorkSpace(str(Path.home())+"/"+workspace_name)

""" Define hardware using system codes. """

panel_a = mu.Hardware("panel_a", "CUBX0177-BPAN-B25SR7-X8Y8PP2-RF-SX25Y25-X1Y1-XO0YO0-X50Y70Z50-C")
panel_b = mu.Hardware("panel_b", "CUBX0177-BPAN-B25SR4-X8Y8PP2-RF-SX25Y25-X1Y1-XO0YO0-X30Y30Z50-S")
panel_c = mu.Hardware("panel_c", "CUBX0177-BPAN-B25SR2P5-X8Y8PP2-RF-SX25Y25-X3Y6-XO0YO0-X30Y10Z50-S")
panel_d = mu.Hardware("panel_d", "CUBX0177-BPAN-B25SR9-X8Y8PP2-RF-SX25Y25-X1Y1-XO0YO0-X50Y70Z50-C")
panel_e = mu.Hardware("panel_e", "CUBX0177-BPAN-B25SR2P5-X8Y8PP2-RF-SX7Y7-X6Y6-XO0YO0-X8Y10Z5-S")
panel_f = mu.Hardware("panel_f", "CUBX0177-BPAN-B25SR6-X8Y8PP2-RF-SX20Y10-X2Y4-XO0YO0-X30Y30Z20-S")

""" Use colors to visually label hardware. """

panel_a.color = "green"
panel_b.color = "blue"
panel_c.color = "orange"
panel_d.color = "red"
panel_e.color = "pink"
panel_f.color = "purple"

""" Defines coordinates for hardware components within workspace. 
Below equations and policies must be satisfied in order to express custom-box function. """

alpha = 200 
assembly_coords_a = mu.Coordinates( z0 = 8 * 25 / 2 + alpha,             zf = 8 * 25 / 2                                       )
assembly_coords_b = mu.Coordinates( y0 = 8 * 25 / 2 + alpha,             yf = 8 * 25 / 2,             af = -90                 )
assembly_coords_c = mu.Coordinates( x0 = - 8 * 25 / 2 - alpha,           xf = - 8 * 25 / 2,           bf = -90                 )
assembly_coords_d = mu.Coordinates( z0 = -8 * 25 / 2 - alpha,            zf = -8 * 25 / 2,            bf = 180                 )
assembly_coords_e = mu.Coordinates( y0 = - 8 * 25 / 2 - alpha,           yf = - 8 * 25 / 2,           af = 90                  )
assembly_coords_f = mu.Coordinates( x0 = 8 * 25 / 2 + alpha,             xf = 8 * 25 / 2,             af = 90,       cf = 90   )


""" Defines total assembly dynamics ; hardware componenets, names, coordinates, information and metadata. """

box_assembly = mu.Assembly("box_assembly")
box_assembly.include(panel_a, assembly_coords_a) 
box_assembly.include(panel_b, assembly_coords_b) 
box_assembly.include(panel_c, assembly_coords_c)
box_assembly.include(panel_d, assembly_coords_d)
box_assembly.include(panel_e, assembly_coords_e)
box_assembly.include(panel_f, assembly_coords_f)


""" Run workspace. """

workspace.run(box_assembly, mu.Coordinates())
