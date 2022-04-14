#!/usr/bin/env python3
import os 
import hashlib
from .coordinates import Coordinates

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
        self.parent = "" # Parent (assembly) ID.
        self.errors = [] # A list that collects errors associated with this object.
        self.directory = "" # Workspace directory.
        self.id = self.assign_id() # Assigns a special

    def assign_id(self):
        """ Assigns an appropriate ID with required propertied; 
        1.) maintains uniuness using SHA hashing but is also 
        2.) alphabetic such that no numbers so that scad code can use it for module definitions and 
        3.) Contains a name string so that an aspect of ID is human readable.
        4.) Contains discernable information about weather it is a hardware or assembly object. (In this case the string 'A' or' H' is concated.)
        """
        unrefined_hash = "A"+hashlib.sha256(str(id(self)).encode('utf-8')).hexdigest() # Combines "A" string to represent that is an assembly, a hash to express uniqueness and a name to express human readability and identification.
        return self.name+"_"+unrefined_hash[:7] # Returns assembly ID.

    def assign_parent_id(self):
        """Empowers each child component a reference to its parent ID ; The ID of this class object."""
        for component in self.components: # For each component in the components of this assembly object.
            component.parent_id = self.id # Parent assembly assigns reference information about itself to it's children.
        pass

    def assign_coordinates_operand_id(self, coordinates):
        """ Assigns coordinate object extra information about the part it operates on. This works by calling a hidden variable in the Coordinates object which expects this function.  """
        coordinates.operand_id = self.id # Assigns an operand ID to the coordinate object.

    def assign_coordinates(self, coordinates): #
        """ Adds another assembly epoche effectivly but it is on the user to utalize the $t time variable properly."""
        self.coordinate_superset.append(coordinates) # Adds a coordinate set to the coordinate superset. TODO : More needs to be done with the coordinate superset.


    def encapsulated_components_scad(self):
        """ Returns scad code representations of parts which are encapsulated."""
        
        encapsulated_components_scad = "" # Declares scad code component.
        for component in self.components: # For each child component in this assembly object.
            encapsulated_components_scad = encapsulated_components_scad + str(component.id)+"();" # scad code which just writes the child scad modules to render and execute within the parent assembly.
        return encapsulated_components_scad # Returns string of scad function calls.


    def assembly_scad(self):
        """ Returns scad code representations of entire assembly."""

        scad_code = 'module '+str(self.id)+'()\n{\n' # Creates scad codestring to be placed in new file with a file name using the object identification code.
        for coordinates in self.coordinate_superset: # For each coordinate set.

            """This script is contains code which utilizes animation variables ; $t. Using basic linear equations, trajectories are plotted and used for operational and assembly simulations in 3D space."""

            scad_code = scad_code + \
                    '  if ($t >= '+str(coordinates.t_i)+' && $t <= '+str(coordinates.t_f)+')\n'\
                    '  {\n'\
                    '    translate(['+str(coordinates.p_i[0])+'+$t*('+str(coordinates.p_f[0])+'-'+str(coordinates.p_i[0])+') , '+str(coordinates.p_i[1])+'+$t*('+str(coordinates.p_f[1])+'-'+str(coordinates.p_i[1])+'), '+str(coordinates.p_i[2])+'+$t*('+str(coordinates.p_f[2])+'-'+str(coordinates.p_i[2])+') ] ) { rotate(['+str(coordinates.a_i[0])+'+$t*('+str(coordinates.a_f[0])+'-'+str(coordinates.a_i[0])+'), '+str(coordinates.a_i[1])+'+$t*('+str(coordinates.a_f[1])+'-'+str(coordinates.a_i[1])+'), '+str(coordinates.a_i[2])+'+$t*('+str(coordinates.a_f[2])+'-'+str(coordinates.a_i[2])+')]) { '+self.encapsulated_components_scad()+' } }\n'\
                    '  }\n' # scad code.
        scad_code = scad_code + '}\n' # scad code.
        scad_code = scad_code + str(self.id)+'();' # Writes the function calls.
        return scad_code # Returns scad code as a string.

    def assemble(self, directory):
        """ Writes scad file representations of parts and assemblys. This function is called in the generation function in the workspace object."""

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

