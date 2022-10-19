#!/usr/bin/env python3
import os # Importsos library. This is useful for running linux commands with python.
from mupy.mucli.input_branch import InputBranch

class CYLX0006:
    """ This class builds digital representations of basic block type elements."""

    def __init__(self, hardware_code, directory):
        """ This class handles decoding of all CYLX0006 family codes. """
        self.id = id # This is a unique name or tag referencing a particular object in a set.
        self.hardware_code = hardware_code # Hardware code fed directly from script or user. 
        
        if len(self.hardware_code.split("-")) < 2: # If there is no type code available.
            print("There is no type-code present within the provided input.")
        else:
            self.type_code = self.hardware_code.split("-")[1] # The second section in the hardware code.
            
        self.directory = directory # Workspace directory to be specific.

        self.scad_file_name = directory +"/"+hardware_code +".scad" # This scad file is used to build the stl. It can be deleted afterwards. # TODO : Delete this file after run() command is called.
        self.scad_file = open(self.scad_file_name, 'w+')  # open file in append mode
        os.system("cp -R "+os.path.dirname(__file__)+"/scad/ "+ self.directory)
        self.scad_file.write('use <scad/CYLX0006.scad>;\n\n') # Write imports.

        if (self.type_code=="PIP"): # Example PIP hardware code : CYLX0006-PIP-L67W796H897
            
            """Example : CYLX0006-PIP-L44O77I12
               Schema : CYLX0006-PIP-L<Length(mm)>O<OuterRadus(mm)>I<InnerRadus(mm)>"""

            self.length = hardware_code.split("-")[2].split("L")[1].split("O")[0] # Defines length of a block. Pulled directly from hardware code.
            self.outer_radius = hardware_code.split("-")[2].split("O")[1].split("I")[0] # Defines width of a block. Pulled directly from hardware code.
            self.inner_radius = hardware_code.split("-")[2].split("I")[1] # Defines height of a box. Pulled directly from hardware code.
            
            
            self.length = self.length.replace("P", ".", 1)
            self.outer_radius = self.outer_radius.replace("P", ".", 1)
            self.inner_radius = self.inner_radius.replace("P", ".", 1)

            ''' Testing that code is parsed correctly.'''
            print("")
            print("    Parameterization Information")
            print("")
            print("    length = "+self.length+"mm")
            print("    outer radius = "+self.outer_radius+"mm")
            print("    inner radius = "+self.inner_radius+"mm")
            print("")
            
            self.CYLX0006_PIP() # Writes function to scad file with parameters set.
            
        # CYLX0006_COUP(inner_shaft_radius_a, outer_shaft_radius_a, inner_shaft_depth_a, inner_shaft_radius_b, outer_shaft_radius_b, inner_shaft_depth_b, intershaft_separation_length)
        
        if (self.type_code=="COUP"): # Example PIP hardware code : CYLX0006-PIP-L67W796H897
            
            """Example : CYLX0006-COUP-I25O30D25-I35O40D75-L50
               Schema : CYLX0006-COUP-I<>O<>D<>-I<>O<>D<>-L<>"""

            self.inner_shaft_radius_a = hardware_code.split("-")[2].split("I")[1].split("O")[0] #
            self.outer_shaft_radius_a = hardware_code.split("-")[2].split("O")[1].split("D")[0] #
            self.inner_shaft_depth_a = hardware_code.split("-")[2].split("D")[1] # 
            self.inner_shaft_radius_b = hardware_code.split("-")[3].split("I")[1].split("O")[0] #
            self.outer_shaft_radius_b = hardware_code.split("-")[3].split("O")[1].split("D")[0] #
            self.inner_shaft_depth_b = hardware_code.split("-")[3].split("D")[1] #
            self.intershaft_separation_length = hardware_code.split("-")[4].split("L")[1] #
            
            
            self.inner_shaft_radius_a = self.inner_shaft_radius_a.replace("P", ".", 1)
            self.outer_shaft_radius_a = self.outer_shaft_radius_a.replace("P", ".", 1)
            self.inner_shaft_depth_a = self.inner_shaft_depth_a.replace("P", ".", 1)
            self.inner_shaft_radius_b = self.inner_shaft_radius_b.replace("P", ".", 1)
            self.outer_shaft_radius_b = self.outer_shaft_radius_b.replace("P", ".", 1)
            self.inner_shaft_depth_b = self.inner_shaft_depth_b.replace("P", ".", 1)
            self.intershaft_separation_length = self.intershaft_separation_length.replace("P", ".", 1)
            
            self.total_length = float(self.intershaft_separation_length)+float(self.inner_shaft_depth_a)+float(self.inner_shaft_depth_b)
            
            self.CYLX0006_COUP()

            ''' Testing that code is parsed correctly.'''
            print("")
            print("    Parameterization Information")
            print("")
            print("    inner-shaft radius A = "+self.inner_shaft_radius_a+"mm")
            print("    outer-shaft radius A = "+self.outer_shaft_radius_a+"mm")
            print("    inner-shaft depth A = "+self.inner_shaft_depth_a+"mm")
            print("    inner-shaft radius B = "+self.inner_shaft_radius_b+"mm")
            print("    outer-shaft radius B = "+self.outer_shaft_radius_b+"mm")
            print("    inner-shaft depth B = "+self.inner_shaft_depth_b+"mm")
            print("    intershaft-separation length = "+self.intershaft_separation_length+"mm")
            print("    total length = "+str(self.total_length)+"mm")
            print("")
        
        else:
            pass # Just pass.
    
    def CYLX0006_PIP(self): # Example PIP hardware code : CYLX0006-PIP-L67W796H897
        """  Writes CYLX0006_PIP function to scad file with parameters pulled from hardware code. """
        self.scad_file.write('CYLX0006_PIP(length='+str(self.length).replace('P','.')+', outer_radius='+str(self.outer_radius).replace('P','.')+', inner_radius='+str(self.inner_radius).replace('P','.')+');') # Writes function to scad file with parameters set.


    def CYLX0006_COUP(self): # Example PIP hardware code : CYLX0006-COUP-I25O30D25-I35O40D75-L50
        """  Writes CYLX0006_PIP function to scad file with parameters pulled from hardware code. """
        self.scad_file.write('CYLX0006_COUP(inner_shaft_radius_a='+str(self.inner_shaft_radius_a).replace('P','.')+', outer_shaft_radius_a='+str(self.outer_shaft_radius_a).replace('P','.')+', inner_shaft_depth_a='+str(self.inner_shaft_depth_a).replace('P','.')+', inner_shaft_radius_b='+str(self.inner_shaft_radius_b).replace('P','.')+', outer_shaft_radius_b='+str(self.outer_shaft_radius_b).replace('P','.')+', inner_shaft_depth_b='+str(self.inner_shaft_depth_b).replace('P','.')+', intershaft_separation_length='+str(self.intershaft_separation_length).replace('P','.')+');') # Writes function to scad file with parameters set.


class CYLX0006_encoding:
    def __init__(self):
        self.encoding = ""
    
    def encode_session(self):
        length = InputBranch("Enter block length in millimeters (mm)")
        width = InputBranch("Enter width length in millimeters (mm)")
        height = InputBranch("Enter height length in millimeters (mm)")
        length.run()
        width.run()
        height.run()
        system_code = "CYLX0006-PIP-L"+length.user_input+"W"+width.user_input+"H"+height.user_input
        self.encoding = system_code