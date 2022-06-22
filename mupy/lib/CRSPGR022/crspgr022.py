#!/usr/bin/env python3

import os
from mupy.mucli.selection_branch import SelectionBranch

class CRSPGR022:
    """ This class builds digital representations of CRSPGR022 hardware elements. These representations contain varius objects which help simulate the part."""

    def __init__(self, hardware_code, directory): # Runs when object is initialized.

        self.id = id # This is a unique name or tag referencing a particular object in a set.
        self.hardware_code = hardware_code
        self.family_code = hardware_code.split("-")[0]
        self.type_code = hardware_code.split("-")[1]
        self.errors = []
        self.directory = directory

        self.scad_file_name = directory + "/" + hardware_code +".scad"
        self.scad_file = open(self.scad_file_name, 'w+')  # open file in append mode
        
        os.system("cp -R "+os.path.dirname(__file__)+"/scad/ "+ self.directory)
        self.scad_file.write('use <scad/CRSPGR022.scad>;\n\n')


        # "CRSPGR022-R-M1-L100H5W25-P15H0"
        if (self.type_code=="R"):
            
            self.modul = hardware_code.split("-")[2].split("M")[1]
            self.length = hardware_code.split("-")[3].split("L")[1].split("H")[0]
            self.height = hardware_code.split("-")[3].split("H")[1].split("W")[0]
            self.width = hardware_code.split("-")[3].split("W")[1]
            self.pressure_angle = hardware_code.split("-")[4].split("P")[1].split("H")[0]
            self.helix_angle = hardware_code.split("-")[4].split("H")[1]
            self.CRSPGR022_R()
            self.scad_file.close()
            
        # "CRSPGR022-MR-M1-L34H34W23-P15H20-P4-PH-F2"
        elif (self.type_code=="MR"): 

            self.modul = hardware_code.split("-")[2].split("M")[1]
            self.length = hardware_code.split("-")[3].split("L")[1].split("H")[0]
            self.height = hardware_code.split("-")[3].split("H")[1].split("W")[0]
            self.width = hardware_code.split("-")[3].split("W")[1]
            self.pressure_angle = hardware_code.split("-")[4].split("P")[1].split("H")[0]
            self.helix_angle = hardware_code.split("-")[4].split("H")[1]
            self.profile = hardware_code.split("-")[5].split("P")[1]
            self.head = hardware_code.split("-")[6]
            self.fasteners = hardware_code.split("-")[7].split("F")[1]
            self.CRSPGR022_MR()
            self.scad_file.close()

        # "CRSPGR022-HR-M1-L100H5W25-P15H0"
        elif (self.type_code=="HR"): 

            self.modul = hardware_code.split("-")[2].split("M")[1]
            self.length = hardware_code.split("-")[3].split("L")[1].split("H")[0]
            self.height = hardware_code.split("-")[3].split("H")[1].split("W")[0]
            self.width = hardware_code.split("-")[3].split("W")[1]
            self.pressure_angle = hardware_code.split("-")[4].split("P")[1].split("H")[0]
            self.helix_angle = hardware_code.split("-")[4].split("H")[1]
            self.CRSPGR022_HR()
            self.scad_file.close()

        # "CRSPGR022-MHR-M1-L34H34W23-P15H20-P4-PH-F2"
        elif (self.type_code=="MHR"):

            self.modul = hardware_code.split("-")[2].split("M")[1]
            self.length = hardware_code.split("-")[3].split("L")[1].split("H")[0]
            self.height = hardware_code.split("-")[3].split("H")[1].split("W")[0]
            self.width = hardware_code.split("-")[3].split("W")[1]
            self.pressure_angle = hardware_code.split("-")[4].split("P")[1].split("H")[0]
            self.helix_angle = hardware_code.split("-")[4].split("H")[1]
            self.profile = ""
            self.head = ""
            self.fasteners = ""
            self.CRSPGR022_MHR()
            self.scad_file.close()

        # "CRSPGR022-SG-M1-T34W23-P15H20-B4-T"
        elif (self.type_code=="SG"): 

            self.modul = hardware_code.split("-")[2].split("M")[1]
            self.tooth_number = hardware_code.split("-")[3].split("T")[1].split("W")[0]
            self.width = hardware_code.split("-")[3].split("T")[1].split("W")[1]
            self.pressure_angle = hardware_code.split("-")[4].split("P")[1].split("H")[0]
            self.helix_angle = hardware_code.split("-")[4].split("P")[1].split("H")[1]
            self.bore = hardware_code.split("-")[5].split("B")[1]
            self.optimized = hardware_code.split("-")[6]
            
            if self.optimized == "T":
                self.optimized = 'true'
            else:
                self.optimized = "false"

            self.CRSPGR022_SG()
            self.scad_file.close()

        # "CRSPGR022-HG-M1-T34W23-P15H20-B4-T"
        elif (self.type_code=="HG"): 

            self.modul = hardware_code.split("-")[2].split("M")[1]
            self.tooth_number = hardware_code.split("-")[3].split("T")[1].split("W")[0]
            self.width = hardware_code.split("-")[3].split("T")[1].split("W")[1]
            self.pressure_angle = hardware_code.split("-")[4].split("P")[1].split("H")[0]
            self.helix_angle = hardware_code.split("-")[4].split("P")[1].split("H")[1]
            self.bore = hardware_code.split("-")[5].split("B")[1]
            self.optimized = hardware_code.split("-")[6]

            self.CRSPGR022_HG()
            self.scad_file.close()

        # "CRSPGR022-RG-M1-T34W23R23-P15H20"
        elif (self.type_code=="RG"):

            self.modul = hardware_code.split("-")[2].split("M")[1]
            self.tooth_number = hardware_code.split("-")[3].split("T")[1].split("W")[0]
            self.width = hardware_code.split("-")[3].split("T")[1].split("W")[1].split("R")[0]
            self.rim_width = hardware_code.split("-")[3].split("T")[1].split("W")[1].split("R")[1]
            self.pressure_angle = hardware_code.split("-")[4].split("P")[1].split("H")[0]
            self.helix_angle = hardware_code.split("-")[4].split("P")[1].split("H")[1]

            self.CRSPGR022_RG()
            self.scad_file.close()

        # "CRSPGR022-HRG-M1-T34W23R23-P15H20"
        elif (self.type_code=="HRG"): 

            self.modul = hardware_code.split("-")[2].split("M")[1]
            self.tooth_number = hardware_code.split("-")[3].split("T")[1].split("W")[0]
            self.width = hardware_code.split("-")[3].split("T")[1].split("W")[1].split("R")[0]
            self.rim_width = hardware_code.split("-")[3].split("T")[1].split("W")[1].split("R")[1]
            self.pressure_angle = hardware_code.split("-")[4].split("P")[1].split("H")[0]
            self.helix_angle = hardware_code.split("-")[4].split("P")[1].split("H")[1]

            self.CRSPGR022_HRG()
            self.scad_file.close()

        # "CRSPGR022-PG-M1-S34P34N3W23R23-P15H20-B2-T-T"
        elif (self.type_code=="PG"): 

            self.modul = hardware_code.split("-")[2].split("M")[1]
            self.sun_teeth = ""
            self.planet_teeth = ""
            self.number_planets = ""

            self.width = ""
            self.rim_width = ""

            self.pressure_angle = ""
            self.helix_angle = ""

            self.together_built = ""
            self.optimized = ""
            self.bore = hardware_code.split("-")[5].split("B")[1]

            self.CRSPGR022_PG()
            self.scad_file.close()

        # "CRSPGR022-BG-M1-T34W23S10-P15H20C15-B3"
        elif (self.type_code=="BG"):

            self.modul = hardware_code.split("-")[2].split("M")[1]
            self.tooth_number = hardware_code.split("-")[3].split("T")[1].split("W")[0]
            self.width = hardware_code.split("-")[3].split("T")[1].split("W")[1].split("S")[0]
            self.tooth_width = hardware_code.split("-")[3].split("T")[1].split("W")[1].split("S")[1]
            self.pressure_angle = hardware_code.split("-")[4].split("P")[1].split("H")[0]
            self.helix_angle = hardware_code.split("-")[4].split("H")[1].split("C")[0]
            self.partial_cone_angle = hardware_code.split("-")[4].split("C")[1]
            self.bore = hardware_code.split("-")[5].split("B")[1]

            self.CRSPGR022_BG()
            self.scad_file.close()

        # "CRSPGR022-BHG-M1-T34W23-P15H20C15-B3"
        elif (self.type_code=="BHG"):

            self.modul = hardware_code.split("-")[2].split("M")[1]
            self.tooth_number = hardware_code.split("-")[3].split("T")[1].split("W")[0]
            self.width = hardware_code.split("-")[3].split("T")[1].split("W")[1]
            self.pressure_angle = hardware_code.split("-")[4].split("P")[1].split("H")[0]
            self.helix_angle = hardware_code.split("-")[4].split("P")[1].split("H")[1].split("C")[0]
            self.partial_cone_angle = hardware_code.split("-")[4].split("P")[1].split("H")[1].split("C")[0]
            self.bore = hardware_code.split("-")[5].split("B")[1]


            self.CRSPGR022_BHG()
            self.scad_file.close()

        # "CRSPGR022-W-M1-TH34L23-P15L20-B3"
        elif (self.type_code=="W"):

            self.modul = hardware_code.split("-")[2].split("M")[1]
            self.thread_starts = hardware_code.split("-")[3].split("TH")[1].split("L")[0]
            self.length = hardware_code.split("-")[3].split("TH")[1].split("L")[1]
            
            self.pressure_angle = hardware_code.split("-")[4].split("P")[1].split("L")[0]
            self.lead_ground = hardware_code.split("-")[4].split("P")[1].split("L")[1]

            self.bore = hardware_code.split("-")[5].split("B")[1]
            self.CRSPGR022_W()
            self.scad_file.close()


        else:

            pass



    def CRSPGR022_R(self):

        self.scad_file.write('rack(modul='+str(self.modul)+', length='+str(self.length)+', height='+str(self.height)+', width='+str(self.width)+', pressure_angle='+str(self.pressure_angle)+', helix_angle='+str(self.helix_angle)+');')

    def CRSPGR022_MR(self):

        self.scad_file.write('mountable_rack(modul='+str(self.modul)+', length='+str(self.length)+', height='+str(self.height)+', width='+str(self.width)+', pressure_angle='+str(self.pressure_angle)+', helix_angle='+str(self.helix_angle)+', profile='+str(self.profile)+', head='+str(self.head)+',fasteners='+str(self.fasteners)+');')
    
    def CRSPGR022_HR(self):

        self.scad_file.write('herringbone_rack(modul='+str(self.modul)+', length='+str(self.length)+', height='+str(self.height)+', width='+str(self.width)+', pressure_angle='+str(self.pressure_angle)+', helix_angle='+str(self.helix_angle)+');')

    def CRSPGR022_MHR(self):

        self.scad_file.write('mountable_herringbone_rack(modul='+str(self.modul)+', length='+str(self.length)+', height='+str(self.height)+', width='+str(self.width)+', pressure_angle='+str(self.pressure_angle)+', helix_angle='+str(self.helix_angle)+', profile='+str(self.profile)+', head='+str(self.head)+',fasteners='+str(self.fasteners)+');')

    def CRSPGR022_SG(self):

        self.scad_file.write('spur_gear(modul='+str(self.modul)+', tooth_number='+str(self.tooth_number)+', width='+str(self.width)+', bore='+str(self.bore)+', pressure_angle='+str(self.pressure_angle)+', helix_angle='+str(self.helix_angle)+', optimized='+str(self.optimized)+');')

    def CRSPGR022_HG(self):

        self.scad_file.write('herringbone_gear(modul='+str(self.modul)+', tooth_number='+str(self.tooth_number)+', width='+str(self.width)+', bore='+str(self.bore)+', pressure_angle='+str(self.pressure_angle)+', helix_angle='+str(self.helix_angle)+', optimized='+str(self.optimized)+');')

    def CRSPGR022_RG(self):

        self.scad_file.write('ring_gear(modul='+str(self.modul)+', tooth_number='+str(self.tooth_number)+', width='+str(self.width)+', rim_width='+str(self.rim_width)+', pressure_angle='+str(self.pressure_angle)+', helix_angle='+str(self.helix_angle)+');')

    def CRSPGR022_HRG(self):

        self.scad_file.write('herringbone_ring_gear(modul='+str(self.modul)+', tooth_number='+str(self.tooth_number)+', width='+str(self.width)+', rim_width='+str(self.rim_width)+', pressure_angle='+str(self.pressure_angle)+', helix_angle='+str(self.helix_angle)+');')

    def CRSPGR022_PG(self):

        self.scad_file.write('planetary_gear(modul='+str(self.modul)+', sun_teeth='+str(self.sun_teeth)+', planet_teeth='+str(self.planet_teeth)+', number_planets='+str(self.number_planets)+', width='+str(self.width)+', rim_width='+str(self.rim_width)+', bore='+str(self.bore)+', pressure_angle='+str(self.pressure_angle)+', helix_angle='+str(self.helix_angle)+', together_built='+'true'+', optimized='+str(self.optimized)+');')

    def CRSPGR022_BG(self):

        self.scad_file.write('bevel_gear(modul='+str(self.modul)+', tooth_number='+str(self.tooth_number)+',  partial_cone_angle='+str(self.partial_cone_angle)+', tooth_width='+str(self.tooth_width)+', bore='+str(self.bore)+', pressure_angle='+str(self.pressure_angle)+', helix_angle='+str(self.helix_angle)+');')

    def CRSPGR022_BHG(self):

        self.scad_file.write('bevel_herringbone_gear(modul='+str(self.modul)+', tooth_number='+str(self.tooth_number)+', partial_cone_angle='+str(self.partial_cone_angle)+', tooth_width='+str(self.tooth_width)+', bore='+str(self.bore)+', pressure_angle='+str(self.pressure_angle)+', helix_angle='+str(self.helix_angle)+');')

    def CRSPGR022_W(self):

        self.scad_file.write('worm(modul='+str(self.modul)+', thread_starts='+str(self.thread_starts)+', length='+str(self.length)+', bore='+str(self.bore)+', pressure_angle='+str(self.pressure_angle)+', lead_angle='+str(self.lead_ground)+');')





class CRSPGR022_encoding:
    def __init__(self):
        self.encoding = ""
    
    def encode_session(self):
        #length = InputBranch("Enter block length in millimeters (mm)")
        #width = InputBranch("Enter width length in millimeters (mm)")
        #height = InputBranch("Enter height length in millimeters (mm)")
        #length.run()
        #width.run()
        #height.run()
        #print("\n")
        #system_code = "CUBX0006-BLK-L"+length.user_input+"W"+width.user_input+"H"+height.user_input
        #self.encoding = system_code
        pass