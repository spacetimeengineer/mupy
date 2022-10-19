#!/usr/bin/env python3
class SelectionBranch:
    """_summary_
    """    
    def __init__(self, question):
        """_summary_

        Args:
            question (_type_): _description_
        """
        self.question = question
        self.options = []

    def pretty_print_options(self):
        """_summary_
        """        
        for option in self.options: # For each option stored in the object.
            print("  "+option[0]+"  -  "+option[1]+" : "+option[2])

    def run(self):
        """_summary_
        """        
        mu_symbol = '\u00B5'
        print("\n"+mu_symbol+":! "+self.question+"\n")
        if len(self.options) > 0:
            self.pretty_print_options() # Pretty print options.
            print("")

        user_input = input("  > ") # Takes in user input.
        print("") # Prints a newline.
        for option in self.options: # For each option stored in the object.
            if user_input == option[0]: # For whichever option is selected run its counterpart routine.
                if len(option) == 5: # If the function that is passed needs an accompanying input.
                    option[3](option[4]) # Execute the function (4th element) with the input passed into it (5th element).
                elif len(option) == 4:
                    option[3]() # Execute routine.
                else:
                    pass


