#!/usr/bin/env python3

""" Required libray imports. """
from pathlib import Path # Imports library nessecary for fetching terminal path information.
import mupy.core as mu # Imports mupy library.

""" Set up workspace. """
workspace_name = "custom_box" # Workspace name ; this will be the name of the workspace directory.
workspace = mu.WorkSpace(str(Path.home())+"/"+workspace_name) # Creates workspace.

""" Set up workspace. """
unit_block_length = 15 # The CUBX0177 family contains a unit_block_length parameter.
shaft_radius = 3 # The CUBX0177 family contains a shaft_radius parameter which makes reference to a shaft radius within each unit block in the x,y and zed dimensions.

""" Defines the dimensions of the total custom box.in units of unit_bock_length. """
box_x_units = 8 # Defines the count of 'block units' in the x dimension that make up custom box.
box_y_units = 20 # Defines the count of 'block units' in the y dimension that make up custom box.
box_z_units = 12 # Defines the count of 'block units' in the z dimension that make up custom box.

""" Defines the dimensions of the individual panels making up the custom box which are themselves derived from the box dimensions defined in units of unit_bock_length. """
panel_a_x_block_units = box_x_units # Equation must be satisfied in order to express custom-box function. 
panel_a_y_block_units = box_y_units # Equation must be satisfied in order to express custom-box function. 
panel_b_x_block_units = box_x_units # Equation must be satisfied in order to express custom-box function. 
panel_b_y_block_units = box_z_units # Equation must be satisfied in order to express custom-box function. 
panel_c_x_block_units = box_z_units # Equation must be satisfied in order to express custom-box function. 
panel_c_y_block_units = box_y_units # Equation must be satisfied in order to express custom-box function. 
panel_d_x_block_units = box_x_units # Equation must be satisfied in order to express custom-box function. 
panel_d_y_block_units = box_y_units # Equation must be satisfied in order to express custom-box function. 
panel_e_x_block_units = box_x_units # Equation must be satisfied in order to express custom-box function. 
panel_e_y_block_units = box_z_units # Equation must be satisfied in order to express custom-box function. 
panel_f_x_block_units = box_y_units # Equation must be satisfied in order to express custom-box function. 
panel_f_y_block_units = box_z_units # Equation must be satisfied in order to express custom-box function. 

""" Define hardware using system codes. System Codes here are being subject to programmatic parametrization. """
panel_a = mu.Hardware("panel_a", "CUBX0177-BPAN-B"+str(unit_block_length)+"SR"+str(shaft_radius)+"-X"+str(panel_a_x_block_units)+"Y"+str(panel_a_y_block_units)+"PP2-RF-SX5Y3-X1Y1-XO0YO0-X30Y30Z20-S")     # Constructs panel : This hardware component is a box panel of a CUBX0177-class hardware component.
panel_b = mu.Hardware("panel_b", "CUBX0177-BPAN-B"+str(unit_block_length)+"SR"+str(shaft_radius)+"-X"+str(panel_b_x_block_units)+"Y"+str(panel_b_y_block_units)+"PP2-RF-SX5Y3-X1Y1-XO0YO0-X30Y30Z20-S")     # Constructs panel : This hardware component is a box panel of a CUBX0177-class hardware component.
panel_c = mu.Hardware("panel_c", "CUBX0177-BPAN-B"+str(unit_block_length)+"SR"+str(shaft_radius)+"-X"+str(panel_c_x_block_units)+"Y"+str(panel_c_y_block_units)+"PP2-RF-SX5Y10-X1Y1-XO0YO0-X30Y30Z20-S")    # Constructs panel : This hardware component is a box panel of a CUBX0177-class hardware component.
panel_d = mu.Hardware("panel_d", "CUBX0177-BPAN-B"+str(unit_block_length)+"SR"+str(shaft_radius)+"-X"+str(panel_d_x_block_units)+"Y"+str(panel_d_y_block_units)+"PP2-RF-SX5Y10-X1Y1-XO0YO0-X30Y30Z20-S")    # Constructs panel : This hardware component is a box panel of a CUBX0177-class hardware component.
panel_e = mu.Hardware("panel_e", "CUBX0177-BPAN-B"+str(unit_block_length)+"SR"+str(shaft_radius)+"-X"+str(panel_e_x_block_units)+"Y"+str(panel_e_y_block_units)+"PP2-RF-SX5Y5-X1Y1-XO0YO0-X30Y30Z20-S")     # Constructs panel : This hardware component is a box panel of a CUBX0177-class hardware component.
panel_f = mu.Hardware("panel_f", "CUBX0177-BPAN-B"+str(unit_block_length)+"SR"+str(shaft_radius)+"-X"+str(panel_f_x_block_units)+"Y"+str(panel_f_y_block_units)+"PP2-RF-SX5Y5-X1Y1-XO0YO0-X30Y30Z20-S")     # Constructs panel : This hardware component is a box panel of a CUBX0177-class hardware component.

