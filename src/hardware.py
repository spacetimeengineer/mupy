#!/usr/bin/env python3

import hashlib
import os, shutil
from .decode import Decode
from os.path import exists

class Hardware:
    """ This class builds json objects which define parts. 
        Parts are hardware codes with more identity 
    """
    def __init__(self, name, hardware_code):

        self.hardware_code = hardware_code # A code which references the geometry of the part. Not the manufacturing process or material.
        self.coordinate_superset = [] # The set of coordinate-set objects associated with this hardware object. TODO : This is relativly unstable. 
        self.errors = [] # Error list associated with this object.
        self.name = name # Hardware object name.
        self.id = self.assign_id() # Object ID. Used for identification and uniquness mostly.
        self.material_code = "unspecified" # A code which describes the intended material for this hardware objectto bemade of.
        self.manufacturing_code = "unspecified" # A code which describes the intended manufacturing process for this hardware object. 
        self.workspace_directory = "" # The directory associated with workspace which contains this hardware object.
        self.stl_file_name = self.hardware_code+".stl" # The string path variable associated with the .stl file which this object helps generate.
        self.scad_file_name = self.id+".scad" # The string path variable associated with the scad file which is used to render the .stl file.

    def assign_id(self):
        """ Assigns an appropriate ID ; one which maintains uniuness but is also alphabetic ; 
        no numbers so that scad code can use it formodule definitions.
        """
        unrefined_hash = "P"+hashlib.sha256(str(id(self)).encode('utf-8')).hexdigest() #
        return self.name+"_"+unrefined_hash[:7] #
    
    def assign_coordinates(self, coordinates): #
        """ Adds another assembly epoche effectivly but it is on the user to utalize the $t time variable properly."""
        self.coordinate_superset.append(coordinates) #

    def assign_coordinates_operand_id(self, coordinates):
        coordinates.operand_id = self.id
        """ Assigns coordinate object extra information about the part it operates on. This works by calling a hidden variable in the Coordinates object which expects this function.  """

    def hardware_scad(self): # Retuns scad code and imports the hardware code specified.
        """ Retuns scad code and imports the hardware code specified."""

        scad_code = 'module '+self.id+'()\n{\n' #
        for coordinates in self.coordinate_superset: #
            scad_code = scad_code + \
                    '  if ($t >= '+str(coordinates.t_i)+' && $t <= '+str(coordinates.t_f)+')\n'\
                    '  {\n'\
                    '    translate(['+ str(coordinates.p_i[0])+'+$t*('+str(coordinates.p_f[0])+'-'+ str(coordinates.p_i[0])+') , '+ str(coordinates.p_i[1])+'+$t*('+ str(coordinates.p_f[1])+'-'+ str(coordinates.p_i[1])+'), '  \
                    + str(coordinates.p_i[2])+'+$t*('+ str(coordinates.p_f[2])+'-'+ str(coordinates.p_i[2])+') ] ) { rotate(['+ str(coordinates.a_i[0])+'+$t*('+ str(coordinates.a_f[0])+'-'+ str(coordinates.a_i[0])+'), '  \
                    + str(coordinates.a_i[1])+'+$t*('+ str(coordinates.a_f[1])+'-'+ str(coordinates.a_i[1])+'), '+ str(coordinates.a_i[2])+'+$t*('+str(coordinates.a_f[2])+'-'+ str(coordinates.a_i[2])+')])' \
                    +' { import("stl_files/'+ self.hardware_code + '.stl"); } }\n'\
                    '  }\n' # translation block sca code.
        scad_code = scad_code + '}\n' # Finishes themodule closing bracket.
        scad_code = scad_code + self.id+'();' # Writes the scad code used to call the function.

        return scad_code # Returns scad code.
    
    def write_scad(self, directory):
        """Writes .scad code for this hardware object."""
        if not os.path.exists(directory): # Checks if main workspace directory exists.
            os.mkdir(directory) # Creates the workspace directory.

        if not os.path.exists(directory+"stl_files/"): # Checks if the stl_file folder exists.
            os.mkdir(directory+"stl_files/") # Creates the stl_files directory.

        scad_file = open(directory+self.scad_file_name, "w") # Creates new .scad file.
        scad_file.write(self.hardware_scad()) # Writes scad code to file.
        scad_file.close() # Close file.

        """ Builds STLs and dependencies. Deletes everything after object renders."""

        Decode(self.hardware_code, directory) #
        if not exists(directory+"stl_files/"+self.hardware_code+".stl"): #
            os.system("openscad -o "+directory+"stl_files/"+self.hardware_code+".stl "+directory+self.hardware_code+".scad") # This is the scad file used to create the stl files
            
        if exists(directory+self.hardware_code+".scad"):
            try:
                os.remove(directory+self.hardware_code+".scad")
            except OSError:
                print(Exception)
    
    
    def build_stl(self, directory):
        """"""
        print("Decoding : "+self.hardware_code)
        Decode(self.hardware_code, directory) # This is where the hardware code is converted into an scad codewhich can be rendered to an stl.
        if not exists(directory+"stl_files/"+self.hardware_code+".stl"): #
            print("Rendering : "+self.hardware_code+".stl")
            os.system("openscad -o "+directory+"stl_files/"+self.hardware_code+".stl "+directory+self.hardware_code+".scad") # This is the scad file used to create the stl files
    
    def remove_jig(self, directory): # Called with each run command per part.
        """Removes files which have served thier purpose and are no longer needed."""
        if exists(directory+self.hardware_code+".scad"):# Checks for the existence of an .scad file in the workspace with name equal to that of the hardware code.
            try: # Attempt to delete scad file jig.
                os.remove(directory+self.hardware_code+".scad") # Remove scad file with a name equal to that of the hardware code. This file is part of the jig.
            except OSError: # If there is an error with attempting to delete the scad needed to render the STL.
                print(Exception) # Prints exception.
        if exists(directory+"scad"): # Checks if scad directory is present in the workspace directory.
            shutil.rmtree(directory+"scad") # Remove scad directory. TODO : Check this the path may of changed since the reorg.

    def build_hardware(self, directory):
        """Clean function which builds and manages stl files """
        self.write_scad(directory) # Write scad files nessecarry to build stl. These files are temporary and the name of these files are equivilent to the hardware code currently.
        self.build_stl(directory) # Builds stl from hardware code.
        self.remove_jig(directory) # Removes unnessecary files which were used to buld the stl.
 