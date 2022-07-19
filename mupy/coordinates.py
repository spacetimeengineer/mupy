#!/usr/bin/env python3

class Coordinates:
    """ This class builds objects which define a parts or an assembly system coordinate set."""
    
    def __init__(self, t_i = 0, t_f = 1, p_i = [0,0,0], p_f= [0,0,0], a_i= [0,0,0], a_f = [0,0,0]): # TODO : Change parameter names to something more readable.

        self.time_0 = t_i # Initial time. 0 < t_i < 1 , t_f > t_i (default = 0)
        self.time_f = t_f # Final time. 0 < t_f < 1 , t_f > t_i (default = 1)

        self.position_0 = p_i # Initial_position.
        self.position_f = p_f # Final position.

        self.orientation_0 = a_i # Initial angle.
        self.orientation_f = a_f # Final angle. 

        # self.translational_velocity_0 = vt_i # Initial translational velocity.
        # self.translational_velocity_f = vt_i # Final rotational velocity.

        # self.rotational_velocity_0 = rv_i # Initial translational velocity.
        # self.rotational_velocity_f = rv_f # Final rotational velocity.

        self.operand_id = "" # The operand _id is the id of the hardware-unit the coordinate transformation is operating on.
        #self.description = "This data block describes the assembly coordinates for " + self.operand_id + " from time, denoted in open scad code by $t = " + self.time_0 + " to $t = " + self.time_f + "." # Gives a contextual description of this object.




        self.coordinates_json = {} # Coordinate json object. # TODO: Depreciate for better variables.
        self.t_i = t_i # Initial time. 0 < t_i < 1 , t_f > t_i (default = 0) # TODO: Depreciate for better variables.
        self.t_f = t_f # Final time. 0 < t_f < 1 , t_f > t_i (default = 1) # TODO: Depreciate for better variables.
        self.p_i = p_i # Initial_position.# TODO: Depreciate for better variables.
        self.p_f = p_f # Final position. # TODO: Depreciate for better variables.
        self.a_i = a_i # Initial angle. # TODO: Depreciate for better variables.
        self.a_f = a_f # Final angle. # TODO: Depreciate for better variables.
        self.refresh() # TODO: Depreciate for better variables.





    def refresh(self): # TODO : Depreciate this function.

        self.coordinates_json["t_i"] = self.t_i # TODO : Depreciate this function.
        self.coordinates_json["t_f"] = self.t_f # TODO : Depreciate this function.
        self.coordinates_json["p_i"] = self.p_i # TODO : Depreciate this function.
        self.coordinates_json["p_f"] = self.p_f # TODO : Depreciate this function.
        self.coordinates_json["a_i"] = self.a_i # TODO : Depreciate this function.
        self.coordinates_json["a_f"] = self.a_f # TODO : Depreciate this function.