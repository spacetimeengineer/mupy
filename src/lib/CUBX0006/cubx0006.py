#!/usr/bin/env python3

class CUBX0006:
    """ This class builds digital representations of basic block type elements."""

    def __init__(self, hardware_code):

        self.hardware_code = hardware_code
        self.type_code = ""
        self.required_imports = ["CUBX0006.scad"]

        if (self.type_code=="BLK"):

            self.length = hardware_code.split("-")[2].split("M")[1]
            self.height = hardware_code.split("-")[3].split("L")[1].split("H")[0]
            self.width = hardware_code.split("-")[3].split("H")[1].split("W")[0]
            
            self.CUBX0006_BLK()

        else:
            pass
    
    def CUBX0006_BLK(self):
        """  """
        self.scad_file.write('CUBX0006_BLK(length='+str(self.length)+', height='+str(self.height)+', width='+str(self.width)+');')
