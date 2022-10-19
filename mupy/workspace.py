#!/usr/bin/env python3

from distutils.command.build_scripts import first_line_re
from unicodedata import name
from .decode import Decode
import os

class WorkSpace:
    """Gives context to parts and assemblys. Provides functionallity by calling sub-functions of assembly and part objects making code much shorter and much more advanced. 
    Provides information such as path information or other metadata. Also serves as a virtual workbench which encapsulates parts and assemblys.
    It is best if workspace is oriented to a certain class of assemblys of projects or just a single assemly or project. It is not nessecary to make a new workspace for 
    every new gearbox unless they are using different parts completely in which case it may only be advisable but certainly not restricted.
    """    

    def __init__(self, directory):
        """When a workspace object is created.

        Args:
            directory (_type_): _description_
        """        
        self.workspace_directory = directory
        self.hardware = [] # A list of hardware objects contained in this workspace.
        self.assemblies = [] # A list of assembly objects contained in this workspace.
        self.names = []
        self.processed_assemblies = [] # A list of processed assemblies used for recursive import.
        self.errors = [] # Error aggregation object. # TODO : Make a class for this that is more thoughtful.
        self.assembly_epoch_count = 0

    def recursive_import(self, system, system_coordinates):
        """This is a strange function ; it recursivly takes in objects from the main assembly and gives them a home them in the workspace. 
        This function was made to so that users would not need to include every individual part or assemblyinto the workspace.

        Args:
            system (_type_): _description_
            system_coordinates (_type_): _description_
        """        
        first_processed_assemblies_call = True # This is nessary to get things started.  
        while (len(self.processed_assemblies) > 0 or first_processed_assemblies_call == True):

            if (first_processed_assemblies_call==False): # If the first_processed_assemblies_call has been set to false. This is the more likely case but it only happens after the first assembly is identified.
                system = self.processed_assemblies[0] # Set it to the first in the queue.
            else:
                system.assign_coordinates(system_coordinates) # This only happens once which is why this coordinate operation is allowed.

            if (type(system).__name__ == "Hardware"): # If it is a part object.
                print("Workspace : "+self.workspace_directory+" : Discovering hardware object: "+system.id) # Prints status to terminal.
                system.workspace_directory = self.workspace_directory # Assigns workspace directory path to the workspace_directory class variables associated with hardware and assembly component objects.
                self.hardware.append(system) # Append hardware to workspace.
                self.names.append(system.name)
                if (first_processed_assemblies_call==False): # If the first_processed_assemblies_call has been set to false. This is the more likely case but it only happens after the first assembly is identified.
                    self.processed_assemblies.remove(system) # Remove system from processed assemblies list. Remember this was added originally as a component of a larger system.

            elif (type(system).__name__ == "Assembly"): # If it is an assembly object.
                print("Discovering assembly object : "+ system.id) # Prints status to terminal.
                system.workspace_directory = self.workspace_directory # Assigns workspace directory path to the workspace_directory class variables associated with hardware and assembly component objects.
                self.assemblies.append(system) # Append assembly to workspace.
                self.names.append(system.name)
                if (first_processed_assemblies_call==False): # If the first_processed_assemblies_call has been set to false. This is the more likely case but it only happens after the first assembly is identified.
                    self.processed_assemblies.remove(system) # Remove system from processed assemblies list. Remember this was added originally as a component of a larger system.
                
                first_processed_assemblies_call = False # Sets first_processed_assemblies_call flag to False.
                for component in system.components:# Iterates through sub-components of system.
                    self.processed_assemblies.append(component) # Include assembly into the catagories of assemblues which are being processed.
            else: # If there is some other object.
                pass # Just pass.
        

    def detect_duplicates(self, list):    
        """Check if given list contains any duplicates.

        Args:
            list (_type_): _description_

        Returns:
            _type_: _description_
        """        

        if len(list) == len(set(list)): # If the length of the set is equal to the length of the list.
            return False # There are no duplicate records because the length of the list and set are equal.
        else: # If there is a duplicate.
            self.errors.append("Duplicate hardware or assembly component detected and cannot process assembly script. Remove following duplicate components in order to run properly.") # Append error.
            duplicates = list
            for i in set(list):
                duplicates.remove(i)
                
            print(duplicates)
            return True # Duplicate record exists.

    def generate(self):
        """Debug function for getting access to system level errors.
        """        
        if not (self.detect_duplicates(self.hardware) or self.detect_duplicates(self.assemblies) or self.detect_duplicates(self.names)): # If there are no part duplicates.
            for hardware in self.hardware: # For each part.
                hardware.build_hardware(self.workspace_directory) # Write scad file for this hardwere.
            for assembly in self.assemblies: # For each assembly.
                assembly.assemble(self.workspace_directory) # Write scad file for this assembly.
        else:
            print("Duplicate hardware and/or assemblies detected. Make sure names is globally unique.")

    def print_errors(self):
        """Debug function for getting access to system level erros.
        """        
        print(self.errors) # Print erros associated with workspace.
        for hardware in self.hardware: # For each part.
            print(hardware.errors) # Print error.
        for assembly in self.assemblies:  # For each assembly.
            print(assembly.errors) # Print errors contained. (Debug only)

    def run(self, system, coordinates):
        """Main function for workspace to get everthing written and initialized.

        Args:
            system (_type_): _description_
            coordinates (_type_): _description_
        """        
        print(system.system_code)
        # TODO: This is where we will need to "call the decode function? (man I had the way I built this interface.)"
        if system.system_code != None:
            # This is where we will need to "call the decode function? (man I had the way I built this interface.)"
            # At this point the workspace does not know anything about the assembly. Only the sysytem code. This is why we need to decode it here before the assemble function is called.
            system_code_decoding = Decode(system.system_code, self.workspace_directory)
            system_code_assembly = system_code_decoding.assembly
            self.recursive_import(system_code_assembly, coordinates) # Recursive inclusion of parts and assemblies into workspace.
            
        else: # In the case that no system code was provided.
            self.recursive_import(system, coordinates) # Recursive inclusion of parts and assemblies into workspace. 
            
        if not os.path.exists(self.workspace_directory): # Checks if main workspace directory exists.
            os.mkdir(self.workspace_directory) # Creates the workspace directory.
        for file in os.listdir(self.workspace_directory):
            if os.path.isfile(os.path.join(self.workspace_directory,file)) == True:
                os.remove(os.path.join(self.workspace_directory, file)) 
                
                   
        self.generate() # Recursive writing of scad object contained in assembly.
