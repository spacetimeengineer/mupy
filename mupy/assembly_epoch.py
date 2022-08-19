#!/usr/bin/env python3

class AssemblyEpoch:
    """ This class stores $t values for assembly animations ; specifically are used to break hirearchies into chunks of equivilent periods of time that automate the otherwise difficylt process"""
    
    def __init__(self, epoch_start, epoch_end):
        self.epoch_start = epoch_start
        self.epoch_end = epoch_end