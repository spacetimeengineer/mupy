#!/usr/bin/env python3
class InputBranch:

    # Run at object creation.
    def __init__(self, question):

        self.question = question
        self.options = []

    def pretty_print_options(self):
        for option in self.options: # For each option stored in the object.
            print("  "+option[0]+"  -  "+option[1]+" : "+option[2])

    def run(self):
        print("")
        print("  "+self.question+"\n")
        #print(len(self.options))
        if len(self.options) > 0:
            self.pretty_print_options() # Pretty print options.
            print()

        user_input = input("  > ") # Takes in user input.
        for option in self.options: # For each option stored in the object.
            if user_input == option[0]: # For whichever option is selected run its counterpart routine.
                option[3]() # Execute routine.


