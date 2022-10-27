""" Required libray imports. """
from pathlib import Path
import mupy.core as mu

""" Set up workspace. """
workspace_name = "custom_box"
workspace = mu.WorkSpace(str(Path.home())+"/"+workspace_name)

""" Set up workspace. """
unit_block_length = 15 
shaft_radius = 3 

""" Defines the dimensions of the total custom box.in units of unit_bock_length. """
box_x_units = 8 
box_y_units = 20 
box_z_units = 12 

""" Defines the dimensions of the individual panels making up the custom box which are themselves derived from the box dimensions defined in units of unit_bock_length. """
panel_a_x_block_units = box_x_units
panel_a_y_block_units = box_y_units
panel_b_x_block_units = box_x_units
panel_b_y_block_units = box_z_units
panel_c_x_block_units = box_z_units
panel_c_y_block_units = box_y_units
panel_d_x_block_units = box_x_units
panel_d_y_block_units = box_y_units
panel_e_x_block_units = box_x_units
panel_e_y_block_units = box_z_units
panel_f_x_block_units = box_y_units
panel_f_y_block_units = box_z_units 

""" Define hardware using system codes. System Codes here are being subject to programmatic parametrization. """
panel_a = mu.Hardware("panel_a", "CUBX0177-BPAN-B"+str(unit_block_length)+"SR"+str(shaft_radius)+"-X"+str(panel_a_x_block_units)+"Y"+str(panel_a_y_block_units)+"PP2-RF-SX5Y3-X1Y1-XO0YO0-X30Y30Z20-S")
panel_b = mu.Hardware("panel_b", "CUBX0177-BPAN-B"+str(unit_block_length)+"SR"+str(shaft_radius)+"-X"+str(panel_b_x_block_units)+"Y"+str(panel_b_y_block_units)+"PP2-RF-SX5Y3-X1Y1-XO0YO0-X30Y30Z20-S")
panel_c = mu.Hardware("panel_c", "CUBX0177-BPAN-B"+str(unit_block_length)+"SR"+str(shaft_radius)+"-X"+str(panel_c_x_block_units)+"Y"+str(panel_c_y_block_units)+"PP2-RF-SX5Y10-X1Y1-XO0YO0-X30Y30Z20-S")
panel_d = mu.Hardware("panel_d", "CUBX0177-BPAN-B"+str(unit_block_length)+"SR"+str(shaft_radius)+"-X"+str(panel_d_x_block_units)+"Y"+str(panel_d_y_block_units)+"PP2-RF-SX5Y10-X1Y1-XO0YO0-X30Y30Z20-S")
panel_e = mu.Hardware("panel_e", "CUBX0177-BPAN-B"+str(unit_block_length)+"SR"+str(shaft_radius)+"-X"+str(panel_e_x_block_units)+"Y"+str(panel_e_y_block_units)+"PP2-RF-SX5Y5-X1Y1-XO0YO0-X30Y30Z20-S")
panel_f = mu.Hardware("panel_f", "CUBX0177-BPAN-B"+str(unit_block_length)+"SR"+str(shaft_radius)+"-X"+str(panel_f_x_block_units)+"Y"+str(panel_f_y_block_units)+"PP2-RF-SX5Y5-X1Y1-XO0YO0-X30Y30Z20-S")

panel_a.color = "green"
panel_b.color = "blue"
panel_c.color = "orange"
panel_d.color = "red"
panel_e.color = "pink"
panel_f.color = "cyan"

""" Defines coordinates for hardware components within workspace. """
alpha = 230
assembly_coords_a = mu.Coordinates( z0 = box_z_units * unit_block_length / 2 + alpha,             zf = box_z_units * unit_block_length / 2                                       )
assembly_coords_b = mu.Coordinates( y0 = box_y_units * unit_block_length / 2 + alpha,             yf = box_y_units * unit_block_length / 2,             af = -90                 )
assembly_coords_c = mu.Coordinates( x0 = - box_x_units * unit_block_length / 2 - alpha,           xf = - box_x_units * unit_block_length / 2,           bf = -90                 )
assembly_coords_d = mu.Coordinates( z0 = - box_z_units*unit_block_length / 2 - alpha,             zf = - box_z_units*unit_block_length / 2,             bf = 180                 )
assembly_coords_e = mu.Coordinates( y0 = - box_y_units * unit_block_length / 2 - alpha,           yf = - box_y_units * unit_block_length / 2,           af = 90                  )
assembly_coords_f = mu.Coordinates( x0 = box_x_units * unit_block_length / 2 + alpha,             xf = box_x_units * unit_block_length / 2,             af = 90,       cf = 90   )

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
