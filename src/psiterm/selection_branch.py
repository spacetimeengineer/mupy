#!/usr/bin/env python3

class SelectionBranch:
    """ This utility class creates command line interface user selection branch objects to be easily programmable into the  cli."""

    def __init__(self, question):
        """ Run at object creation."""
        self.question = question
        self.options = []

    def pretty_print_options(self):
        """ This formats and configures the options print style."""
        for option in self.options: # For each option stored in the object.
            print("  "+option[0]+"  -  "+option[1]+" : "+option[2])

    def run(self):
        """ This runs the branch on the cli."""
        print("")
        print("  "+self.question+"\n")
        #print(len(self.options))
        if len(self.options) > 0:
            self.pretty_print_options() # Pretty print options.
            print() # Print a new line.

        user_input = input("  > ") # Takes in user input.
        for option in self.options: # For each option stored in the object.
            if user_input == option[0]: # For whichever option is selected run its counterpart routine.
                if len(option) == 5:
                    option[3](option[4]) # Execute routine.
                elif len(option) == 3:
                    option[3]() # Execute routine.
                else: # If something else we dont expect happens just do nothing for now.
                    pass # Just continue on without further execution.