""" Defines coordinates for hardware components within workspace. """
alpha = 230 # Equation must be satisfied in order to express custom-box function. Alpha is a constant which is useful for describing the distance between panels in the custom box.
assembly_coords_a = mu.Coordinates( z0 = box_z_units * unit_block_length / 2 + alpha,             zf = box_z_units * unit_block_length / 2                                       )     # Equation must be satisfied in order to express custom-box function. 
assembly_coords_b = mu.Coordinates( y0 = box_y_units * unit_block_length / 2 + alpha,             yf = box_y_units * unit_block_length / 2,             af = -90                 )     # Equation must be satisfied in order to express custom-box function. 
assembly_coords_c = mu.Coordinates( x0 = - box_x_units * unit_block_length / 2 - alpha,           xf = - box_x_units * unit_block_length / 2,           bf = -90                 )     # Equation must be satisfied in order to express custom-box function. 
assembly_coords_d = mu.Coordinates( z0 = - box_z_units*unit_block_length / 2 - alpha,             zf = - box_z_units*unit_block_length / 2,             bf = 180                 )     # Equation must be satisfied in order to express custom-box function. 
assembly_coords_e = mu.Coordinates( y0 = - box_y_units * unit_block_length / 2 - alpha,           yf = - box_y_units * unit_block_length / 2,           af = 90                  )     # Equation must be satisfied in order to express custom-box function. 
assembly_coords_f = mu.Coordinates( x0 = box_x_units * unit_block_length / 2 + alpha,             xf = box_x_units * unit_block_length / 2,             af = 90,       cf = 90   )     # Equation must be satisfied in order to express custom-box function. 

""" Defines total assembly dynamics ; hardware componenets, names, coordinates, information and metadata. """
box_assembly = mu.Assembly("box_assembly")
box_assembly.include(panel_a, assembly_coords_a) # Includes part into workspace with coordinate set. Keep in mind coodinates are contextual within an assembly and are not features of the part.
box_assembly.include(panel_b, assembly_coords_b) # Includes part into workspace with coordinate set. Keep in mind coodinates are contextual within an assembly and are not features of the part.
box_assembly.include(panel_c, assembly_coords_c) # Includes part into workspace with coordinate set. Keep in mind coodinates are contextual within an assembly and are not features of the part.
box_assembly.include(panel_d, assembly_coords_d) # Includes part into workspace with coordinate set. Keep in mind coodinates are contextual within an assembly and are not features of the part.
box_assembly.include(panel_e, assembly_coords_e) # Includes part into workspace with coordinate set. Keep in mind coodinates are contextual within an assembly and are not features of the part.
box_assembly.include(panel_f, assembly_coords_f) # Includes part into workspace with coordinate set. Keep in mind coodinates are contextual within an assembly and are not features of the part.

""" Run workspace. """
workspace.run(box_assembly, mu.Coordinates()) # This command creates all directorires and assemblies.
