#!/usr/bin/python3


''' Import library for running bash scripts and passing bash arguments. '''

import os
from mupy.mucli.selection_branch import SelectionBranch
from mupy.mucli.input_branch import InputBranch
from mupy.lib.CUBX0006.cubx0006 import CUBX0006, CUBX0006_encoding
from mupy.hardware import Hardware
from pathlib import Path

def encoding_session():

    enter_a_number_branch = InputBranch("Enter a number from 1 to 10")
    CUBX0177_BP_input = SelectionBranch("Select adaptive geometry.")
    CUBX0177_BP_input.options.append(["1", "BEAR", "Bearing Array", exit])
    CUBX0177_BP_input.options.append(["2", "NOSF", "Binding Array", exit])
    CUBX0177_BP_input.options.append(["3", "AD", "Binding Array", exit])
    CUBX0177_BP_input.options.append(["b", "Back", "Navigate to previous menu.", exit])

    CUBX0006_input = SelectionBranch("Select type:")
    CUBX0006_input.options.append(["1", "BP", "Box Panel", CUBX0177_BP_input.run])
    
    CUBX0012_input = SelectionBranch("Select type:")
    CUBX0012_input.options.append(["1", "BP", "Box Panel", CUBX0177_BP_input.run])
    CUBX0012_input.options.append(["2", "SP", "Simple Panel", exit])
    CUBX0012_input.options.append(["3", "AX", "Axle", exit])
    CUBX0012_input.options.append(["4", "AD", "Axle Adapter", exit])
    CUBX0012_input.options.append(["b", "Back", "Navigate to previous menu.", exit])

    hardware_generation_code_input = SelectionBranch("Enter hardware code...")

    CUBX00006_encoding = CUBX0006_encoding()
    family_selection_branch = SelectionBranch("Select hardware family")
    family_selection_branch.options.append(["1", "CUBX0006", "The most basic cubic family. This family features a single block type 'BLK' and takes in parameters which indicate length, width and height of a solid block.", CUBX00006_encoding.encode_session ])
    
    family_selection_branch.options.append(["2", "CUBX0012", "An original cubic prototype family featuring a trapezoidal type profile with bolt-snap style binding.", CUBX0012_input.run])
    family_selection_branch.options.append(["3", "CUBX0177", "A versatile cubic family featuring parts made from arrays of 'unit blocks' with a joinery-bolt-custom style binding.", exit])
    family_selection_branch.options.append(["4", "CYLX0008", "A hardware family dedicated to defining pipes.", enter_a_number_branch.run])
    family_selection_branch.options.append(["5", "BOLTX002", "Hardware family dedicated to nuts, bolts and screws.", exit])
    family_selection_branch.options.append(["6", "GEAR0010", "A gear family used for uses in power transmission.", exit])
    family_selection_branch.options.append(["b", "Back", "Navigate to previous menu.", encoding_session])

    family_selection_branch.run()
    
mu_symbol = '\u00B5'
print("\n"+mu_symbol+"term ~ manufacturing utility terminal\n") 
relative_workspace_path=""
while len(relative_workspace_path) == 0:
    relative_workspace_path = input(mu_symbol+":! To proceed you must specify an existing workspace directory or create a new workspace directory relative to home path (:~/$) \n\n    > ")
    relative_workspace_path.replace(" ", "_")
absolute_workspace_path = str(Path.home()) + "/" + relative_workspace_path
if not os.path.exists(absolute_workspace_path):
    os.makedirs(absolute_workspace_path)
    print("\n"+mu_symbol+":! Setting up workspace directory : "+absolute_workspace_path)
else:
    print("\n"+mu_symbol+":! Utilizing workspace directory : "+absolute_workspace_path)
print(""+mu_symbol+":! Press 'Enter' to begin an encoding session or specify a hardware code and press 'Enter'\n") 
while True: # Main loop
    user_input = input(mu_symbol+":# ") 
    if user_input == "exit" or user_input == "close" or user_input == "done" or user_input == "leave":
        exit()
    elif user_input == "encode":
        encoding_session()
        pass
    elif user_input == "clear":
        os.system('cls' if os.name == 'nt' else 'clear')
        pass
    elif len(user_input) > 0:
        if (len(user_input.split("-"))) < 3:
            print("\n"+mu_symbol+":! Invalid system-code format")
        else:
            name = input(mu_symbol+":! Enter a part name (optional) or press 'Enter' to leave hardware unnamed \n\n    > ")
            if name == "": # If the name input is blank.
                name = "unnamed" # Assigns the to the hardware 'unnamed' as a name.
            hardware = Hardware(name, user_input) # Creates hardware from system-code and assigns some name. # Names are usually but not necessarily unique.
            hardware.mucli_build_hardware(absolute_workspace_path)
    else:
        pass
