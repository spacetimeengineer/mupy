#!/usr/bin/python3


''' Import library for running bash scripts and passing bash arguments. '''

import os
from src.psiterm.input_branch import InputBranch
from src.lib.CUBX0006.cubx0006 import * 
from src.decode import Decode
from src.hardware import Hardware


def encoding_session():

    CUBX0177_BP_input = InputBranch("Select adaptive geometry.")
    CUBX0177_BP_input.options.append(["1", "BEAR", "Bearing Array", exit])
    CUBX0177_BP_input.options.append(["2", "NOSF", "Binding Array", exit])
    CUBX0177_BP_input.options.append(["3", "AD", "Binding Array", exit])
    CUBX0177_BP_input.options.append(["b", "Back", "Navigate to previous menu.", exit])


    CUBX0006_input = InputBranch("Select type:")
    CUBX0006_input.options.append(["1", "BP", "Box Panel", CUBX0177_BP_input.run])
    CUBX0006_input.user_input.append("length")
    CUBX0006_input.user_input.append("width")
    CUBX0006_input.user_input.append("")

    CUBX0177_input = InputBranch("Select type:")
    CUBX0177_input.options.append(["1", "BP", "Box Panel", CUBX0177_BP_input.run])
    CUBX0177_input.options.append(["2", "SP", "Simple Panel", exit])
    CUBX0177_input.options.append(["1", "BR", "Box Panel", CUBX0177_BP_input.run])
    CUBX0177_input.options.append(["2", "SR", "Simple Panel", exit])
    CUBX0177_input.options.append(["3", "SQ", "Square Axle", exit])
    CUBX0177_input.options.append(["4", "AA", "Axle Adapter", exit])
    CUBX0177_input.options.append(["4", "FA", "Flywheel Adapter", exit])
    CUBX0177_input.options.append(["b", "Back", "Navigate to previous menu.", exit])

    CUBX0012_input = InputBranch("Select type:")
    CUBX0012_input.options.append(["1", "BP", "Box Panel", CUBX0177_BP_input.run])
    CUBX0012_input.options.append(["2", "SP", "Simple Panel", exit])
    CUBX0012_input.options.append(["3", "AX", "Axle", exit])
    CUBX0012_input.options.append(["4", "AD", "Axle Adapter", exit])
    CUBX0012_input.options.append(["b", "Back", "Navigate to previous menu.", exit])

    hardware_generation_code_input = InputBranch("Enter hardware code...")

    '''

    '''

    family_selection_branch = InputBranch("Select Hardware Family")
    family_selection_branch.options.append(["1", "CUBX0006", "The most basic cubic family. This family features a single block type 'BLK' and takes in parameters which indicate length, width and height of a solid block.", CUBX0006_BLK_encode_session()])
    family_selection_branch.options.append(["2", "CUBX0012", "An original cubic prototype family featuring a trapezoidal type profile with bolt-snap style binding.", CUBX0012_input.run])
    family_selection_branch.options.append(["3", "CUBX0177", "A versatile cubic family featuring parts made from arrays of 'unit blocks' with a joinery-bolt-custom style binding.", CUBX0177_input.run])
    family_selection_branch.options.append(["4", "CYLX0008", "A hardware family dedicated to defining pipes.", print, "Hello World"])
    family_selection_branch.options.append(["5", "BOLTX002", "Hardware family dedicated to nuts, bolts and screws.", CUBX0177_input.run])
    family_selection_branch.options.append(["6", "GEAR0010", "A gear family used for uses in power transmission.", exit])
    family_selection_branch.options.append(["b", "Back", "Navigate to previous menu.", exit])
    '''


    '''

    
    family_selection_branch.run()


print("\nPSITERM - Parametric System Instructions TERMinal\n\n")  
print("Press 'Enter' to begin an encoding session or specify a hardware code and press 'Enter'\n") 


phi_symbol = '\u03C8'
while True: # Main loop
    user_input = input(phi_symbol+":# ") 
    if user_input == "exit" or user_input == "close" or user_input == "done" or user_input == "leave":
        exit()
    elif user_input == "":
        #encoding_session()
        pass
    elif len(user_input) > 0:
        hardware = Hardware("unnamed", user_input)
        hardware.build_hardware(os.getcwd()+"/generated_psi_source_code")
    else:        
        pass



