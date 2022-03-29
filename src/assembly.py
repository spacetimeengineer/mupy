#!/usr/bin/env python3
import os 
import hashlib
from coordinates import Coordinates

class Assembly:
    """This class builds json objects which define hardware assembly schemes. 
    These are generally hirearchical. 
    Assemblys are made from aggregations of parts or other assemblys. 
    These positions are typically defined using parametric equations of time $t (referenced in openscad).
    """
    
    def __init__(self, name, coordinates = Coordinates(0,1,[50,50,50],[10,10,10],[0,0,0],[10,10,10])):
        """Runs at object creation."""

        self.name = name # A name that associates with a part or assembly. it should be human readable and does not need to be unique.
        self.description = "no description" # A description of the object.
        self.coordinate_superset = [] # A list which holds coordinate objects for this assembly.
        self.components = [] # A list which contains the actual part and assembly objects. 
        self.parent = ""
        self.errors = [] # A list that collects errors associated with this object.
        self.directory = "" #
        self.file_name = "" 
        self.function_name = ""
        self.id = self.assign_id()

    def assign_id(self):
        """ Assigns an appropriate ID ; one which maintains uniuness but is also alphabetic ; 
        no numbers so that scad code can use it formodule definitions.
        """
        unrefined_hash = "A"+hashlib.sha256(str(id(self)).encode('utf-8')).hexdigest() #
        return self.name+"_"+unrefined_hash[:7] #

    def assign_parent_id(self):
        """"""
        for component in self.components:
            component.parent_id = self.id
        pass

    def assign_coordinates_operand_id(self, coordinates):
        coordinates.operand_id = self.id
        """ Assigns coordinate object extra information about the part it operates on. This works by calling a hidden variable in the Coordinates object which expects this function.  """
    
    def assign_coordinates(self, coordinates): #
        """ Adds another assembly epoche effectivly but it is on the user to utalize the $t time variable properly."""
        self.coordinate_superset.append(coordinates) #


    def encapsulated_components_scad(self):
        """ Returns scad code representations of parts which are encapsulated."""
        
        encapsulated_components_scad = ""
        for component in self.components:
            encapsulated_components_scad = encapsulated_components_scad + str(component.id)+"();" # scad code.
        return encapsulated_components_scad # Returns string of scad function calls.


    def assembly_scad(self):
        """ Returns scad code representations of entire assembly."""

        scad_code = 'module '+str(self.id)+'()\n{\n' # Creates scad codestring to be placed in new file with a file name using the object identification code.
        for coordinates in self.coordinate_superset: # For each coordinate set.

            """This script is contains code which utalizes animation variables ; $t. Using basic linear equations, trajectories are plotted and used for operational and assembly simulations in 3D space."""

            scad_code = scad_code + \
                    '  if ($t >= '+str(coordinates.t_i)+' && $t <= '+str(coordinates.t_f)+')\n'\
                    '  {\n'\
                    '    translate(['+str(coordinates.p_i[0])+'+$t*('+str(coordinates.p_f[0])+'-'+str(coordinates.p_i[0])+') , '+str(coordinates.p_i[1])+'+$t*('+str(coordinates.p_f[1])+'-'+str(coordinates.p_i[1])+'), '+str(coordinates.p_i[2])+'+$t*('+str(coordinates.p_f[2])+'-'+str(coordinates.p_i[2])+') ] ) { rotate(['+str(coordinates.a_i[0])+'+$t*('+str(coordinates.a_f[0])+'-'+str(coordinates.a_i[0])+'), '+str(coordinates.a_i[1])+'+$t*('+str(coordinates.a_f[1])+'-'+str(coordinates.a_i[1])+'), '+str(coordinates.a_i[2])+'+$t*('+str(coordinates.a_f[2])+'-'+str(coordinates.a_i[2])+')]) { '+self.encapsulated_components_scad()+' } }\n'\
                    '  }\n' # scad code.
        scad_code = scad_code + '}\n' # scad code.
        scad_code = scad_code + str(self.id)+'();' # Writes the function calls.
        return scad_code # Returns scad code as a string.

    def assemble(self, directory):
        """ Writes scad file representations of parts and assemblys."""

        if not os.path.exists(directory): # If directory does not exists.
            os.mkdir(directory) # Create directory for new objects.

        scad_file = open(directory+str(self.id)+".scad", "w") # Creates scad file staging without text.
        for component in self.components: # For each part.
            scad_file.write('use <'+component.id+'.scad>;\n') # Import into file.
        scad_file.write(self.assembly_scad()) # Write file.
        scad_file.close() # Close scad file.

    def include(self, component, coordinates): # Includes parts or sub-assemblies with a coordinate set attached to reflect it's position within the assembly.
        """ Includes parts or sub-assemblies with a coordinate set attached to reflect it's position within the assembly."""

        if (type(component).__name__ == "Hardware"): # If it is a part object.
            component.assign_coordinates(coordinates) # Add coordinates to component superset.
        elif (type(component).__name__ == "Assembly"): # If it is an assembly object.
            component.assign_coordinates(coordinates) # Adds coordinates to component superset.
        elif (type(component).__name__ == "Coordinates"): # If it is a coordinate set object.
            self.coordinates_superset.append(component.coordinates_json) # Add to coordinate superset.
        else: # Or else..
            pass # Just pass :)
        self.components.append(component) # Add to component set.

