#!/usr/bin/env python3

class Coordinates:
    """This class builds objects which define a parts or an assembly system coordinate set.s
    """    
    
    def __init__(self, t0 = 0, tf = 1, x0 = 0, xf = 0, y0 = 0, yf = 0, z0 = 0, zf = 0, a0 = 0, af = 0, b0 = 0, bf = 0, c0 = 0, cf = 0, e0 = 0, ef = 0, f0 = 0, ff = 0, g0 = 0, gf = 0, u0 = 0, uf = 0, v0 = 0, vf = 0, w0 = 0, wf = 0):
        """_summary_

        Args:
            t0 (int, optional): _description_. Defaults to 0.
            tf (int, optional): _description_. Defaults to 1.
            x0 (int, optional): _description_. Defaults to 0.
            xf (int, optional): _description_. Defaults to 0.
            y0 (int, optional): _description_. Defaults to 0.
            yf (int, optional): _description_. Defaults to 0.
            z0 (int, optional): _description_. Defaults to 0.
            zf (int, optional): _description_. Defaults to 0.
            a0 (int, optional): _description_. Defaults to 0.
            af (int, optional): _description_. Defaults to 0.
            b0 (int, optional): _description_. Defaults to 0.
            bf (int, optional): _description_. Defaults to 0.
            c0 (int, optional): _description_. Defaults to 0.
            cf (int, optional): _description_. Defaults to 0.
        """
                
        """Temporal (along $t axis/variable) Coordinates"""
        
        self.t0 = t0
        self.tf = tf
        
        """Assembly Type Spatial (along x,y,z axes) Coordinates"""
        
        self.x0 = x0
        self.y0 = y0
        self.z0 = z0
        
        self.xf = xf
        self.yf = yf
        self.zf = zf
        
        """Assembly Type Angular (about x,y,z axes) Coordinates"""
        
        self.a0 = a0
        self.b0 = b0
        self.c0 = c0

        self.af = af
        self.bf = bf
        self.cf = cf
        
        """Operational Type Spatial (along x,y,z axes) Coordinates"""
        
        self.e0 = e0
        self.f0 = f0
        self.g0 = g0
        
        self.ef = ef
        self.ff = ff
        self.gf = gf
        
        """Operational Type Angular (about x,y,z axes) Coordinates"""
        
        self.u0 = u0
        self.v0 = v0
        self.w0 = w0
        
        self.uf = uf
        self.vf = vf
        self.wf = wf
        
        """Other Information"""

        self.operand_id = "" # The operand_id represents the id of the hardware-unit which the coordinate transformation is operating on.
