#!/usr/bin/env python3
import os, sys
import shutil

class CUBX0177:
    """ This class builds digital representations of CUBX0177 hardware elements. These representations contain varius objects which help simulate the part."""

    def __init__(self, hardware_code, directory): # Runs when object is initialized.

        self.id = id # This is a unique name or tag referencing a particular object in a set.
        self.hardware_code = hardware_code
        self.family_code = self.hardware_code.split("-")[0]
        self.type_code = self.hardware_code.split("-")[1]
        self.directory = directory
        self.scad_file_name = directory + "/" + hardware_code +".scad" # This scad file is used to build the stl. It can be deleted afterwards. # TODO : Delete this file after run() command is called.
        self.scad_file = open(self.scad_file_name, 'w+')  # open file in append mode

        os.system("cp -R "+os.path.dirname(__file__)+"/scad/ "+ self.directory) # Copies resouces into the workspace directory. These will be deletd later. TODO : Its not a general case that we are in the right directory for this command to work.
        # TODO : Mayneed to put in a double slash test ; replace with one slash incase too many were appended.
        self.scad_file.write('use <scad/CUBX0177.scad>;\n\n')
        if (self.type_code=="BPAN"): # Box panel.
            
            # Example BPAN hardware code : "CUBX0177-BPAN-B25SR2P5-X8Y8PP2-RT-SX25Y25-X8Y8-XO3YO5-X20Y20Z10-S"

            self.block_unit_length = self.hardware_code.split("-")[2].split("B")[1].split("SR")[0]
            self.shaft_radius = self.hardware_code.split("-")[2].split("B")[1].split("SR")[1]
            self.x_units =  self.hardware_code.split("-")[3].split("X")[1].split("Y")[0]
            self.y_units =  self.hardware_code.split("-")[3].split("Y")[1].split("P")[0]
            self.padding =  "0."+self.hardware_code.split("-")[3].split("PP")[1]

            if (self.hardware_code.split("-")[4].count("R") == 1):
                self.orientation = '"regular"' # Regular orientation.
            elif (self.hardware_code.split("-")[4].count("I") == 1):
                self.orientation = '"inverted"' # Inverted orientation.
            elif (self.hardware_code.split("-")[4].count("C") == 1):
                self.orientation = '"chimera"' # Chimera orientation.
            elif (self.hardware_code.split("-")[4].count("X") == 1):
                self.orientation = '"inverted_chimera"' # Inverted chimera.
            else:
                self.errors.append("Incorrect orientation code.")
                pass
            if (self.hardware_code.split("-")[4].count("T") == 1):
                self.teeth = "true"
            elif (self.hardware_code.split("-")[4].count("F") == 1):
                self.teeth = "false"
            else:
                self.errors.append("Incorrect teeth code.")
                pass
            
            """Draw Inputs From System-Code"""

            self.x_cavity_spacing =  self.hardware_code.split("-")[5].split("X")[1].split("Y")[0]
            self.y_cavity_spacing =  self.hardware_code.split("-")[5].split("X")[1].split("Y")[1]
            self.x_cavity_units =  self.hardware_code.split("-")[6].split("X")[1].split("Y")[0]
            self.y_cavity_units =  self.hardware_code.split("-")[6].split("X")[1].split("Y")[1]
            self.x_offset  =  self.hardware_code.split("-")[7].split("XO")[1].split("YO")[0]
            self.y_offset  =  self.hardware_code.split("-")[7].split("YO")[1]
            self.x_cavity_dimensions =  self.hardware_code.split("-")[8].split("X")[1].split("Y")[0]
            self.y_cavity_dimensions =  self.hardware_code.split("-")[8].split("X")[1].split("Y")[1].split("Z")[0]
            self.z_cavity_dimensions =  self.hardware_code.split("-")[8].split("X")[1].split("Y")[1].split("Z")[1]

            if (self.hardware_code.split("-")[9].count("S") == 1):
                self.cavity_type = '"S"'
            elif (self.hardware_code.split("-")[9].count("C") == 1):
                self.cavity_type = '"C"'
            else:
                self.errors.append("Incorrect cavity code.")
                pass


            """Format Inputs"""

            self.block_unit_length = self.block_unit_length.replace("P", ".", 1)
            self.shaft_radius = self.shaft_radius.replace("P", ".", 1)
            self.x_cavity_spacing = self.x_cavity_spacing.replace("P", ".", 1)
            self.y_cavity_spacing = self.y_cavity_spacing.replace("P", ".", 1)
            self.x_offset = self.x_offset.replace("P", ".", 1)
            self.y_offset = self.y_offset.replace("P", ".", 1)
            self.x_cavity_dimensions = self.x_cavity_dimensions.replace("P", ".", 1)
            self.y_cavity_dimensions = self.y_cavity_dimensions.replace("P", ".", 1)
            self.z_cavity_dimensions = self.z_cavity_dimensions.replace("P", ".", 1)




            ''' Testing that code is parsed correctly.'''
            print("")
            print("    Parameterization Information")
            print("")
            print("    famliy_code = "+self.family_code)
            print("    type_code = "+self.type_code)
            print("    block_unit_length = "+self.block_unit_length+"mm")
            print("    shaft_radius = "+self.shaft_radius+"mm")
            print("    x_units = "+self.x_units)
            print("    y_units = "+self.y_units)
            print("    padding = "+self.padding+"mm")
            print("    orientation = "+self.orientation)
            print("    teeth = "+self.teeth)
            print("    x_cavity_spacing = "+self.x_cavity_spacing+"mm")
            print("    y_cavity_spacing = "+self.y_cavity_spacing+"mm")
            print("    x_cavity_units = "+self.x_cavity_units)
            print("    y_cavity_units = "+self.y_cavity_units)
            print("    x_cavity_dimensions = "+self.x_cavity_dimensions+"mm")
            print("    y_cavity_dimensions = "+self.y_cavity_dimensions+"mm")
            print("    z_cavity_dimensions = "+self.z_cavity_dimensions+"mm")
            print("    cavity_type = "+self.cavity_type)
            print("")
            
            ''' Rules logic goes here ; conditions of which parameters combinations can exist.   '''

            ''' Execute write scad functions.   '''

            self.CUBX0177_BPAN()
            self.scad_file.close()
            
        if (self.type_code=="BPANS2"): # Box panel.
            
            # Example BPANS2 hardware code : "CUBX0177-BPANS2-B7P5SR2P2-X8Y8PP21-IF-SX0Y0-X1Y1-XO0YO0-X19Y19Z1P5-C-SX0Y0-X1Y1-XO0YO0-X10Y10Z1P10-C"

            self.block_unit_length = self.hardware_code.split("-")[2].split("B")[1].split("SR")[0]
            self.shaft_radius = self.hardware_code.split("-")[2].split("B")[1].split("SR")[1]
            self.x_units =  self.hardware_code.split("-")[3].split("X")[1].split("Y")[0]
            self.y_units =  self.hardware_code.split("-")[3].split("Y")[1].split("P")[0]
            self.padding =  "0."+self.hardware_code.split("-")[3].split("PP")[1]

            if (self.hardware_code.split("-")[4].count("R") == 1):
                self.orientation = '"regular"' # Regular orientation.
            elif (self.hardware_code.split("-")[4].count("I") == 1):
                self.orientation = '"inverted"' # Inverted orientation.
            elif (self.hardware_code.split("-")[4].count("C") == 1):
                self.orientation = '"chimera"' # Chimera orientation.
            elif (self.hardware_code.split("-")[4].count("X") == 1):
                self.orientation = '"inverted_chimera"' # Inverted chimera.
            else:
                self.errors.append("Incorrect orientation code.")
                pass
            if (self.hardware_code.split("-")[4].count("T") == 1):
                self.teeth = "true"
            elif (self.hardware_code.split("-")[4].count("F") == 1):
                self.teeth = "false"
            else:
                self.errors.append("Incorrect teeth code.")
                pass
            
            """Draw Inputs From System-Code"""

            self.x_cavity_spacing_1 =  self.hardware_code.split("-")[5].split("X")[1].split("Y")[0]
            self.y_cavity_spacing_1 =  self.hardware_code.split("-")[5].split("X")[1].split("Y")[1]
            self.x_cavity_units_1 =  self.hardware_code.split("-")[6].split("X")[1].split("Y")[0]
            self.y_cavity_units_1 =  self.hardware_code.split("-")[6].split("X")[1].split("Y")[1]
            self.x_offset_1  =  self.hardware_code.split("-")[7].split("XO")[1].split("YO")[0]
            self.y_offset_1  =  self.hardware_code.split("-")[7].split("YO")[1]
            self.x_cavity_dimensions_1 =  self.hardware_code.split("-")[8].split("X")[1].split("Y")[0]
            self.y_cavity_dimensions_1 =  self.hardware_code.split("-")[8].split("X")[1].split("Y")[1].split("Z")[0]
            self.z_cavity_dimensions_1 =  self.hardware_code.split("-")[8].split("X")[1].split("Y")[1].split("Z")[1]

            if (self.hardware_code.split("-")[9].count("S") == 1):
                self.cavity_type_1 = '"S"'
            elif (self.hardware_code.split("-")[9].count("C") == 1):
                self.cavity_type_1 = '"C"'
            else:
                self.errors.append("Incorrect cavity code 1.")
                pass
            
            
            self.x_cavity_spacing_2 =  self.hardware_code.split("-")[10].split("X")[1].split("Y")[0]
            self.y_cavity_spacing_2 =  self.hardware_code.split("-")[10].split("X")[1].split("Y")[1]
            self.x_cavity_units_2 =  self.hardware_code.split("-")[11].split("X")[1].split("Y")[0]
            self.y_cavity_units_2 =  self.hardware_code.split("-")[11].split("X")[1].split("Y")[1]
            self.x_offset_2  =  self.hardware_code.split("-")[12].split("XO")[1].split("YO")[0]
            self.y_offset_2  =  self.hardware_code.split("-")[12].split("YO")[1]
            self.x_cavity_dimensions_2 =  self.hardware_code.split("-")[13].split("X")[1].split("Y")[0]
            self.y_cavity_dimensions_2 =  self.hardware_code.split("-")[13].split("X")[1].split("Y")[1].split("Z")[0]
            self.z_cavity_dimensions_2 =  self.hardware_code.split("-")[13].split("X")[1].split("Y")[1].split("Z")[1]

            if (self.hardware_code.split("-")[14].count("S") == 1):
                self.cavity_type_2 = '"S"'
            elif (self.hardware_code.split("-")[14].count("C") == 1):
                self.cavity_type_2 = '"C"'
            else:
                self.errors.append("Incorrect cavity code 2.")
                pass


            """Format Inputs"""
            self.block_unit_length = self.block_unit_length.replace("P", ".", 1)
            self.shaft_radius = self.shaft_radius.replace("P", ".", 1)
            self.x_cavity_spacing_1 = self.x_cavity_spacing_1.replace("P", ".", 1)
            self.y_cavity_spacing_1 = self.y_cavity_spacing_1.replace("P", ".", 1)
            self.x_offset_1 = self.x_offset_1.replace("P", ".", 1)
            self.y_offset_1 = self.y_offset_1.replace("P", ".", 1)
            self.x_cavity_dimensions_1 = self.x_cavity_dimensions_1.replace("P", ".", 1)
            self.y_cavity_dimensions_1 = self.y_cavity_dimensions_1.replace("P", ".", 1)
            self.z_cavity_dimensions_1 = self.z_cavity_dimensions_1.replace("P", ".", 1)

            self.x_cavity_spacing_2 = self.x_cavity_spacing_2.replace("P", ".", 1)
            self.y_cavity_spacing_2 = self.y_cavity_spacing_2.replace("P", ".", 1)
            self.x_offset_2 = self.x_offset_2.replace("P", ".", 1)
            self.y_offset_2 = self.y_offset_2.replace("P", ".", 1)
            self.x_cavity_dimensions_2 = self.x_cavity_dimensions_2.replace("P", ".", 1)
            self.y_cavity_dimensions_2 = self.y_cavity_dimensions_2.replace("P", ".", 1)
            self.z_cavity_dimensions_2 = self.z_cavity_dimensions_2.replace("P", ".", 1)




            ''' Testing that code is parsed correctly.'''
            print("")
            print("    Parameterization Information")
            print("")
            print("    famliy_code = "+self.family_code)
            print("    type_code = "+self.type_code)
            print("    block_unit_length = "+self.block_unit_length+"mm")
            print("    shaft_radius = "+self.shaft_radius+"mm")
            print("    x_units = "+self.x_units)
            print("    y_units = "+self.y_units)
            print("    padding = "+self.padding+"mm")
            print("    orientation = "+self.orientation)
            print("    teeth = "+self.teeth)
            print("    x_cavity_spacing_1 = "+self.x_cavity_spacing_1+"mm")
            print("    y_cavity_spacing_1 = "+self.y_cavity_spacing_1+"mm")
            print("    x_cavity_units_1 = "+self.x_cavity_units_1)
            print("    y_cavity_units_1 = "+self.y_cavity_units_1)
            print("    x_cavity_dimensions_1 = "+self.x_cavity_dimensions_1+"mm")
            print("    y_cavity_dimensions_1 = "+self.y_cavity_dimensions_1+"mm")
            print("    z_cavity_dimensions_1 = "+self.z_cavity_dimensions_1+"mm")
            print("    cavity_type_1 = "+self.cavity_type_1)
            print("    x_cavity_spacing_2 = "+self.x_cavity_spacing_2+"mm")
            print("    y_cavity_spacing_2 = "+self.y_cavity_spacing_2+"mm")
            print("    x_cavity_units_2 = "+self.x_cavity_units_2)
            print("    y_cavity_units_2 = "+self.y_cavity_units_2)
            print("    x_cavity_dimensions_2 = "+self.x_cavity_dimensions_2+"mm")
            print("    y_cavity_dimensions_2 = "+self.y_cavity_dimensions_2+"mm")
            print("    z_cavity_dimensions_2 = "+self.z_cavity_dimensions_2+"mm")
            print("    cavity_type_2 = "+self.cavity_type_2)
            print("")
            
            ''' Rules logic goes here ; conditions of which parameters combinations can exist.   '''

            ''' Execute write scad functions.   '''

            self.CUBX0177_BPANS2()
            self.scad_file.close()

        elif (self.type_code=="SPAN"): # Simple panel.
            # CUBX0177_SPAN(block_length, shaft_radius, x_units, y_units, x_spacing, y_spacing, x_cavity_units, y_cavity_units, x_offset, y_offset, x_cavity_dimensions, y_cavity_dimensions, z_cavity_dimensions, cavity_type)
            # Example SPAN hardware code : "CUBX0177-SPAN-B7P5SR2P18-X9Y9-SX15Y15-X4Y4-XO0YO0-X7P6Y7P6Z10-S"

            self.block_unit_length = self.hardware_code.split("-")[2].split("B")[1].split("SR")[0]
            self.shaft_radius = self.hardware_code.split("-")[2].split("B")[1].split("SR")[1]
            self.x_units =  self.hardware_code.split("-")[3].split("X")[1].split("Y")[0]
            self.y_units =  self.hardware_code.split("-")[3].split("Y")[1].split("P")[0]

            self.x_cavity_spacing =  self.hardware_code.split("-")[4].split("X")[1].split("Y")[0]
            self.y_cavity_spacing =  self.hardware_code.split("-")[4].split("X")[1].split("Y")[1]
            self.x_cavity_units =  self.hardware_code.split("-")[5].split("X")[1].split("Y")[0]
            self.y_cavity_units =  self.hardware_code.split("-")[5].split("X")[1].split("Y")[1]
            self.x_offset  =  self.hardware_code.split("-")[6].split("XO")[1].split("YO")[0]
            self.y_offset  =  self.hardware_code.split("-")[6].split("YO")[1]
            self.x_cavity_dimensions =  self.hardware_code.split("-")[7].split("X")[1].split("Y")[0]
            self.y_cavity_dimensions =  self.hardware_code.split("-")[7].split("X")[1].split("Y")[1].split("Z")[0]
            self.z_cavity_dimensions =  self.hardware_code.split("-")[7].split("X")[1].split("Y")[1].split("Z")[1]

            if (self.hardware_code.split("-")[8].count("S") == 1):
                self.cavity_type = '"S"'
            elif (self.hardware_code.split("-")[8].count("C") == 1):
                self.cavity_type = '"C"'
            else:
                self.errors.append("Incorrect cavity code.")
                pass

            """Format Inputs"""

            self.block_unit_length = self.block_unit_length.replace("P", ".", 1)
            self.shaft_radius = self.shaft_radius.replace("P", ".", 1)
            self.x_cavity_spacing = self.x_cavity_spacing.replace("P", ".", 1)
            self.y_cavity_spacing = self.y_cavity_spacing.replace("P", ".", 1)
            self.x_offset = self.x_offset.replace("P", ".", 1)
            self.y_offset = self.y_offset.replace("P", ".", 1)
            self.x_cavity_dimensions = self.x_cavity_dimensions.replace("P", ".", 1)
            self.y_cavity_dimensions = self.y_cavity_dimensions.replace("P", ".", 1)
            self.z_cavity_dimensions = self.z_cavity_dimensions.replace("P", ".", 1)

            ''' Rules logic goes here ; conditions of which parameters combinations can exist.   '''

            ''' Execute write scad functions.   '''

            self.CUBX0177_SPAN()
            self.scad_file.close()
            
        if (self.type_code=="SPANS2"): # Simple panel.
            # Example SPANS2 hardware code : "CUBX0177-SPANS2-B7P5SR2P2-X8Y8-SX0Y0-X1Y1-XO0YO0-X19Y19Z1P5-C-SX0Y0-X1Y1-XO0YO0-X10Y10Z1P10-C"
            # CUBX0177_SPANS2( block_length = '+self.block_unit_length+', shaft_radius = '+self.shaft_radius+', x_units = '+self.x_units+', y_units = '+self.y_units+', x_cavity_spacing_1 = '+self.x_cavity_spacing_1+', y_cavity_spacing_1 = '+self.y_cavity_spacing_1+', x_cavity_units_1 = '+self.x_cavity_units_1+', y_cavity_units_1 = '+self.y_cavity_units_1+', x_offset_1 = '+self.x_offset_1+', y_offset_1 = '+self.y_offset_1+', x_cavity_dimensions_1 = '+self.x_cavity_dimensions_1+', y_cavity_dimensions_1 = '+self.y_cavity_dimensions_1+', z_cavity_dimensions_1 = '+self.z_cavity_dimensions_1+', cavity_type_1 = '+self.cavity_type_1+', x_cavity_spacing_2 = '+self.x_cavity_spacing_2+', y_cavity_spacing_2 = '+self.y_cavity_spacing_2+', x_cavity_units_2 = '+self.x_cavity_units_2+', y_cavity_units_2 = '+self.y_cavity_units_2+', x_offset_2 = '+self.x_offset_2+', y_offset_2 = '+self.y_offset_2+', x_cavity_dimensions_2 = '+self.x_cavity_dimensions_2+', y_cavity_dimensions_2 = '+self.y_cavity_dimensions_2+', z_cavity_dimensions_2 = '+self.z_cavity_dimensions_2+', cavity_type_2 = '+self.cavity_type_2+' );\n')
            self.block_unit_length = self.hardware_code.split("-")[2].split("B")[1].split("SR")[0]
            self.shaft_radius = self.hardware_code.split("-")[2].split("B")[1].split("SR")[1]
            self.x_units =  self.hardware_code.split("-")[3].split("X")[1].split("Y")[0]
            self.y_units =  self.hardware_code.split("-")[3].split("Y")[1].split("P")[0]

            self.x_cavity_spacing_1 =  self.hardware_code.split("-")[4].split("X")[1].split("Y")[0]
            self.y_cavity_spacing_1 =  self.hardware_code.split("-")[4].split("X")[1].split("Y")[1]
            self.x_cavity_units_1 =  self.hardware_code.split("-")[5].split("X")[1].split("Y")[0]
            self.y_cavity_units_1 =  self.hardware_code.split("-")[5].split("X")[1].split("Y")[1]
            self.x_offset_1  =  self.hardware_code.split("-")[6].split("XO")[1].split("YO")[0]
            self.y_offset_1  =  self.hardware_code.split("-")[6].split("YO")[1]
            self.x_cavity_dimensions_1 =  self.hardware_code.split("-")[7].split("X")[1].split("Y")[0]
            self.y_cavity_dimensions_1 =  self.hardware_code.split("-")[7].split("X")[1].split("Y")[1].split("Z")[0]
            self.z_cavity_dimensions_1 =  self.hardware_code.split("-")[7].split("X")[1].split("Y")[1].split("Z")[1]

            if (self.hardware_code.split("-")[8].count("S") == 1):
                self.cavity_type_1 = '"S"'
            elif (self.hardware_code.split("-")[8].count("C") == 1):
                self.cavity_type_1 = '"C"'
            else:
                self.errors.append("The cavity code present within the provided system-code is invalid.")
                pass

            self.x_cavity_spacing_2 =  self.hardware_code.split("-")[9].split("X")[1].split("Y")[0]
            self.y_cavity_spacing_2 =  self.hardware_code.split("-")[9].split("X")[1].split("Y")[1]
            self.x_cavity_units_2 =  self.hardware_code.split("-")[10].split("X")[1].split("Y")[0]
            self.y_cavity_units_2 =  self.hardware_code.split("-")[10].split("X")[1].split("Y")[1]
            self.x_offset_2  =  self.hardware_code.split("-")[11].split("XO")[1].split("YO")[0]
            self.y_offset_2  =  self.hardware_code.split("-")[11].split("YO")[1]
            self.x_cavity_dimensions_2 =  self.hardware_code.split("-")[12].split("X")[1].split("Y")[0]
            self.y_cavity_dimensions_2 =  self.hardware_code.split("-")[12].split("X")[1].split("Y")[1].split("Z")[0]
            self.z_cavity_dimensions_2 =  self.hardware_code.split("-")[12].split("X")[1].split("Y")[1].split("Z")[1]

            if (self.hardware_code.split("-")[13].count("S") == 1):
                self.cavity_type_2 = '"S"'
            elif (self.hardware_code.split("-")[13].count("C") == 1):
                self.cavity_type_2 = '"C"'
            else:
                self.errors.append("The cavity code present within the provided system-code is invalid.")
                pass

            """Format Inputs"""

            self.block_unit_length = self.block_unit_length.replace("P", ".", 1)
            self.shaft_radius = self.shaft_radius.replace("P", ".", 1)
            self.x_cavity_spacing_1 = self.x_cavity_spacing_1.replace("P", ".", 1)
            self.y_cavity_spacing_1 = self.y_cavity_spacing_1.replace("P", ".", 1)
            self.x_offset_1 = self.x_offset_1.replace("P", ".", 1)
            self.y_offset_1 = self.y_offset_1.replace("P", ".", 1)
            self.x_cavity_dimensions_1 = self.x_cavity_dimensions_1.replace("P", ".", 1)
            self.y_cavity_dimensions_1 = self.y_cavity_dimensions_1.replace("P", ".", 1)
            self.z_cavity_dimensions_1 = self.z_cavity_dimensions_1.replace("P", ".", 1)
            self.x_cavity_spacing_2 = self.x_cavity_spacing_2.replace("P", ".", 1)
            self.y_cavity_spacing_2 = self.y_cavity_spacing_2.replace("P", ".", 1)
            self.x_offset_2 = self.x_offset_2.replace("P", ".", 1)
            self.y_offset_2 = self.y_offset_2.replace("P", ".", 1)
            self.x_cavity_dimensions_2 = self.x_cavity_dimensions_2.replace("P", ".", 1)
            self.y_cavity_dimensions_2 = self.y_cavity_dimensions_2.replace("P", ".", 1)
            self.z_cavity_dimensions_2 = self.z_cavity_dimensions_2.replace("P", ".", 1)

            ''' Rules logic goes here ; conditions of which parameters combinations can exist.   '''

            ''' Execute write scad functions.   '''

            self.CUBX0177_SPANS2()
            self.scad_file.close()
            
        
        if (self.type_code=="AXLE"): # Square axle.

            # Example SPAN hardware code : "CUBX0177-AXLE-B25SR2P5-A22"
            self.block_unit_length = self.hardware_code.split("-")[2].split("B")[1].split("SR")[0].replace("P", ".", 1) # Block length.
            self.shaft_radius = self.hardware_code.split("-")[2].split("B")[1].split("SR")[1].replace("P", ".", 1) # Shaft radius.
            self.axle_blocks = self.hardware_code.split("-")[3].split("A")[1].replace("P", ".", 1) # Axle blocks.

            ''' Rules logic goes here ; conditions of which parameters combinations can exist.   '''
            
            ''' Testing that code is parsed correctly.'''
            
            print("")
            print("    Parameterization Information")
            print("")
            print("    famliy_code = "+self.family_code)
            print("    type_code = "+self.type_code)
            print("    block_unit_length = "+self.block_unit_length+"mm")
            print("    shaft_radius = "+self.shaft_radius+"mm")
            print("    axle_blocks = "+self.axle_blocks+" blocks")
            print("")
            
            ''' Execute write scad functions.   '''

            self.CUBX0177_AXLE()
            self.scad_file.close()
            
        if (self.type_code=="FYAD"): # Flywheel adapter.

            # Example SPAN hardware code : "CUBX0177-FYAD-B25SR2P5".
            self.block_unit_length = self.hardware_code.split("-")[2].split("B")[1].split("SR")[0] # Block length.
            self.shaft_radius = self.hardware_code.split("-")[2].split("B")[1].split("SR")[1].replace("P", ".", 1) # Shaft radius.

            ''' Rules logic goes here ; conditions of which parameters combinations can exist.   '''

            self.block_unit_length = self.block_unit_length.replace("P", ".", 1)
            self.threshaft_radiusad_starts = self.shaft_radius.replace("P", ".", 1)

            ''' Testing that code is parsed correctly.'''
            print("")
            print("    Parameterization Information")
            print("")
            print("    famliy_code = "+self.family_code)
            print("    type_code = "+self.type_code)
            print("    block_unit_length = "+self.block_unit_length+"mm")
            print("    shaft_radius = "+self.shaft_radius+"mm")
            print("")
            
            ''' Execute write scad functions.   '''

            self.CUBX0177_FYAD()
            self.scad_file.close()
            
        if (self.type_code=="AXAD"): # Axle adapter.

            # Example AXAD hardware code : "CUBX0177-FYAD-B7P5SR2P22-PP32"
            self.block_unit_length = self.hardware_code.split("-")[2].split("B")[1].split("SR")[0] # Block length.
            self.shaft_radius = self.hardware_code.split("-")[2].split("B")[1].split("SR")[1].replace("P", ".", 1) # Shaft radius.
            self.padding =  "0."+self.hardware_code.split("-")[3].split("PP")[1]
            ''' Rules logic goes here ; conditions of which parameters combinations can exist.   '''
            
            self.block_unit_length = self.block_unit_length.replace("P", ".", 1)
            self.threshaft_radiusad_starts = self.shaft_radius.replace("P", ".", 1)
            
            ''' Testing that code is parsed correctly.'''
            print("")
            print("    Parameterization Information")
            print("")
            print("    famliy_code = "+self.family_code)
            print("    type_code = "+self.type_code)
            print("    block_unit_length = "+self.block_unit_length+"mm")
            print("    shaft_radius = "+self.shaft_radius+"mm")
            print("    padding = "+self.padding+"mm")
            print("")
            
            ''' Execute write scad functions.   '''

            self.CUBX0177_AXAD()
            self.scad_file.close()


    def CUBX0177_BPAN(self): # CUBX0177-BPAN-B25SR2P5-X8Y8PP2-RT-SX25Y25-X8Y8-XO3YO5-X20Y20Z10-S
        self.scad_file.write('CUBX0177_BPAN( '+self.block_unit_length+', '+self.shaft_radius+', '+self.x_units+', '+self.y_units+', '+self.padding+', '+self.orientation+', '+self.teeth+', '+self.x_cavity_spacing+', '+self.y_cavity_spacing+', '+self.x_cavity_units+', '+self.y_cavity_units+', '+self.x_offset+', '+self.y_offset+', '+self.x_cavity_dimensions+', '+self.y_cavity_dimensions+', '+self.z_cavity_dimensions+', '+self.cavity_type+');\n')
   
    def CUBX0177_BPANS2(self): # CUBX0177-BPAN-B25SR2P5-X8Y8PP2-RT-SX25Y25-X8Y8-XO3YO5-X20Y20Z10-S-SX25Y25-X8Y8-XO3YO5-X20Y20Z10-S
        self.scad_file.write('CUBX0177_BPANS2( '+self.block_unit_length+', '+self.shaft_radius+', '+self.x_units+', '+self.y_units+', '+self.padding+', '+self.orientation+', '+self.teeth+', '+self.x_cavity_spacing_1+', '+self.x_cavity_spacing_1+', '+self.x_cavity_units_1+', '+self.y_cavity_units_1+', '+self.x_offset_1+', '+self.y_offset_1+', '+self.x_cavity_dimensions_1+', '+self.y_cavity_dimensions_1+', '+self.z_cavity_dimensions_1+', '+self.cavity_type_1+', '+self.x_cavity_spacing_2+', '+self.x_cavity_spacing_2+', '+self.x_cavity_units_2+', '+self.y_cavity_units_2+', '+self.x_offset_2+', '+self.y_offset_2+', '+self.x_cavity_dimensions_2+', '+self.y_cavity_dimensions_2+', '+self.z_cavity_dimensions_2+', '+self.cavity_type_2+');\n')

    # CUBX0177_SPAN(block_length, shaft_radius, x_units, y_units, x_spacing, y_spacing, x_cavity_units, y_cavity_units, x_offset, y_offset, x_cavity_dimensions, y_cavity_dimensions, z_cavity_dimensions, cavity_type)
    def CUBX0177_SPAN(self):
        self.scad_file.write('CUBX0177_SPAN( block_length = '+self.block_unit_length+', shaft_radius = '+self.shaft_radius+', x_units = '+self.x_units+', y_units = '+self.y_units+', x_cavity_spacing = '+self.x_cavity_spacing+', y_cavity_spacing = '+self.y_cavity_spacing+', x_cavity_units = '+self.x_cavity_units+', y_cavity_units = '+self.y_cavity_units+', x_offset = '+self.x_offset+', y_offset = '+self.y_offset+', x_cavity_dimensions = '+self.x_cavity_dimensions+', y_cavity_dimensions = '+self.y_cavity_dimensions+', z_cavity_dimensions = '+self.z_cavity_dimensions+', cavity_type = '+self.cavity_type+' );\n')
    # X8Y8-XO3YO5-X20Y20Z10-S-SX25Y25-X8Y8-XO3YO5-X20Y20Z10-S
    # CUBX0177_SPANS2( block_length = 7.5, shaft_radius = 2.18, 6, 6, 0, 0, 1, 1, 0, 0, 19, 19, 0.75, "C", 0, 0, 1, 1, 0, 0, 12, 12, 10, "S"); 
    # CUBX0177_SPANS2(block_length, shaft_radius, x_units, y_units, x_cavity_spacing_1, y_cavity_spacing_1, x_cavity_units_1, y_cavity_units_1, x_offset_1, y_offset_1, x_cavity_dimensions_1, y_cavity_dimensions_1, z_cavity_dimensions_1, cavity_type_1, x_cavity_spacing_2, y_cavity_spacing_2, x_cavity_units_2, y_cavity_units_2, x_offset_2, y_offset_2, x_cavity_dimensions_2, y_cavity_dimensions_2, z_cavity_dimensions_2, cavity_type_2)
    # Example SPANS2 hardware code : "CUBX0177-SPANS2-B7P5SR2P22-X8Y8-SX0Y0-X1Y1-XO0YO0-X19Y19Z0P75-C-SX0Y0-X1Y1-XO0YO0-X12Y12Z1P10-S"
    def CUBX0177_SPANS2(self):
        self.scad_file.write('CUBX0177_SPANS2( block_length = '+self.block_unit_length+', shaft_radius = '+self.shaft_radius+', x_units = '+self.x_units+', y_units = '+self.y_units+', x_cavity_spacing_1 = '+self.x_cavity_spacing_1+', y_cavity_spacing_1 = '+self.y_cavity_spacing_1+', x_cavity_units_1 = '+self.x_cavity_units_1+', y_cavity_units_1 = '+self.y_cavity_units_1+', x_offset_1 = '+self.x_offset_1+', y_offset_1 = '+self.y_offset_1+', x_cavity_dimensions_1 = '+self.x_cavity_dimensions_1+', y_cavity_dimensions_1 = '+self.y_cavity_dimensions_1+', z_cavity_dimensions_1 = '+self.z_cavity_dimensions_1+', cavity_type_1 = '+self.cavity_type_1+', x_cavity_spacing_2 = '+self.x_cavity_spacing_2+', y_cavity_spacing_2 = '+self.y_cavity_spacing_2+', x_cavity_units_2 = '+self.x_cavity_units_2+', y_cavity_units_2 = '+self.y_cavity_units_2+', x_offset_2 = '+self.x_offset_2+', y_offset_2 = '+self.y_offset_2+', x_cavity_dimensions_2 = '+self.x_cavity_dimensions_2+', y_cavity_dimensions_2 = '+self.y_cavity_dimensions_2+', z_cavity_dimensions_2 = '+self.z_cavity_dimensions_2+', cavity_type_2 = '+self.cavity_type_2+' );\n')


    def CUBX0177_FYAD(self):
        self.scad_file.write('CUBX0177_FYAD( '+self.block_unit_length+', '+self.shaft_radius+' );\n')

    def CUBX0177_AXAD(self):
        self.scad_file.write('CUBX0177_AXAD( '+self.block_unit_length+', '+self.shaft_radius+', '+self.padding+' );\n')
    
    def CUBX0177_AXLE(self):
        self.scad_file.write('CUBX0177_AXLE( '+self.block_unit_length+', '+self.shaft_radius+', '+self.axle_blocks+' );\n')

class CUBX0177_encoding:
    
    def __init__(self):
        self.type_code
        self.system_code
    
    def encode_session(self):

        #type_code = SelectionBranch("Select CUBX0177 type:")
        #type_code.options.append(["1", "BP", "Box Panel", CUBX0177_BP_input.run])
        #type_code.options.append(["2", "SP", "Simple Panel", exit])
        #type_code.options.append(["3", "SQ", "Square Axle", exit])
        #type_code.options.append(["4", "AA", "Axle Adapter", exit])
        #type_code.options.append(["4", "FA", "Flywheel Adapter", exit])
        #type_code.options.append(["b", "Back", "Navigate to previous menu.", exit])
        
        if (self.type_code=="BPAN"): # Box panel.
            pass
        elif (self.type_code=="SPAN"): # Simple panel.
            pass
        elif (self.type_code=="AXLE"): # Square axle.
            pass
        elif (self.type_code=="FYAD"): # Flywheel adapter.
            pass
        elif (self.type_code=="AXAD"): # Axle adapter.
            pass
        else:
            pass