""" Required Libray Imports. """
from pathlib import Path
import mupy.core as mu

""" Prepare Workspace. """
workspace_name = "test_assembly_system_code_concept"
workspace = mu.WorkSpace(str(Path.home())+"/"+workspace_name)

""" Define Assembly"""
test_assembly = mu.Assembly("test_assembly","CUSBX0177-REG-B25SR2P5-X14Y10Z8")

""" Run """
workspace.run(test_assembly, mu.Coordinates(0,1,[0,0,0],[0,0,0],[0,0,0],[0,0,0]))
