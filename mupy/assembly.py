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
        self.color = "white"

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
            encapsulated_components_scad = encapsulated_components_scad + " " + str(component.id)+"();" # scad code which just writes the child scad modules to render and execute within the parent assembly.
        return encapsulated_components_scad # Returns string of scad function calls.


    def assembly_scad(self):
        """ Returns scad code representations of entire assembly."""

        scad_code = '\n/* A module dedicated to this assembly. This module is only called once becasue it references the unique hardware assembly operation (In both real and virtual space) which only needs to be done once. \nThese components are themselves other hardware and assembly objects which carries both python3 and scad representation and eferences other files like these.*/\n'
        scad_code = scad_code + 'module '+str(self.id)+'()\n{\n' # Creates scad codestring to be placed in new file with a file name using the object identification code.


        if (len(self.coordinate_superset)==0):
            self.assign_coordinates(Coordinates(0,1,[0,0,0],[0,0,0],[0,0,0],[0,0,0]))
            
            
            
            
        if (len(self.coordinate_superset)==1): # Here you need to add more coordinate sets sepending on choice of epochs.
            
            
            if (self.coordinate_superset[0].time_0 > 0): # Here you need to add more coordinate sets sepending on choice of epochs.
                time_f = self.coordinate_superset[0].time_0  # Pu0ll from other coordinate information.
                position_0 = self.coordinate_superset[0].position_0
                orientation_0 = self.coordinate_superset[0].orientation_0
                self.assign_coordinates(Coordinates(0,time_f,position_0,position_0,orientation_0,orientation_0))#TODO: Need to pull resto of information.
                
            if (self.coordinate_superset[0].time_f < 1): # Here you need to add more coordinate sets sepending on choice of epochs.
                position_f = self.coordinate_superset[0].position_f
                orientation_f = self.coordinate_superset[0].orientation_f
                time_0 = self.coordinate_superset[0].time_f  # Pu0ll from other coordinate information.
                
                self.assign_coordinates(Coordinates(time_0,1,position_f,position_f,orientation_f,orientation_f))


        for coordinates in self.coordinate_superset: # For each coordinate set.


            scad_code = scad_code + "    /* Animation */\n"

            """This script is contains code which utilizes animation variables ; $t. Using basic linear equations, trajectories are plotted and used for operational and assembly simulations in 3D space."""

            scad_code = scad_code + \
                    '    if ($t >= '+str(coordinates.t_i)+' && $t <= '+str(coordinates.t_f)+')\n'\
                    '    {\n'
                    
                    
            scad_code = scad_code + "        /* Initialize initial and final position and orientation. These values may be modified for assembly purposes. */\n\n" 

            scad_code = scad_code + "        /* Position */\n"
            scad_code = scad_code + "        x_position_initial = "+str(coordinates.p_i[0])+";    // Initial 'x' position ( in mm ).\n"
            scad_code = scad_code + "        x_position_final = "+str(coordinates.p_f[0])+";      // Final 'x' position ( in mm ).\n"
            scad_code = scad_code + "        y_position_initial = "+str(coordinates.p_i[1])+";    // Initial 'y' position ( in mm ).\n"
            scad_code = scad_code + "        y_position_final = "+str(coordinates.p_f[1])+";      // Final 'y' position ( in mm ).\n"
            scad_code = scad_code + "        z_position_initial = "+str(coordinates.p_i[2])+";    // Initial 'z' position ( in mm ).\n"
            scad_code = scad_code + "        z_position_final = "+str(coordinates.p_f[2])+";      // Final 'z' position ( in mm ).\n\n"

            scad_code = scad_code + "        /* Orientation */\n"
            scad_code = scad_code + "        x_axis_angle_initial = "+str(coordinates.a_i[0])+";  // Initial angle along the 'x' axis. ( in degrees ).\n"
            scad_code = scad_code + "        x_axis_angle_final = "+str(coordinates.a_f[0])+";    // Final angle along the 'x' axis. ( in degrees ).\n"
            scad_code = scad_code + "        y_axis_angle_initial = "+str(coordinates.a_i[1])+";  // Initial angle along the 'y' axis. ( in degrees ).\n"
            scad_code = scad_code + "        y_axis_angle_final = "+str(coordinates.a_f[1])+";    // Final angle along the the 'z' axis. ( in degrees ).\n"
            scad_code = scad_code + "        z_axis_angle_initial = "+str(coordinates.a_i[2])+";    // Final angle along the the 'z' axis. ( in degrees ).\n"
            scad_code = scad_code + "        z_axis_angle_final = "+str(coordinates.a_f[2])+";    // Final angle along the 'z' axis. ( in degrees ).\n\n"

                    
            scad_code = scad_code + \
                    '        translate([x_position_initial+($t-'+str(coordinates.t_i)+')*(x_position_final-x_position_initial)/('+str(coordinates.t_f)+'-'+str(coordinates.t_i)+') , y_position_initial+($t-'+str(coordinates.t_i)+')*(y_position_final-y_position_initial)/('+str(coordinates.t_f)+'-'+str(coordinates.t_i)+'), z_position_initial+($t-'+str(coordinates.t_i)+')*(z_position_final-z_position_initial)/('+str(coordinates.t_f)+'-'+str(coordinates.t_i)+') ] ) { rotate([x_axis_angle_initial+($t-'+str(coordinates.t_i)+')*(x_axis_angle_final-x_axis_angle_initial)/('+str(coordinates.t_f)+'-'+str(coordinates.t_i)+'), y_axis_angle_initial+($t-'+str(coordinates.t_i)+')*(y_axis_angle_final-y_axis_angle_initial)/('+str(coordinates.t_f)+'-'+str(coordinates.t_i)+'), z_axis_angle_initial+($t-'+str(coordinates.t_i)+')*(z_axis_angle_final-z_axis_angle_initial)/('+str(coordinates.t_f)+'-'+str(coordinates.t_i)+')]) { color("'+self.color+'") { '+self.encapsulated_components_scad()+' } } }\n'\
                    '    }\n' # scad code.
                    
        """ This bit here is so the assembly time quantums dont delete the object from ever coming into view."""       
                         
                    
        scad_code = scad_code + '}\n\n' # scad code.
        scad_code = scad_code + '/* Run */\n' # scad code.
        scad_code = scad_code + str(self.id)+'();' # Writes the function calls.
        return scad_code # Returns scad code as a string.

    def assemble(self, directory):
        """ Writes scad file representations of parts and assemblys. This function is called in the generation function in the workspace object."""

        if not os.path.exists(directory): # If directory does not exists.
            os.mkdir(directory) # Create directory for new objects.
        # TODO: may need to fix a double slash here.
        scad_file = open(directory+"/"+str(self.id)+".scad", "w") # Creates scad file staging without text.
        scad_file.write("\n/* Manufacturing Utility : Generated hardware assembly .scad file. */\n\n")
        for component in self.components: # For each part.
            scad_file.write('/* Imports assembly module '+component.id+'() from "'+component.id+'.scad" . These components are themselves other hardware and assembly \nobjects which carries both python3 and scad representation and eferences other files like these.*/\n') # A comment describing the import structure and it's relation to the assembly.

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

