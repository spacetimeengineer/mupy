#!/usr/bin/env python3

""" Required Libray Imports. """
import mupy.core as mu # Imports mupy library.

class CUSBX0177:

    """ This class builds digital representations of basic block type elements."""

    def __init__(self, system_code, workspace_directory):
        
        """ This class handles decoding of all CUBX0006 family codes. """
        self.id = id # This is a unique name or tag referencing a particular object in a set.
        self.system_code = system_code # Hardware code fed directly from script or user. 
        self.family_code = system_code.split("-")[0]
        
        if len(self.system_code.split("-")) < 2: # If there is no type code available.
            print("The provided system-code is invalid because it contained no type-code.")
        else:
            self.type_code = self.system_code.split("-")[1] # The second section in the hardware code.
            
        if len(self.system_code.split("-")) < 3: # If there is no parameterization code available.
            print("The provided system-code is invalid because it contained no parameterization-code.")

            
        self.workspace_directory = workspace_directory # Workspace directory to be specific.

        # CUSBX0177-REG-B25SR2P5-X20Y10Z10
        if (self.type_code=="REG"): # Box panel.

            """ Sets up unit-block length and unit-block shaft-radius. """
            self.unit_block_length = self.system_code.split("-")[2].split("B")[1].split("S")[0]
            self.shaft_radius = self.system_code.split("-")[2].split("SR")[1]
            
            """ Defines the dimensions of the total custom box.in units of unit_bock_length. """
            self.box_x_units = self.system_code.split("-")[3].split("X")[1].split("Y")[0] # Defines the count of 'block units' in the x dimension that make up custom box.
            self.box_y_units = self.system_code.split("-")[3].split("Y")[1].split("Z")[0] # Defines the count of 'block units' in the y dimension that make up custom box.
            self.box_z_units = self.system_code.split("-")[3].split("Z")[1] # Defines the count of 'block units' in the z dimension that make up custom box.

            """ Defines the dimensions of the individual panels making up the custom box which are themselves derived from the box dimensions defined in units of unit_bock_length. """
            panel_a_x_block_units = self.box_x_units # Equation must be satisfied in order to express custom-box function. 
            panel_a_y_block_units = self.box_y_units # Equation must be satisfied in order to express custom-box function. 
            panel_b_x_block_units = self.box_x_units # Equation must be satisfied in order to express custom-box function. 
            panel_b_y_block_units = self.box_z_units # Equation must be satisfied in order to express custom-box function. 
            panel_c_x_block_units = self.box_z_units # Equation must be satisfied in order to express custom-box function. 
            panel_c_y_block_units = self.box_y_units # Equation must be satisfied in order to express custom-box function. 
            panel_d_x_block_units = self.box_x_units # Equation must be satisfied in order to express custom-box function. 
            panel_d_y_block_units = self.box_y_units # Equation must be satisfied in order to express custom-box function. 
            panel_e_x_block_units = self.box_x_units # Equation must be satisfied in order to express custom-box function. 
            panel_e_y_block_units = self.box_z_units # Equation must be satisfied in order to express custom-box function. 
            panel_f_x_block_units = self.box_y_units # Equation must be satisfied in order to express custom-box function. 
            panel_f_y_block_units = self.box_z_units # Equation must be satisfied in order to express custom-box function. 

            """ Define Hardware Components"""
            panel_a = mu.Hardware("panel_a", "CUBX0177-BPAN-B"+str(self.unit_block_length)+"SR"+str(self.shaft_radius)+"-X"+str(panel_a_x_block_units)+"Y"+str(panel_a_y_block_units)+"PP2-RF-SX5Y3-X1Y1-XO0YO0-X30Y30Z20-S") # Constructs panel : This hardware component is a box panel of a CUBX0177 class hardware component. This CUBX0177 component
            panel_b = mu.Hardware("panel_b", "CUBX0177-BPAN-B"+str(self.unit_block_length)+"SR"+str(self.shaft_radius)+"-X"+str(panel_b_x_block_units)+"Y"+str(panel_b_y_block_units)+"PP2-RF-SX5Y3-X1Y1-XO0YO0-X30Y30Z20-S") # Constructs panel A
            panel_c = mu.Hardware("panel_c", "CUBX0177-BPAN-B"+str(self.unit_block_length)+"SR"+str(self.shaft_radius)+"-X"+str(panel_c_x_block_units)+"Y"+str(panel_c_y_block_units)+"PP2-RF-SX5Y10-X1Y1-XO0YO0-X30Y30Z20-S")
            panel_d = mu.Hardware("panel_d", "CUBX0177-BPAN-B"+str(self.unit_block_length)+"SR"+str(self.shaft_radius)+"-X"+str(panel_d_x_block_units)+"Y"+str(panel_d_y_block_units)+"PP2-RF-SX5Y10-X1Y1-XO0YO0-X30Y30Z20-S")
            panel_e = mu.Hardware("panel_e", "CUBX0177-BPAN-B"+str(self.unit_block_length)+"SR"+str(self.shaft_radius)+"-X"+str(panel_e_x_block_units)+"Y"+str(panel_e_y_block_units)+"PP2-RF-SX5Y5-X1Y1-XO0YO0-X30Y30Z20-S")
            panel_f = mu.Hardware("panel_f", "CUBX0177-BPAN-B"+str(self.unit_block_length)+"SR"+str(self.shaft_radius)+"-X"+str(panel_f_x_block_units)+"Y"+str(panel_f_y_block_units)+"PP2-RF-SX5Y5-X1Y1-XO0YO0-X30Y30Z20-S")

            self.unit_block_length = self.unit_block_length.replace("P", ".", 1)
            self.shaft_radius = self.shaft_radius.replace("P", ".", 1)

            """ Define Hardware Components"""
            alpha = 200 # Equation must be satisfied in order to express custom-box function. Alpha is a constant which is useful for describing the distance between panels in the custom box.

            panel_a_assembly_coords = mu.Coordinates(0,1,[0, 0 , float(self.box_z_units) * float(self.unit_block_length) / 2 + alpha],[0, 0 , float(self.box_z_units) * float(self.unit_block_length) / 2],[0,0,0],[0,0,0]) # Equation must be satisfied in order to express custom-box function. 
            panel_b_assembly_coords = mu.Coordinates(0,1,[0, float(self.box_y_units) * float(self.unit_block_length) / 2 + alpha, 0],[0, float(self.box_y_units) * float(self.unit_block_length) / 2, 0],[0,0,0],[-90,0,0]) # Equation must be satisfied in order to express custom-box function. 
            panel_c_assembly_coords = mu.Coordinates(0,1,[ - float(self.box_x_units) * float(self.unit_block_length) / 2 - alpha, 0, 0 ],[ - float(self.box_x_units) * float(self.unit_block_length) / 2, 0, 0 ],[0,0,0],[0,-90,0]) # Equation must be satisfied in order to express custom-box function. 
            panel_d_assembly_coords = mu.Coordinates(0,1,[0 , 0, - float(self.box_z_units) * float(self.unit_block_length) / 2 - alpha],[0 , 0, - float(self.box_z_units) * float(self.unit_block_length) / 2],[0,0,0],[0,180,0]) # Equation must be satisfied in order to express custom-box function. 
            panel_e_assembly_coords = mu.Coordinates(0,1,[ 0, - float(self.box_y_units) * float(self.unit_block_length) / 2 - alpha, 0 ],[ 0, - float(self.box_y_units) * float(self.unit_block_length) / 2, 0 ],[0,0,0],[90,0,0]) # Equation must be satisfied in order to express custom-box function. 
            panel_f_assembly_coords = mu.Coordinates(0,1,[ float(self.box_x_units) * float(self.unit_block_length) / 2 + alpha, 0 ,0 ],[ float(self.box_x_units) * float(self.unit_block_length) / 2, 0 ,0 ],[0,0,0],[90,0,90]) # Equation must be satisfied in order to express custom-box function. 

            """ Define assembly. """
            box_assembly = mu.Assembly("box_assembly")
            box_assembly.include(panel_a, panel_a_assembly_coords)
            box_assembly.include(panel_b, panel_b_assembly_coords)
            box_assembly.include(panel_c, panel_c_assembly_coords)
            box_assembly.include(panel_d, panel_d_assembly_coords)
            box_assembly.include(panel_e, panel_e_assembly_coords)
            box_assembly.include(panel_f, panel_f_assembly_coords)
            
            
            
            ''' Testing that code is parsed correctly.'''
            print("")
            print("    Parameterization Information")
            print("")
            print("    famliy_code = "+self.family_code)
            print("    type_code = "+self.type_code)
            print("    block_unit_length = "+self.unit_block_length+"mm")
            print("    shaft_radius = "+self.shaft_radius+"mm")
            print("")
            
            ''' Execute write scad functions.   '''

            self.assembly = box_assembly
