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
benchy = mu.Hardware("3DBenchy", "resources/3DBenchy.stl")



""" Define Hardware Assembly Coordinates"""


test_assembly = mu.Assembly("test_assembly")
test_assembly.include(benchy, mu.Coordinates(0,1,[0, 0 , 8 * 25 / 2 + 200],[0, 0 , 8 * 25 / 2 ],[0,0,1000],[0,0,0]))


""" Run """
workspace.run(test_assembly, mu.Coordinates(0,1,[0,0,0],[0,0,0],[0,0,0],[0,0,0])) # This command creates all directorires and assemblies.
