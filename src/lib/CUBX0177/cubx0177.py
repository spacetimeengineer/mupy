#!/usr/bin/env python3
import os, sys
import shutil


class CUBX0177:
    """ This class builds digital representations of CUBX0177 hardware elements. These representations contain varius objects which help simulate the part."""

    def __init__(self, hardware_code, directory): # Runs when object is initialized.

        self.id = id # This is a unique name or tag referencing a particular object in a set.
        self.hardware_code = hardware_code
        self.type_code = self.hardware_code.split("-")[1]
        self.directory = directory

        self.scad_file_name = directory + hardware_code +".scad" # This scad file is used to build the stl. It can be deleted afterwards. # TODO : Delete this file after run() command is called.
        self.scad_file = open(self.scad_file_name, 'w+')  # open file in append mode
        
        os.system("pwd")
        os.system("cp -R src/lib/CUBX0177/scad/ "+ self.directory) # Copies resouces into the workspace directory. These will be deletd later.
 
        self.scad_file.write('use <scad/CUBX0177.scad>;\n\n')
        
        
        


        if (self.type_code=="BPAN"): # Box panel.
            
            # Example BPAN hardware code : "CUBX0177-BPAN-B25SR2P5-X9Y9P18-RT-SX25Y25-X8Y8-X20Y2010Z5"

            self.block_unit_length = self.hardware_code.split("-")[2].split("B")[1].split("SR")[0] # Block length.
            self.shaft_radius = self.hardware_code.split("-")[2].split("B")[1].split("SR")[1].replace("P", ".", 1) # Shaft radius.
            self.x_units =  self.hardware_code.split("-")[3].split("X")[1].split("Y")[0]
            self.y_units =  self.hardware_code.split("-")[3].split("Y")[1].split("P")[0]
            self.padding =  "0."+self.hardware_code.split("-")[3].split("P")[1]


            if (self.hardware_code.split("-")[4].count("R") == 1):
                self.orientation = '"regular"' # Regular orientation.
            elif (self.hardware_code.split("-")[4].count("I") == 1):
                self.orientation = '"inverted"' # Inverted orientation.
            elif (self.hardware_code.split("-")[4].count("C") == 1):
                self.orientation = '"chimera"' # Chimera orientation.
            elif (self.hardware_code.split("-")[4].count("X") == 1):
                self.orientation = '"inverted_chimera"' # Inverted chimera.
            else:
                self.errors.append("Incorrect orientation code.")
                pass

            if (self.hardware_code.split("-")[4].count("T") == 1):
                self.teeth = "true"
            elif (self.hardware_code.split("-")[4].count("F") == 1):
                self.teeth = "false"
            else:
                self.errors.append("Incorrect teeth code.")
                pass

            self.cavity_shape_code =  self.hardware_code.split("-")[5].split("X")[0] # Values can take the following but are not limited to the following values : 'S' for square, 'R' for rectangle, 'C' for circle, 'P' for pentagon, 'O' for octagon.
            self.x_cavity_spacing =  self.hardware_code.split("-")[5].split("X")[1].split("Y")[0]
            self.y_cavity_spacing =  self.hardware_code.split("-")[5].split("X")[1].split("Y")[1]
            self.x_cavity_units =  self.hardware_code.split("-")[6].split("X")[1].split("Y")[0]
            self.y_cavity_units =  self.hardware_code.split("-")[6].split("X")[1].split("Y")[1]
            self.x_cavity_dimensions =  self.hardware_code.split("-")[7].split("X")[1].split("Y")[0]
            self.y_cavity_dimensions =  self.hardware_code.split("-")[7].split("X")[1].split("Y")[1].split("Z")[0]
            self.z_cavity_dimensions =  self.hardware_code.split("-")[7].split("X")[1].split("Y")[1].split("Z")[1]


            ''' Testing that code is parsed correctly.'''
            
            '''
            print(self.type_code)
            print(self.block_unit_length)
            print(self.shaft_radius)
            print(self.x_units)
            print(self.y_units)
            print(self.padding)
            print(self.orientation)
            print(self.teeth)
            print(self.cavity_shape_code)
            print(self.x_cavity_spacing)
            print(self.y_cavity_spacing)
            print(self.x_cavity_units)
            print(self.y_cavity_units)
            print(self.x_cavity_dimensions)
            print(self.y_cavity_dimensions)
            print(self.z_cavity_dimensions)
            '''


            ''' Rules logic goes here ; conditions of which parameters combinations can exist.   '''

            ''' Execute write scad functions.   '''

            self.CUBX0177_BPAN()
            self.scad_file.close()

        elif (self.type_code=="SPAN"): # Simple panel.

            # Example SPAN hardware code : "CUBX0177-SPAN-B25SR2P5-X9Y9P18-RT-SX25Y25-X8Y8-X20Y2010Z5"

            self.block_unit_length = self.hardware_code.split("-")[2].split("B")[1].split("SR")[0] # Block length.
            self.shaft_radius = self.hardware_code.split("-")[2].split("B")[1].split("SR")[1].replace("P", ".", 1) # Shaft radius.
            self.x_units =  self.hardware_code.split("-")[3].split("X")[1].split("Y")[0] # x block units.
            self.y_units =  self.hardware_code.split("-")[3].split("Y")[1].split("P")[0] # y block units.

            ''' Testing that code is parsed correctly.'''
            
            '''
            print(self.type_code)
            print(self.block_unit_length)
            print(self.shaft_radius)
            print(self.x_units)
            print(self.y_units)
            '''



            ''' Rules logic goes here ; conditions of which parameters combinations can exist.   '''

            ''' Execute write scad functions.   '''

            self.CUBX0177_SPAN()
            self.scad_file.close()

        elif (self.type_code=="AXLE"): # Square axle.

            # Example SPAN hardware code : "CUBX0177-AXLE-B25SR2P5-22"
            self.block_unit_length = self.hardware_code.split("-")[2].split("B")[1].split("SR")[0] # Block length.
            self.shaft_radius = self.hardware_code.split("-")[2].split("B")[1].split("SR")[1].replace("P", ".", 1) # Shaft radius.

            ''' Rules logic goes here ; conditions of which parameters combinations can exist.   '''

            ''' Execute write scad functions.   '''

            self.CUBX0177_AXLE()
            self.scad_file.close()
        elif (self.type_code=="FYAD"): # Flywheel adapter.

            # Example SPAN hardware code : "CUBX0177-FYAD-B25SR2P5".
            self.block_unit_length = self.hardware_code.split("-")[2].split("B")[1].split("SR")[0] # Block length.
            self.shaft_radius = self.hardware_code.split("-")[2].split("B")[1].split("SR")[1].replace("P", ".", 1) # Shaft radius.

            ''' Rules logic goes here ; conditions of which parameters combinations can exist.   '''

            ''' Execute write scad functions.   '''

            self.CUBX0177_FYAD()
            self.scad_file.close()
        elif (self.type_code=="AXAD"): # Axle adapter.

            # Example SPAN hardware code : "CUBX0177-FYAD-B25SR2P5"
            self.block_unit_length = self.hardware_code.split("-")[2].split("B")[1].split("SR")[0] # Block length.
            self.shaft_radius = self.hardware_code.split("-")[2].split("B")[1].split("SR")[1].replace("P", ".", 1) # Shaft radius.

            ''' Rules logic goes here ; conditions of which parameters combinations can exist.   '''

            ''' Execute write scad functions.   '''

            self.CUBX0177_AXAD()
            self.scad_file.close()

        else:

            self.errors.append("Invalid type code.")


    def CUBX0177_BPAN(self):
        
        self.scad_file.write('CUBX0177_BPAN( '+self.block_unit_length+', '+self.shaft_radius+', '+self.x_units+', '+self.y_units+', '+self.padding+', '+self.orientation+', '+self.teeth+' );\n')


    def CUBX0177_SPAN(self):

        self.scad_file.write('CUBX0177_SPAN( '+self.block_unit_length+', '+self.block_unit_length+', '+self.x_units+', '+self.y_units+' )\n')


    def CUBX0177_FYAD(self):

        self.block_unit_length = 0
        self.shaft_radius = 0

        self.scad_file.write('CUBX0177_FYAD( '+self.block_unit_length+', '+self.shaft_radius+' )\n')


    def CUBX0177_AXAD(self):
        self.block_unit_length = 0
        self.shaft_radius = 0
        self.scad_file.write('CUBX0177_AXAD( '+self.block_unit_length+', '+self.shaft_radius+', '+self.padding+' )\n')
    

    def CUBX0177_AXLE(self):
        self.block_unit_length = 0
        self.shaft_radius = 0
        self.length_units = 0
        self.scad_file.write('CUBX0177_AXLE( '+self.block_unit_length+', '+self.shaft_radius+', '+self.length_units+' )\n')
