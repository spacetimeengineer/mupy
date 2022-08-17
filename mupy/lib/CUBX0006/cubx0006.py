#!/usr/bin/env python3
import os # Importsos library. This is useful for running linux commands with python.
from mupy.mucli.input_branch import InputBranch

class CUBX0006:
    """ This class builds digital representations of basic block type elements."""

    def __init__(self, hardware_code, directory):
        """ This class handles decoding of all CUBX0006 family codes. """
        self.id = id # This is a unique name or tag referencing a particular object in a set.
        self.hardware_code = hardware_code # Hardware code fed directly from script or user. 
        
        if len(self.hardware_code.split("-")) < 2: # If there is no type code available.
            print("No typecode")
        else:
            self.type_code = self.hardware_code.split("-")[1] # The second section in the hardware code.
            
        self.directory = directory # Workspace directory to be specific.

        self.scad_file_name = directory +"/"+hardware_code +".scad" # This scad file is used to build the stl. It can be deleted afterwards. # TODO : Delete this file after run() command is called.
        self.scad_file = open(self.scad_file_name, 'w+')  # open file in append mode
        os.system("cp -R "+os.path.dirname(__file__)+"/scad/ "+ self.directory)
        self.scad_file.write('use <scad/CUBX0006.scad>;\n\n') # Write imports.

        if (self.type_code=="BLK"): # Example BLK hardware code : CUBX0006-BLK-L67W796H897
            """Example : CUBX0006-BLK-L67W796H897
               Schema : CUBX0006-BLK-L<Length(mm)>W<Width(mm)>H<Height(mm)>"""

            self.length = hardware_code.split("-")[2].split("L")[1].split("W")[0] # Defines length of a block. Pulled directly from hardware code.
            self.width = hardware_code.split("-")[2].split("W")[1].split("H")[0] # Defines width of a block. Pulled directly from hardware code.
            self.height = hardware_code.split("-")[2].split("H")[1] # Defines height of a box. Pulled directly from hardware code.
            
            
            self.length = self.length.replace("P", ".", 1)
            self.width = self.width.replace("P", ".", 1)
            self.height = self.height.replace("P", ".", 1)

            ''' Testing that code is parsed correctly.'''
            print("    Parameterization Information")
            print("")
            print("    length = "+self.length+"mm")
            print("    width = "+self.width+"mm")
            print("    height = "+self.height+"mm")
            print("")
            
            self.CUBX0006_BLK() # Writes function to scad file with parameters set.

        else:
            pass # Just pass.
    
    def CUBX0006_BLK(self): # Example BLK hardware code : CUBX0006-BLK-L67W796H897
        """  Writes CUBX0006_BLK function to scad file with parameters pulled from hardware code. """
        self.scad_file.write('CUBX0006_BLK(length='+str(self.length).replace('P','.')+', height='+str(self.height).replace('P','.')+', width='+str(self.width).replace('P','.')+');') # Writes function to scad file with parameters set.

class CUBX0006_encoding:
    def __init__(self):
        self.encoding = ""
    
    def encode_session(self):
        length = InputBranch("Enter block length in millimeters (mm)")
        width = InputBranch("Enter width length in millimeters (mm)")
        height = InputBranch("Enter height length in millimeters (mm)")
        length.run()
        width.run()
        height.run()
        system_code = "CUBX0006-BLK-L"+length.user_input+"W"+width.user_input+"H"+height.user_input
        self.encoding = system_code