#!/usr/bin/env python3

class Coordinates:
    """ This class builds objects which define a parts or an assembly system coordinate set."""
    
    def __init__(self, t0 = 0, tf = 1, x0 = 0, xf = 0, y0 = 0, yf = 0, z0 = 0, zf = 0, a0 = 0, af = 0, b0 = 0, bf = 0, c0 = 0, cf = 0):
        
        """Temporal (along $t axis/variable) coordinates"""
        
        self.t0 = t0
        self.tf = tf
        
        """Spatial (along x,y,z axes) coordinates"""
        
        self.x0 = x0
        self.y0 = y0
        self.z0 = z0
        self.a0 = a0
        self.b0 = b0
        self.c0 = c0
        
        """Angular (about x,y,z axes) coordinates"""
        
        self.xf = xf
        self.yf = yf
        self.zf = zf
        self.af = af
        self.bf = bf
        self.cf = cf
        
        """Other Information"""

        self.operand_id = "" # The operand_id represents the id of the hardware-unit which the coordinate transformation is operating on.
