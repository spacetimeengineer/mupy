#!/usr/bin/env python3
class InputBranch:
    """Creates objects which inject themselves into some shell or terminal type enviornment and asks users for input."""
 
    def __init__(self, question): # Run at object creation.
        """Runs when class object is created."""
        self.question = question # A question that prompts the user for some meaningful input.
        self.user_input = "" # A string given by the user corresponding to self.question when run() is called.
        
    def run(self): # Run user input class function.
        """Prompts user for some alphanumeric input specified by self.question."""
        print("  "+self.question+"\n") # Prompts user.
        self.user_input = input("  > ") # Takes user input.
        print("") # Provides  newline.

