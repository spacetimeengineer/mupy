#!/usr/bin/python3

"""
This class is one of the worst parts of this whole project. 
The reason for it's existence was that there needed to be a place to make function calls for various scad libraries.
It sucks because certification implies based on this structure that we need to inject a new directory for each family code.
At first this seems reasonable but when you consider automating certification to the point where you can make a new family for a trivial assembly, it would be hard to program so many more directories.
I Think there needs to exist a 3rd part database or online marketplace or archive where the code is stored.
"""

class Decode:
    """ This class creates objects which represent a decoding of a knonw hardware code. This object contains a name and hrdware code mostly but handles the hardware library importing routines which provide the system the tools to build the intended hardware element."""

    def __init__(self, hardware_code, directory):
            """Run at object creation."""

            self.hardware_code = hardware_code
            self.family_code = self.hardware_code.split("-")[0]
            self.family_code_valid = True
            
            ''' Checks which family the hardware code belogs to. '''

            family_code = self.hardware_code.split("-")[0]

            if family_code == "CUBX0177":
                from .lib.CUBX0177.cubx0177 import CUBX0177
                CUBX0177(self.hardware_code, directory)
            elif family_code == "CUBX0012":
                #CUBX0012(self.hardware_code, directory)
                pass
            elif family_code == "CUBX0006":
                from .lib.CUBX0006.cubx0006 import CUBX0006
                CUBX0006(self.hardware_code, directory)
                pass
            elif family_code == "CYLX0006":
                from .lib.CYLX0006.cylx0006 import CYLX0006
                CYLX0006(self.hardware_code, directory)
                pass
            elif family_code == "CRSPGR022":
                from .lib.CRSPGR022.crspgr022 import CRSPGR022
                CRSPGR022(self.hardware_code, directory)
                pass
            elif family_code == "CUSBX0177":
                from .lib.CUSBX0177.cusbx0177 import CUSBX0177
                self.digital_twin = CUSBX0177(self.hardware_code, directory)
                self.assembly = self.digital_twin.assembly
            elif family_code == "BOLTX0004":
                from .lib.BOLTX0004.boltx0004 import BOLTX0004
                BOLTX0004(self.hardware_code, directory)
            else:
                self.family_code_valid = False