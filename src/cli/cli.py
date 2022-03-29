#!/usr/bin/python3


''' Import library for running bash scripts and passing bash arguments. '''

import os
from input_branch import InputBranch






def print_option(utility, description):
    ''' Prints a help menu. '''
    print(utility+" - "+description)


def print_help():

    print()
    print("  Utilities")
    print()
    print_option("    certify", "An instrument for staging new encoding sets i.e. 'family codes' from scad libraries with special encodings. (Advanced users only)")
    print_option("    encode", "A utility for identifying an encoding to a part with known properties.")
    print_option("    decode", "An instrument for rendering a real part from a known hardware code.")
    print_option("    workshop", "An enviornment for assembling encoded parts, simulating assemblys and simulating operations.")
    print()
    print("  Keywords")
    print()
    print_option("    help", "Show options.")
    print_option("    clear", "Clear screen.")
    print_option("    exit", "Quit Phi Terminal.")
    print()



def marketplace():
    
    kit_input = InputBranch("Available Kits - Select Option")
    kit_input.options.append(["1", "Right Angle Torque Displacor", "List available kits for purchase.", kit_input.run])
    kit_input.options.append(["2", "View Designs", "List available kits for purchase.", kit_input.run])
    kit_input.options.append(["3", "View Designs", "List available kits for purchase.", kit_input.run])


    marketplace_input = InputBranch("Marketplace - Select Option")
    marketplace_input.options.append(["1", "View Designs", "List available kits for purchase.", kit_input.run])
    marketplace_input.options.append(["2", "Certify Design", "Certify kit for marketplace.", exit])
    marketplace_input.options.append(["b", "Back", "Navigate to previous menu.", exit])
    marketplace_input.run()


def wizard():

    CUBX0177_BP_input = InputBranch("What kind of adaptive geometry would you like to include?")
    CUBX0177_BP_input.options.append(["1", "BEAR", "Bearing Array", exit])
    CUBX0177_BP_input.options.append(["2", "NOSF", "Binding Array", exit])
    CUBX0177_BP_input.options.append(["5", "AD", "Binding Array", exit])
    CUBX0177_BP_input.options.append(["b", "Back", "Navigate to previous menu.", exit])


    CUBX0177_input = InputBranch("Which CUBX0177 part would you like to generate?")
    CUBX0177_input.options.append(["1", "BP", "Box Panel", CUBX0177_BP_input.run])
    CUBX0177_input.options.append(["2", "SP", "Simple Panel", exit])
    CUBX0177_input.options.append(["1", "BR", "Box Panel", CUBX0177_BP_input.run])
    CUBX0177_input.options.append(["2", "SR", "Simple Panel", exit])
    CUBX0177_input.options.append(["3", "SQ", "Square Axle", exit])
    CUBX0177_input.options.append(["4", "AA", "Axle Adapter", exit])
    CUBX0177_input.options.append(["4", "FA", "Flywheel Adapter", exit])
    CUBX0177_input.options.append(["b", "Back", "Navigate to previous menu.", exit])


    CUBX0012_input = InputBranch("Which CUBX0012 part would you like to generate?")
    CUBX0012_input.options.append(["1", "BP", "Box Panel", CUBX0177_BP_input.run])
    CUBX0012_input.options.append(["2", "SP", "Simple Panel", exit])
    CUBX0012_input.options.append(["3", "AX", "Axle", exit])
    CUBX0012_input.options.append(["4", "AD", "Axle Adapter", exit])
    CUBX0012_input.options.append(["b", "Back", "Navigate to previous menu.", exit])

    hardware_generation_code_input = InputBranch("Enter hardware code...")

    '''

    '''

    family_selection_branch = InputBranch("Select Hardware Family")
    family_selection_branch.options.append(["1", "CUBX0012", "An original prototype family featuring a trapezoidal-like profile and bolt-snap type binding.", CUBX0012_input.run])
    family_selection_branch.options.append(["2", "CUBX0177", "A hardware family which focuses on shapes which exist os combinations of unit blocks with holes in three dimensions for bolting and mass reduction.", CUBX0177_input.run])
    family_selection_branch.options.append(["3", "GEAR0010", "A gear family for use in conjenction with other families for power transmission. This code was taken from another repository and interfaced through this tool. ", exit])
    family_selection_branch.options.append(["b", "Back", "Navigate to previous menu.", exit])
    '''

    '''

    about_selection_branch = InputBranch("About - Select Resource")
    about_selection_branch.options.append(["1", "Frequently Asked Qustions", "An original prototype family featuring a trapezoidal-like profile and bolt-snap type binding.", exit])
    about_selection_branch.options.append(["2", "How this software should be used?", "An original prototype family featuring a trapezoidal-like profile and bolt-snap type binding.", exit])
    about_selection_branch.options.append(["3", "Manifesto", "An original prototype family featuring a trapezoidal-like profile and bolt-snap type binding.", exit])
    about_selection_branch.options.append(["b", "Back", "Navigate to previous menu.", exit])

    '''

    '''
    script_selection_branch = InputBranch("Wizard - Select Operation")
    script_selection_branch.options.append(["1", "Design Hardware", "A utility for designing custom modular parts and identification codes.", family_selection_branch.run])
    script_selection_branch.options.append(["2", "Generate Hardware", "Input a hardware code and generate model.", exit])
    script_selection_branch.options.append(["3", "About", "A place to learn more...", about_selection_branch.run])
    script_selection_branch.options.append(["b", "Back", "Navigate to previous menu.", exit])
    
    script_selection_branch.run()


print("\nPHITERM - Parametric Hardware Instructions TERMinal\n\n")  
print("Type 'help' to access a menu of command\n") 


phi_symbol = '\u03a6'


while True: # Main loop

    user_input = input(phi_symbol+":#> ") 

    if user_input == "help" or user_input == "man":

        print_help()

    elif user_input == "exit" or user_input == "close" or user_input == "done" or user_input == "leave":

        exit()

    elif user_input.strip().split(" ")[0] == "gen" and len(user_input.strip().split(" ")) > 1:

        os.system("python3 gen.py "+user_input.strip().split(" ")[1])

    elif user_input.strip() == "list":

        os.system("python3 list.py")

    elif user_input.strip() == "wizard":

        wizard()
        print()

    elif user_input.strip() == "market":    

        marketplace()
        print()

    elif user_input.strip() == "certify":    

        os.system("python3 certify.py")

    elif user_input.strip() == "workshop":    

        os.system("python3 workshop.py")

    else:

        os.system(user_input)
        pass



