#!/usr/bin/env python3

"""
Note to user : This script as seen on github is used to illustrate the power of mupy parameterization and how it can be manipulated with python calls.
"""

""" Required Libray Imports. """
from pathlib import Path # Imports library nessecary for fetching terminal path information.
import mupy.core as mu # Imports mupy library.

""" Set Up Workspace. """
workspace_name = "stl_import_workbench" # Workspace name ; this will be the name of the workspace directory.
workspace = mu.WorkSpace(str(Path.home())+"/"+workspace_name) # Creates workspace.


""" Define Hardware Components"""
panel_a = mu.Hardware("3DBenchy_a", "https://cdn.thingiverse.com/assets/0e/b7/cc/6e/45/X-Wing24th_X_Wing_pilot_0_001.stl")
panel_b = mu.Hardware("3DBenchy_b", "https://cdn.thingiverse.com/assets/0e/b7/cc/6e/45/X-Wing24th_X_Wing_pilot_0_001.stl")
panel_c = mu.Hardware("3DBenchy_c", "https://cdn.thingiverse.com/assets/0e/b7/cc/6e/45/X-Wing24th_X_Wing_pilot_0_001.stl")
panel_d = mu.Hardware("3DBenchy_d", "https://cdn.thingiverse.com/assets/0e/b7/cc/6e/45/X-Wing24th_X_Wing_pilot_0_001.stl")
panel_e = mu.Hardware("3DBenchy_e", "https://cdn.thingiverse.com/assets/0e/b7/cc/6e/45/X-Wing24th_X_Wing_pilot_0_001.stl")
panel_f = mu.Hardware("3DBenchy_f", "https://cdn.thingiverse.com/assets/0e/b7/cc/6e/45/X-Wing24th_X_Wing_pilot_0_001.stl")

""" Define Hardware Assembly Coordinates"""

alpha = 200 
assembly_coords_a = mu.Coordinates( z0 = 8 * 25 / 2 + alpha,             zf = 8 * 25 / 2                                       )     # Equation must be satisfied in order to express custom-box function. 
assembly_coords_b = mu.Coordinates( y0 = 8 * 25 / 2 + alpha,             yf = 8 * 25 / 2,             af = -90                 )     # Equation must be satisfied in order to express custom-box function. 
assembly_coords_c = mu.Coordinates( x0 = - 8 * 25 / 2 - alpha,           xf = - 8 * 25 / 2,           bf = -90                 )     # Equation must be satisfied in order to express custom-box function. 
assembly_coords_d = mu.Coordinates( z0 = -8 * 25 / 2 - alpha,            zf = -8 * 25 / 2,            bf = 180                 )     # Equation must be satisfied in order to express custom-box function. 
assembly_coords_e = mu.Coordinates( y0 = - 8 * 25 / 2 - alpha,           yf = - 8 * 25 / 2,           af = 90                  )     # Equation must be satisfied in order to express custom-box function. 
assembly_coords_f = mu.Coordinates( x0 = 8 * 25 / 2 + alpha,             xf = 8 * 25 / 2,             af = 90,       cf = 90   )     # Equation must be satisfied in order to express custom-box function. 

""" Defines total assembly dynamics ; hardware componenets, names, coordinates, information and metadata. """
test_assembly = mu.Assembly("test_assembly")
test_assembly.include(panel_a, assembly_coords_a) 
test_assembly.include(panel_b, assembly_coords_b) 
test_assembly.include(panel_c, assembly_coords_c)
test_assembly.include(panel_d, assembly_coords_d)
test_assembly.include(panel_e, assembly_coords_e)
test_assembly.include(panel_f, assembly_coords_f)

""" Run """
workspace.run(test_assembly, mu.Coordinates()) # This command creates all directorires and assemblies.
