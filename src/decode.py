#!/usr/bin/python3

from .lib.CUBX0006.cubx0006 import CUBX0006
from .lib.CUBX0177.cubx0177 import CUBX0177
from .lib.CRSPGR022.crspgr022 import CRSPGR022

class Decode:
    """ This class creates objects which represent a decoding of a knonw hardware code. This object contains a name and hrdware code mostly but handles the hardware library importing routines which provide the system the tools to build the intended hardware element."""

    def __init__(self, hardware_code, directory):
            """Run at object creation."""

            self.name = "unnamed"
            self.hardware_code = hardware_code
            self.family_code = self.hardware_code.split("-")[0]

            ''' Checks which family the hardware code belogs to. '''

            family_code = self.hardware_code.split("-")[0]

            if family_code == "CUBX0177":
                CUBX0177(self.hardware_code, directory)
            if family_code == "CUBX0012":
                #CUBX0012(self.hardware_code, directory)
                pass
            if family_code == "CUBX0006":
                #CUBX0006(self.hardware_code, directory)
                pass
            if family_code == "CRSPGR022":
                CRSPGR022(self.hardware_code, directory)
                pass