#!/usr/bin/env python3

from genericpath import isdir
import hashlib
import os, shutil
from .decode import Decode
from os.path import exists
from .coordinates import Coordinates
import urllib.request

class Hardware:
    """ This class builds json objects which define parts. 
        Parts are hardware codes with more identity 
    """
    def __init__(self, name, hardware_code):
        """_summary_

        Args:
            name (_type_): _description_
            hardware_code (_type_): _description_
        """

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
        self.color = "white" # 
        self.stl_imported = False # Determines if the hardware object handles a system-code based design or a custom imported design.
        self.imported_stl = "" # Remote or local url/pathof stl file.
        self.parent_assembly_id = "" # Keeps a record of parent assembly ID.

        if hardware_code.endswith('.stl'): # Checks if file imported is a .stl file.
                
            self.stl_imported = True # Sets boolean state variable which keeps track of the information that an .stl file was imported.
            self.imported_stl = hardware_code.split("/")[len(hardware_code.split("/"))-1] # Gets the fike name of the .stl file and removes the url. Information is not lost as the url is the hardware code.
            
    def assign_id(self):
        """Assigns an appropriate ID ; one which maintains uniuness but is also alphabetic ; 
        no numbers so that scad code can use it formodule definitions.

        Returns:
            String: Returns hash ID with reoccurance feature.
        """
        hash_source = str(self.hardware_code)+"-"+str(self.name)
        #hash_source = id(self)
        unrefined_hash = "P"+hashlib.sha256(hash_source.encode('utf-8')).hexdigest() #
        return self.name+"_"+unrefined_hash[:7] #
    
    def assign_coordinates(self, coordinates): #
        """Adds another assembly epoche effectivly but it is on the user to utilize the $t time variable properly.

        Args:
            coordinates (Coordinates): Assigns coordinate information to hardware class object. It need not be the only coordinate set.
        """
        self.coordinate_superset.append(coordinates) #

    def assign_coordinates_operand_id(self, coordinates):
        """_summary_

        Args:
            coordinates (_type_): The coordinate objects associated with hardware contains a operand_id variable which stores the id of the hardware the coordinate transformations are operating on.
        """        
        coordinates.operand_id = self.id
        """Assigns coordinate object extra information about the part it operates on. This works by calling a hidden variable in the Coordinates object which expects this function.
        """

    def hardware_scad(self): # Retuns scad code and imports the hardware code specified.
        """Returns scad code and imports the hardware code specified.

        Returns:
            _type_: _description_
        """        

        """ Viewport Special Variables : Engage By Uncommenting """

        scad_code = ""
        scad_code = scad_code + "/* Viewport Global Variables */\n\n"
        scad_code = scad_code + "$vpr = [-15, $t * 360, 0]; // Viewport rotation angles in degrees. \n"
        scad_code = scad_code + "//$vpt = [0, 0, 0];        // Viewport translation. \n"
        scad_code = scad_code + "$vpd = 5000;               // Viewport camera distance. \n"
        scad_code = scad_code + "$vpf = 10;                 // Viewport camera field of view. \n"

        """ Hardware Module Code """
        
        scad_code = scad_code + '\n/* A module dedicated to this hardware object. This module is only called once becasue it references the unique hardware element (In both real and virtual space) which only needs to be done once. */\n\n'
        scad_code = scad_code + 'module '+self.id+'()\n{\n' #
        if (len(self.coordinate_superset)==0):
            self.assign_coordinates(Coordinates())     
            
        if (len(self.coordinate_superset)==1): # Here you need to add more coordinate sets sepending on choice of epochs.
            
            if (self.coordinate_superset[0].t0 > 0): # Here you need to add more coordinate sets sepending on choice of epochs.
                
                t0 = self.coordinate_superset[0].t0 # Pulling coordinate data to write in .scad file.  
                
                x0 = self.coordinate_superset[0].x0 # Pulling coordinate data to write in .scad file.
                y0 = self.coordinate_superset[0].y0 # Pulling coordinate data to write in .scad file.
                z0 = self.coordinate_superset[0].z0 # Pulling coordinate data to write in .scad file.
                a0 = self.coordinate_superset[0].a0 # Pulling coordinate data to write in .scad file.
                b0 = self.coordinate_superset[0].b0 # Pulling coordinate data to write in .scad file.
                c0 = self.coordinate_superset[0].c0 # Pulling coordinate data to write in .scad file.

                e0 = self.coordinate_superset[0].e0 # Pulling coordinate data to write in .scad file.
                f0 = self.coordinate_superset[0].f0 # Pulling coordinate data to write in .scad file.
                g0 = self.coordinate_superset[0].g0 # Pulling coordinate data to write in .scad file.
                u0 = self.coordinate_superset[0].u0 # Pulling coordinate data to write in .scad file.
                v0 = self.coordinate_superset[0].v0 # Pulling coordinate data to write in .scad file.
                w0 = self.coordinate_superset[0].w0 # Pulling coordinate data to write in .scad file.
                
                self.assign_coordinates(Coordinates(t0 = 0, tf = t0, x0 = x0, y0 = y0, z0 = z0, xf = x0, yf = y0, zf = z0, a0 = a0, b0 = b0, c0 = c0, af = a0, bf = b0, cf = c0, e0 = e0, f0 = f0, g0 = g0, ef = e0, ff = f0, gf = g0, u0 = u0, v0 = v0, w0 = w0, uf = u0, vf = v0, wf = w0))
                
            if (self.coordinate_superset[0].tf < 1): # Here you need to add more coordinate sets sepending on choice of epochs.

                tf = self.coordinate_superset[0].tf # Pulling coordinate data to write in .scad file.  
                
                xf = self.coordinate_superset[0].xf # Pulling coordinate data to write in .scad file.
                yf = self.coordinate_superset[0].yf # Pulling coordinate data to write in .scad file.
                zf = self.coordinate_superset[0].zf # Pulling coordinate data to write in .scad file.
                af = self.coordinate_superset[0].af # Pulling coordinate data to write in .scad file.
                bf = self.coordinate_superset[0].bf # Pulling coordinate data to write in .scad file.
                cf = self.coordinate_superset[0].cf # Pulling coordinate data to write in .scad file.
            
                ef = self.coordinate_superset[0].ef # Pulling coordinate data to write in .scad file.
                ff = self.coordinate_superset[0].ff # Pulling coordinate data to write in .scad file.
                gf = self.coordinate_superset[0].gf # Pulling coordinate data to write in .scad file.
                uf = self.coordinate_superset[0].uf # Pulling coordinate data to write in .scad file.
                vf = self.coordinate_superset[0].vf # Pulling coordinate data to write in .scad file.
                wf = self.coordinate_superset[0].wf # Pulling coordinate data to write in .scad file.
                
                self.assign_coordinates(Coordinates(t0 = tf, tf = 1, x0 = xf, y0 = yf, z0 = zf, xf = xf, yf = yf, zf = zf, a0 = af, b0 = bf, c0 = cf, af = af, bf = bf, cf = cf, e0 = ef, f0 = ff, g0 = gf, ef = ef, ff = ff, gf = gf, u0 = uf, v0 = vf, w0 = wf, uf = uf, vf = vf, wf = wf))

        for coordinates in self.coordinate_superset: #

            scad_code = scad_code + "    /* Animation Sequence*/\n"
            scad_code = scad_code + \
                    '  if ($t >= '+str(coordinates.t0)+' && $t <= '+str(coordinates.tf)+')\n'\
                    '  {\n'      
            scad_code = scad_code + "    /* Initialize initial and final position and orientation. These values may be modified for assembly purposes. */\n\n" 
    
            scad_code = scad_code + "        /* Assembly Type Spatial (along x,y,z axes) Coordinates */\n"
            scad_code = scad_code + "        assembly_x_position_initial = "+str(coordinates.x0)+";    // Initial 'x' position ( in mm ).\n"
            scad_code = scad_code + "        assembly_x_position_final = "+str(coordinates.xf)+";      // Final 'x' position ( in mm ).\n"
            scad_code = scad_code + "        assembly_y_position_initial = "+str(coordinates.y0)+";    // Initial 'y' position ( in mm ).\n"
            scad_code = scad_code + "        assembly_y_position_final = "+str(coordinates.yf)+";      // Final 'y' position ( in mm ).\n"
            scad_code = scad_code + "        assembly_z_position_initial = "+str(coordinates.z0)+";    // Initial 'z' position ( in mm ).\n"
            scad_code = scad_code + "        assembly_z_position_final = "+str(coordinates.zf)+";      // Final 'z' position ( in mm ).\n\n"

            scad_code = scad_code + "        /* Assembly Type Angular (about x,y,z axes) Coordinates */\n"
            scad_code = scad_code + "        assembly_x_axis_angle_initial = "+str(coordinates.a0)+";  // Initial angle along the 'x' axis. ( in degrees ).\n"
            scad_code = scad_code + "        assembly_x_axis_angle_final = "+str(coordinates.af)+";    // Final angle along the 'x' axis. ( in degrees ).\n"
            scad_code = scad_code + "        assembly_y_axis_angle_initial = "+str(coordinates.b0)+";  // Initial angle along the 'y' axis. ( in degrees ).\n"
            scad_code = scad_code + "        assembly_y_axis_angle_final = "+str(coordinates.bf)+";    // Final angle along the the 'z' axis. ( in degrees ).\n"
            scad_code = scad_code + "        assembly_z_axis_angle_initial = "+str(coordinates.c0)+";  // Final angle along the the 'z' axis. ( in degrees ).\n"
            scad_code = scad_code + "        assembly_z_axis_angle_final = "+str(coordinates.cf)+";    // Final angle along the 'z' axis. ( in degrees ).\n\n"
            
            scad_code = scad_code + "        /* Operational Type Spatial (along x,y,z axes) Coordinates */\n"
            scad_code = scad_code + "        operational_x_position_initial = "+str(coordinates.e0)+";    // Initial 'x' position ( in mm ).\n"
            scad_code = scad_code + "        operational_x_position_final = "+str(coordinates.ef)+";      // Final 'x' position ( in mm ).\n"
            scad_code = scad_code + "        operational_y_position_initial = "+str(coordinates.f0)+";    // Initial 'y' position ( in mm ).\n"
            scad_code = scad_code + "        operational_y_position_final = "+str(coordinates.ff)+";      // Final 'y' position ( in mm ).\n"
            scad_code = scad_code + "        operational_z_position_initial = "+str(coordinates.g0)+";    // Initial 'z' position ( in mm ).\n"
            scad_code = scad_code + "        operational_z_position_final = "+str(coordinates.gf)+";      // Final 'z' position ( in mm ).\n\n"

            scad_code = scad_code + "        /* Operational Type Angular (about x,y,z axes) Coordinates */\n"
            scad_code = scad_code + "        operational_x_axis_angle_initial = "+str(coordinates.u0)+";  // Initial angle along the 'x' axis. ( in degrees ).\n"
            scad_code = scad_code + "        operational_x_axis_angle_final = "+str(coordinates.uf)+";    // Final angle along the 'x' axis. ( in degrees ).\n"
            scad_code = scad_code + "        operational_y_axis_angle_initial = "+str(coordinates.v0)+";  // Initial angle along the 'y' axis. ( in degrees ).\n"
            scad_code = scad_code + "        operational_y_axis_angle_final = "+str(coordinates.vf)+";    // Final angle along the the 'z' axis. ( in degrees ).\n"
            scad_code = scad_code + "        operational_z_axis_angle_initial = "+str(coordinates.w0)+";  // Final angle along the the 'z' axis. ( in degrees ).\n"
            scad_code = scad_code + "        operational_z_axis_angle_final = "+str(coordinates.wf)+";    // Final angle along the 'z' axis. ( in degrees ).\n\n"
            
            scad_code = scad_code + "        /* Assembly Type Spatial (along x,y,z axes) Coordinates Substitution */\n"
            scad_code = scad_code + "        x0 = assembly_x_position_initial;       // Substitution for a readability and a shorter equation.\n"
            scad_code = scad_code + "        xf = assembly_x_position_final;         // Substitution for a readability and a shorter equation.\n"
            scad_code = scad_code + "        y0 = assembly_y_position_initial;       // Substitution for a readability and a shorter equation.\n"
            scad_code = scad_code + "        yf = assembly_y_position_final;         // Substitution for a readability and a shorter equation.\n"
            scad_code = scad_code + "        z0 = assembly_z_position_initial;       // Substitution for a readability and a shorter equation.\n"
            scad_code = scad_code + "        zf = assembly_z_position_final;         // Substitution for a readability and a shorter equation.\n\n"

            scad_code = scad_code + "        /* Assembly Type Angular (about x,y,z axes) Coordinates Substitution */\n"
            scad_code = scad_code + "        a0 = assembly_x_axis_angle_initial;     // Substitution for a readability and a shorter equation.\n"
            scad_code = scad_code + "        af = assembly_x_axis_angle_final;       // Substitution for a readability and a shorter equation.\n"
            scad_code = scad_code + "        b0 = assembly_y_axis_angle_initial;     // Substitution for a readability and a shorter equation.\n"
            scad_code = scad_code + "        bf = assembly_y_axis_angle_final;       // Substitution for a readability and a shorter equation.\n"
            scad_code = scad_code + "        c0 = assembly_z_axis_angle_initial;     // Substitution for a readability and a shorter equation.\n"
            scad_code = scad_code + "        cf = assembly_z_axis_angle_final;       // Substitution for a readability and a shorter equation.\n\n"
            
            scad_code = scad_code + "        /* Operational Type Spatial (along x,y,z axes) Coordinates Substitution*/\n"
            scad_code = scad_code + "        e0 = operational_x_position_initial;    // Substitution for a readability and a shorter equation.\n"
            scad_code = scad_code + "        ef = operational_x_position_final;      // Substitution for a readability and a shorter equation.\n"
            scad_code = scad_code + "        f0 = operational_y_position_initial;    // Substitution for a readability and a shorter equation.\n"
            scad_code = scad_code + "        ff = operational_y_position_final;      // Substitution for a readability and a shorter equation.\n"
            scad_code = scad_code + "        g0 = operational_z_position_initial;    // Substitution for a readability and a shorter equation.\n"
            scad_code = scad_code + "        gf = operational_z_position_final;      // Substitution for a readability and a shorter equation.\n\n"

            scad_code = scad_code + "        /* Operational Type Angular (about x,y,z axes) Coordinates Substitution */\n"
            scad_code = scad_code + "        u0 = operational_x_axis_angle_initial;  // Substitution for a readability and a shorter equation.\n"
            scad_code = scad_code + "        uf = operational_x_axis_angle_final;    // Substitution for a readability and a shorter equation.\n"
            scad_code = scad_code + "        v0 = operational_y_axis_angle_initial;  // Substitution for a readability and a shorter equation.\n"
            scad_code = scad_code + "        vf = operational_y_axis_angle_final;    // Substitution for a readability and a shorter equation.\n"
            scad_code = scad_code + "        w0 = operational_z_axis_angle_initial;  // Substitution for a readability and a shorter equation.\n"
            scad_code = scad_code + "        wf = operational_z_axis_angle_final;    // Substitution for a readability and a shorter equation.\n\n"
            
            scad_code = scad_code + "        /* Primary Equation */\n"
        
            if self.stl_imported == False:
                scad_code = scad_code + '    translate([x0+($t-'+str(coordinates.t0)+')*(xf-x0)/('+str(coordinates.tf)+'-'+str(coordinates.t0)+') , y0+($t-'+str(coordinates.t0)+')*(yf-y0)/('+str(coordinates.tf)+'-'+str(coordinates.t0)+'), z0 + ($t-'+str(coordinates.t0)+')*(zf-z0)/('+str(coordinates.tf)+'-'+str(coordinates.t0)+') ] ) { rotate([a0+($t-'+str(coordinates.t0)+')*(af-a0)/('+str(coordinates.tf)+'-'+str(coordinates.t0)+'), b0+($t-'+str(coordinates.t0)+')*(bf-b0)/('+str(coordinates.tf)+'-'+str(coordinates.t0)+'), c0+($t-'+str(coordinates.t0)+')*(cf-c0)/('+str(coordinates.tf)+'-'+str(coordinates.t0)+')])'+' { translate([e0+($t-'+str(coordinates.t0)+')*(ef-e0)/('+str(coordinates.tf)+'-'+str(coordinates.t0)+') , f0+($t-'+str(coordinates.t0)+')*(ff-f0)/('+str(coordinates.tf)+'-'+str(coordinates.t0)+'), g0 + ($t-'+str(coordinates.t0)+')*(gf-g0)/('+str(coordinates.tf)+'-'+str(coordinates.t0)+') ] ) { rotate([u0+($t-'+str(coordinates.t0)+')*(uf-u0)/('+str(coordinates.tf)+'-'+str(coordinates.t0)+'), v0+($t-'+str(coordinates.t0)+')*(vf-v0)/('+str(coordinates.tf)+'-'+str(coordinates.t0)+'), w0+($t-'+str(coordinates.t0)+')*(wf-w0)/('+str(coordinates.tf)+'-'+str(coordinates.t0)+')])'+' { color("'+self.color+'") { import("stl_files/'+ self.hardware_code + '.stl"); } } } } }\n''  }\n'
            if self.stl_imported == True: 
                scad_code = scad_code + '    translate([x0+($t-'+str(coordinates.t0)+')*(xf-x0)/('+str(coordinates.tf)+'-'+str(coordinates.t0)+') , y0+($t-'+str(coordinates.t0)+')*(yf-y0)/('+str(coordinates.tf)+'-'+str(coordinates.t0)+'), z0 + ($t-'+str(coordinates.t0)+')*(zf-z0)/('+str(coordinates.tf)+'-'+str(coordinates.t0)+') ] ) { rotate([a0+($t-'+str(coordinates.t0)+')*(af-a0)/('+str(coordinates.tf)+'-'+str(coordinates.t0)+'), b0+($t-'+str(coordinates.t0)+')*(bf-b0)/('+str(coordinates.tf)+'-'+str(coordinates.t0)+'), c0+($t-'+str(coordinates.t0)+')*(cf-c0)/('+str(coordinates.tf)+'-'+str(coordinates.t0)+')])'+' { translate([e0+($t-'+str(coordinates.t0)+')*(ef-e0)/('+str(coordinates.tf)+'-'+str(coordinates.t0)+') , f0+($t-'+str(coordinates.t0)+')*(ff-f0)/('+str(coordinates.tf)+'-'+str(coordinates.t0)+'), g0 + ($t-'+str(coordinates.t0)+')*(gf-g0)/('+str(coordinates.tf)+'-'+str(coordinates.t0)+') ] ) { rotate([u0+($t-'+str(coordinates.t0)+')*(uf-u0)/('+str(coordinates.tf)+'-'+str(coordinates.t0)+'), v0+($t-'+str(coordinates.t0)+')*(vf-v0)/('+str(coordinates.tf)+'-'+str(coordinates.t0)+'), w0+($t-'+str(coordinates.t0)+')*(wf-w0)/('+str(coordinates.tf)+'-'+str(coordinates.t0)+')])'+' { color("'+self.color+'") { import("stl_files/'+ self.imported_stl + '"); } } } } }\n''  }\n'
                    
        """ This bit here is so the assembly time quantums dont delete the object from ever coming into view."""            
                
        scad_code = scad_code + '}\n' # Finishes themodule closing bracket.
        scad_code = scad_code + '/* Run */\n' # scad code.
        scad_code = scad_code + self.id+'();' # Writes the scad code used to call the function.

        return scad_code # Returns scad code.
    
    def write_scad(self, directory):
        """Writes .scad code for this hardware object.

        Args:
            directory (_type_): This makes reference to the workspace directory object.
        """
        
        if not os.path.exists(directory): # Checks if main workspace directory exists.
            os.mkdir(directory) # Creates the workspace directory.

        if not os.path.exists(directory+"/stl_files/"): # Checks if the stl_file folder exists.
            os.mkdir(directory+"/stl_files/") # Creates the stl_files directory.

        scad_file = open(directory+"/"+self.scad_file_name, "w") # Creates new .scad file.
        scad_file.write("\n/* Parametric System Instructions : Generated hardware .scad file. */\n\n")
        scad_file.write(self.hardware_scad()) # Writes scad code to file.
        scad_file.close() # Close file.
    
    def build_stl(self, directory):
        """_summary_

        Args:
            directory (_type_): This makes reference to the workspace directory object.
        """
        
        mu_symbol = '\u00B5'
        #TODO: Make a downloading statement for downloaded or imported.
        print("Decoding : "+self.hardware_code)
        decoding = Decode(self.hardware_code, directory) # This is where the hardware code is converted into an scad code which can be rendered to an stl.
        if not exists(directory+"/stl_files/"+self.hardware_code+".stl") and decoding.family_code_valid == True: #
            print("Rendering : "+self.hardware_code)
            print(""+mu_symbol+":! openscad -o "+directory+"/stl_files/"+self.hardware_code+".stl "+directory+"/"+self.hardware_code+".scad") # This is the scad file used to create the stl files
            os.system("openscad -o "+directory+"/stl_files/"+self.hardware_code+".stl "+directory+"/"+self.hardware_code+".scad") # This is the scad file used to create the stl files
                    
        if self.stl_imported == True:
            

            if len(self.hardware_code.split("http")) > 0:
                stl_file = self.hardware_code
                urllib.request.urlretrieve(stl_file, directory+"/stl_files/"+self.imported_stl)
            else:
                shutil.copy2(self.imported_stl, directory+"/stl_files/")            

            
    def mucli_build_stl(self, directory):
        """Renders STL file and handles duplicate renderings.

        Args:
            directory (_type_): This makes reference to the workspace directory object.
        """        
        mu_symbol = '\u00B5' # Unicode for greek mu symbol.
        decoding = Decode(self.hardware_code, directory) # This is where the hardware code is converted into an scad code which can be rendered to an stl.
        if not exists(directory+"/stl_files/"+self.hardware_code+".stl") and decoding.family_code_valid == True: # If hardware code does not exist in the rendered STL folder and the family code is valid.
        
            print("")
            print(""+mu_symbol+":! Rendering : "+self.hardware_code)
            print(""+mu_symbol+":! openscad -o "+directory+"/stl_files/"+self.hardware_code+".stl "+directory+"/"+self.hardware_code+".scad") # This is the scad file used to create the stl files.
            os.system("openscad -o "+directory+"/stl_files/"+self.hardware_code+".stl "+directory+"/"+self.hardware_code+".scad") # This is the rendering command for linux.
            print("")
            
        if decoding.family_code_valid == False:
            print("\n"+mu_symbol+":! Error : The entered system code contained an unrecognized family code\n")
    
    def remove_jig(self, directory): # Called with each run command per part.
        """Removes files which have served thier purpose and are no longer needed.

        Args:
            directory (_type_): This makes reference to the workspace directory object.
        """        
        if exists(directory+self.hardware_code+".scad"):# Checks for the existence of an .scad file in the workspace with name equal to that of the hardware code.
            try: # Attempt to delete scad file jig.
                os.remove(directory+self.hardware_code+".scad") # Remove scad file with a name equal to that of the hardware code. This file is part of the jig.
            except OSError: # If there is an error with attempting to delete the scad needed to render the STL.
                print(Exception) # Prints exception.
        if exists(directory+"scad"): # Checks if scad directory is present in the workspace directory.
            shutil.rmtree(directory+"scad") # Remove scad directory. TODO : Check this the path may of changed since the reorg.

    def build_hardware(self, directory):
        """Clean function which builds and manages stl files.

        Args:
            directory (_type_): This makes reference to the workspace directory object.
        """        
        self.write_scad(directory) # Write scad files nessecarry to build stl. These files are temporary and the name of these files are equivilent to the hardware code currently.
        self.build_stl(directory) # Builds stl from hardware code.
        self.remove_jig(directory) # Removes unnessecary files which were used to buld the stl.
        
    def mucli_build_hardware(self, directory):
        """Clean function which builds and manages stl files.

        Args:
            directory (_type_): This makes reference to the workspace directory object.
        """        
        self.write_scad(directory) # Write scad files nessecarry to build stl. These files are temporary and the name of these files are equivilent to the hardware code currently.
        self.mucli_build_stl(directory) # Builds stl from hardware code.
        self.remove_jig(directory) # Removes unnessecary files which were used to buld the stl.
 