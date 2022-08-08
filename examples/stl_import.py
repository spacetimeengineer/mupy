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
panel_a = mu.Hardware("3DBenchy", "https://cdn.thingiverse.com/assets/0e/b7/cc/6e/45/X-Wing24th_X_Wing_pilot_0_001.stl")
panel_b = mu.Hardware("3DBenchy", "https://cdn.thingiverse.com/assets/0e/b7/cc/6e/45/X-Wing24th_X_Wing_pilot_0_001.stl")
panel_c = mu.Hardware("3DBenchy", "https://cdn.thingiverse.com/assets/0e/b7/cc/6e/45/X-Wing24th_X_Wing_pilot_0_001.stl")
panel_d = mu.Hardware("3DBenchy", "https://cdn.thingiverse.com/assets/0e/b7/cc/6e/45/X-Wing24th_X_Wing_pilot_0_001.stl")
panel_e = mu.Hardware("3DBenchy", "https://cdn.thingiverse.com/assets/0e/b7/cc/6e/45/X-Wing24th_X_Wing_pilot_0_001.stl")
panel_f = mu.Hardware("3DBenchy", "https://cdn.thingiverse.com/assets/0e/b7/cc/6e/45/X-Wing24th_X_Wing_pilot_0_001.stl")

""" Define Hardware Assembly Coordinates"""

alpha = 200
test_assembly = mu.Assembly("test_assembly")
test_assembly.include(panel_a, mu.Coordinates(0,1,[0, 0 , 8 * 25 / 2 + alpha],[0, 0 , 8 * 25 / 2 ],[0,0,1000],[0,0,0]))
test_assembly.include(panel_b, mu.Coordinates(0,1,[0, 8 * 25 / 2 + alpha, 0],[0, 8 * 25 / 2, 0],[0,0,1000],[-90,0,0]))
test_assembly.include(panel_c, mu.Coordinates(0,1,[ - 8 * 25 / 2 - alpha, 0, 0 ],[ - 8 * 25 / 2, 0, 0 ],[0,0,1000],[0,-90,0]))
test_assembly.include(panel_d, mu.Coordinates(0,1,[0 , 0, -8 * 25 / 2 - alpha],[0 , 0, -8 * 25 / 2 ],[0,0,1000],[0,180,0]))
test_assembly.include(panel_e, mu.Coordinates(0,1,[0, - 8 * 25 / 2 - alpha, 0 ],[0, - 8 * 25 / 2, 0 ],[0,0,1000],[90,0,0]))
test_assembly.include(panel_f, mu.Coordinates(0,1,[8 * 25 / 2 + alpha, 0 , 0],[8 * 25 / 2, 0 , 0],[0,0,1000],[90,0,90]))

""" Run """
workspace.run(test_assembly, mu.Coordinates(0,1,[0,0,0],[0,0,0],[0,0,0],[0,0,0])) # This command creates all directorires and assemblies.
