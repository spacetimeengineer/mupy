#!/usr/bin/env python3
import os # Importsos library. This is useful for running linux commands with python.
from src.psiterm.input_branch import InputBranch

class CUBX0006:
    """ This class builds digital representations of basic block type elements."""

    def __init__(self, hardware_code, directory):
        """ This class handles decoding of all CUBX0006 family codes. """
        self.id = id # This is a unique name or tag referencing a particular object in a set.
        self.hardware_code = hardware_code # Hardware code fed directly from script or user. 
        self.type_code = self.hardware_code.split("-")[1] # The second section in the hardwarecode.
        self.directory = directory # Workspace directory to be specific.

        self.scad_file_name = directory +"/"+hardware_code +".scad" # This scad file is used to build the stl. It can be deleted afterwards. # TODO : Delete this file after run() command is called.
        self.scad_file = open(self.scad_file_name, 'w+')  # open file in append mode
        print(self.scad_file_name)
        os.system("cp -R src/lib/CUBX0006/ "+ self.directory) # Copies resouces into the workspace directory. These will be deletd later.
        self.scad_file.write('use <CUBX0006/scad/CUBX0006.scad>;\n\n') # Write imports.

        if (self.type_code=="BLK"): # Example BLK hardware code : CUBX0006-BLK-L67W796H897
            """Example : CUBX0006-BLK-L67W796H897
               Schema : CUBX0006-BLK-L<Length(mm)>W<Width(mm)>H<Height(mm)>"""

            self.length = hardware_code.split("-")[2].split("L")[1].split("W")[0] # Defines length of a block. Pulled directly from hardware code.
            self.width = hardware_code.split("-")[2].split("W")[1].split("H")[0] # Defines width of a block. Pulled directly from hardware code.
            self.height = hardware_code.split("-")[2].split("H")[1] # Defines height of a box. Pulled directly from hardware code.
            
            self.CUBX0006_BLK() # Writes function to scad file with parameters set.

        else:
            pass # Just pass.
    
    def CUBX0006_BLK(self): # Example BLK hardware code : CUBX0006-BLK-L67W796H897
        """  Writes CUBX0006_BLK function to scad file with parameters pulled from hardware code. """
        self.scad_file.write('CUBX0006_BLK(length='+str(self.length)+', height='+str(self.height)+', width='+str(self.width)+');') # Writes function to scad file with parameters set.

def CUBX0006_BLK_encode_session():

    input("")
    input("")
    input("")

