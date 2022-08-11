""" Required Libray Imports. """
import mupy.core as mu
from pathlib import Path

""" Prepare Workspace. """
workspace_name = "testing_flywheel-to-axle-system"
workspace = mu.WorkSpace(str(Path.home())+"/"+workspace_name)

""" Define Assembly"""

panel = mu.Hardware("panel", "CUBX0177-BPAN-B12P5SR4-X8Y8PP18-RF-SX0Y0-X8Y8-XO0YO0-X20Y20Z5-C")
bevel_gear = mu.Hardware("bevel_gear", "CRSPGR022-BG-M2-T34W25-P15H0C45-B0")

panel_gear_assembly = mu.Assembly("panel_gear_assembly")
panel_gear_assembly.include(panel, mu.Coordinates(0.1,0.4,[-100,0,0],[-18.5,0,0],[0,90,0],[0,90,0]))
panel_gear_assembly.include(bevel_gear, mu.Coordinates(0.1,0.4,[100,0,0],[7.25,0,0],[0,90,0],[0,90,0]))

flywheel_adapter = mu.Hardware("flywheel_adapter","CUBX0177-FYAD-B12P5SR4")
axle_adapter = mu.Hardware("axle_adapter","CUBX0177-AXAD-B12P5SR4-PP17")

axle_adapter_flywheel_adapter_assembly = mu.Assembly("axle_adapter_bearing_adapter_assembly")
axle_adapter_flywheel_adapter_assembly.include(flywheel_adapter, mu.Coordinates(0.1,0.4,[-100,0,0],[-18.5,0,0],[0,90,0],[0,90,0]))
axle_adapter_flywheel_adapter_assembly.include(axle_adapter, mu.Coordinates(0.1,0.4,[100,0,0],[7.25,0,0],[0,90,0],[0,90,0]))

main_assembly = mu.Assembly("main_assembly")
main_assembly.include(panel_gear_assembly, mu.Coordinates(0.4,0.9,[-300,0,0],[-50,0,0],[0,180,0],[0,180,0]))
main_assembly.include(axle_adapter_flywheel_adapter_assembly, mu.Coordinates(0.4,0.9,[300,0,0],[50,0,0],[0,0,0],[0,0,0]))

""" Run """
workspace.run(main_assembly, mu.Coordinates(0,1,[0,0,0],[0,0,0],[0,0,0],[0,0,0]))
