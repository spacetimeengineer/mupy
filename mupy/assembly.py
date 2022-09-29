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
    
    def __init__(self, name, system_code = None):
        """Runs at object creation."""

        self.name = name # A name that associates with a part or assembly. it should be human readable and does not need to be unique.
        self.description = "no description" # A description of the object.
        self.coordinate_superset = [] # A list which holds coordinate objects for this assembly.
        self.components = [] # A list which contains the actual part and assembly objects. 
        self.parent = "" # Parent (assembly) ID.
        self.errors = [] # A list that collects errors associated with this object.
        self.directory = "" # Workspace directory.
        self.color = None
        self.system_code = system_code
        self.id = self.assign_id() # Assigns a special
        self.assembly_epoch = 0

    def assign_id(self):
        """ Assigns an appropriate ID with required propertied; 
        1.) maintains uniuness using SHA hashing but is also 
        2.) alphabetic such that no numbers so that scad code can use it for module definitions and 
        3.) Contains a name string so that an aspect of ID is human readable.
        4.) Contains discernable information about weather it is a hardware or assembly object. (In this case the string 'A' or' H' is concated.)
        """
        
        # TODO : Need to create a new hash source with the following properties :
        
        # 1.) If a script is run then if the script doesnt change and is run again the hash must remain the same ; only within the context of a single script regardless of where it is executed creates random like strings when infact the purpose is to allow complexity but still be referenceable post-script run.
        # 2.) Not too sensitive. If some parts are deleted or modified then it would be undesirable for each hash to change. In this way hashes should definatly be dependent on system codes and coordinate sets. Seems strange but these need not be replicated anywhere becasue two objects can not occupy the same space.
        
        hash_source = str(self.system_code)+"-"+str(self.name)
        #hash_source = id(self)
        unrefined_hash = "A"+hashlib.sha256(hash_source.encode('utf-8')).hexdigest() # Combines "A" string to represent that is an assembly, a hash to express uniqueness and a name to express human readability and identification.
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


        if (len(self.coordinate_superset)==0): # If there is no coordinate set yet or at all assigned to this hardware object (digital-twin).
            self.assign_coordinates(Coordinates()) # Assign trivial coodinate set; unmoving and existing ($t) being equal from t0 = 0 to tf = 1 .
            

            
        if (len(self.coordinate_superset)==1): # Here you need to add more coordinate sets sepending on choice of epochs.
            
            
            if (self.coordinate_superset[0].t0 > 0): # Here you need to add more coordinate sets sepending on choice of epochs.
                t0 = self.coordinate_superset[0].t0  # Pu0ll from other coordinate information.
                x0 = self.coordinate_superset[0].x0
                y0 = self.coordinate_superset[0].y0
                z0 = self.coordinate_superset[0].z0
                a0 = self.coordinate_superset[0].a0
                b0 = self.coordinate_superset[0].b0
                c0 = self.coordinate_superset[0].c0
                
                self.assign_coordinates(Coordinates(t0 = 0, tf = t0, x0 = x0, y0 =  y0, z0 =  z0, xf = x0, yf =  y0, zf =  z0,  a0 = a0, b0 =  b0, c0 =  c0, af = a0, bf =  b0, cf =  c0))
                
            if (self.coordinate_superset[0].tf < 1): # Here you need to add more coordinate sets sepending on choice of epochs.

                tf = self.coordinate_superset[0].tf  # Pu0ll from other coordinate information.
                tf = self.coordinate_superset[0].tf  # Pu0ll from other coordinate information.
                xf = self.coordinate_superset[0].xf
                yf = self.coordinate_superset[0].yf
                zf = self.coordinate_superset[0].zf
                af = self.coordinate_superset[0].af
                bf = self.coordinate_superset[0].bf
                cf = self.coordinate_superset[0].cf
                
                self.assign_coordinates(Coordinates(t0 = tf, tf = 1, x0 = xf, y0 =  yf, z0 =  zf, xf = xf, yf =  yf, zf =  zf,  a0 = af, b0 =  bf, c0 =  cf, af = af, bf =  bf, cf =  cf))


        for coordinates in self.coordinate_superset: # For each coordinate set.


            scad_code = scad_code + "    /* Animation */\n"

            """This script is contains code which utilizes animation variables ; $t. Using basic linear equations, trajectories are plotted and used for operational and assembly simulations in 3D space."""

            scad_code = scad_code + \
                    '    if ($t >= '+str(coordinates.t0)+' && $t <= '+str(coordinates.tf)+')\n'\
                    '    {\n'
                    
                    
            scad_code = scad_code + "        /* Initialize initial and final position and orientation. These values may be modified for assembly purposes. */\n\n" 

            scad_code = scad_code + "        /* Position */\n"
            scad_code = scad_code + "        x_position_initial = "+str(coordinates.x0)+";    // Initial 'x' position ( in mm ).\n"
            scad_code = scad_code + "        x_position_final = "+str(coordinates.xf)+";      // Final 'x' position ( in mm ).\n"
            scad_code = scad_code + "        y_position_initial = "+str(coordinates.y0)+";    // Initial 'y' position ( in mm ).\n"
            scad_code = scad_code + "        y_position_final = "+str(coordinates.yf)+";      // Final 'y' position ( in mm ).\n"
            scad_code = scad_code + "        z_position_initial = "+str(coordinates.z0)+";    // Initial 'z' position ( in mm ).\n"
            scad_code = scad_code + "        z_position_final = "+str(coordinates.zf)+";      // Final 'z' position ( in mm ).\n\n"

            scad_code = scad_code + "        /* Orientation */\n"
            scad_code = scad_code + "        x_axis_angle_initial = "+str(coordinates.a0)+";  // Initial angle along the 'x' axis. ( in degrees ).\n"
            scad_code = scad_code + "        x_axis_angle_final = "+str(coordinates.af)+";    // Final angle along the 'x' axis. ( in degrees ).\n"
            scad_code = scad_code + "        y_axis_angle_initial = "+str(coordinates.b0)+";  // Initial angle along the 'y' axis. ( in degrees ).\n"
            scad_code = scad_code + "        y_axis_angle_final = "+str(coordinates.bf)+";    // Final angle along the the 'z' axis. ( in degrees ).\n"
            scad_code = scad_code + "        z_axis_angle_initial = "+str(coordinates.c0)+";    // Final angle along the the 'z' axis. ( in degrees ).\n"
            scad_code = scad_code + "        z_axis_angle_final = "+str(coordinates.cf)+";    // Final angle along the 'z' axis. ( in degrees ).\n\n"

            if self.color == None:
                scad_code = scad_code + \
                        '        translate([x_position_initial+($t-'+str(coordinates.t0)+')*(x_position_final-x_position_initial)/('+str(coordinates.tf)+'-'+str(coordinates.t0)+') , y_position_initial+($t-'+str(coordinates.t0)+')*(y_position_final-y_position_initial)/('+str(coordinates.tf)+'-'+str(coordinates.t0)+'), z_position_initial+($t-'+str(coordinates.t0)+')*(z_position_final-z_position_initial)/('+str(coordinates.tf)+'-'+str(coordinates.t0)+') ] ) { rotate([x_axis_angle_initial+($t-'+str(coordinates.t0)+')*(x_axis_angle_final-x_axis_angle_initial)/('+str(coordinates.tf)+'-'+str(coordinates.t0)+'), y_axis_angle_initial+($t-'+str(coordinates.t0)+')*(y_axis_angle_final-y_axis_angle_initial)/('+str(coordinates.tf)+'-'+str(coordinates.t0)+'), z_axis_angle_initial+($t-'+str(coordinates.t0)+')*(z_axis_angle_final-z_axis_angle_initial)/('+str(coordinates.tf)+'-'+str(coordinates.t0)+')]) { '+self.encapsulated_components_scad()+' } }\n'\
                        '    }\n' # scad code.
            else:        
                scad_code = scad_code + \
                        '        translate([x_position_initial+($t-'+str(coordinates.t0)+')*(x_position_final-x_position_initial)/('+str(coordinates.tf)+'-'+str(coordinates.t0)+') , y_position_initial+($t-'+str(coordinates.t0)+')*(y_position_final-y_position_initial)/('+str(coordinates.tf)+'-'+str(coordinates.t0)+'), z_position_initial+($t-'+str(coordinates.t0)+')*(z_position_final-z_position_initial)/('+str(coordinates.tf)+'-'+str(coordinates.t0)+') ] ) { rotate([x_axis_angle_initial+($t-'+str(coordinates.t0)+')*(x_axis_angle_final-x_axis_angle_initial)/('+str(coordinates.tf)+'-'+str(coordinates.t0)+'), y_axis_angle_initial+($t-'+str(coordinates.t0)+')*(y_axis_angle_final-y_axis_angle_initial)/('+str(coordinates.tf)+'-'+str(coordinates.t0)+'), z_axis_angle_initial+($t-'+str(coordinates.t0)+')*(z_axis_angle_final-z_axis_angle_initial)/('+str(coordinates.tf)+'-'+str(coordinates.t0)+')]) { color("'+self.color+'") { '+self.encapsulated_components_scad()+' } } }\n'\
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
            component.parent_assembly_id = self.id
        elif (type(component).__name__ == "Assembly"): # If it is an assembly object.
            component.assign_coordinates(coordinates) # Adds coordinates to component superset.
            component.parent_assembly_id = self.id
        elif (type(component).__name__ == "Coordinates"): # If it is a coordinate set object.
            self.coordinates_superset.append(component.coordinates_json) # Add to coordinate superset.
        else: # Or else..
            pass # Just pass :)
        self.components.append(component) # Add to component set.

