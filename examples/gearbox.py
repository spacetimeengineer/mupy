#!/usr/bin/env python3

import mupy.core as mu


# A workspace represents a virtual 3D spce which serves as a virtual workbench except it is not a surface but a space.
""" Workspace """

workspace = mu.WorkSpace("/home/mryan/Desktop/psi/modular_gearboxes/")

""" Hardware """


bevel_gear_a = mu.Hardware("inner_chamber_bevel_gear_a", "CRSPGR022-BG-M1-T34W23S10-P15H0C45-B0") # Declare bevel gear of 
bevel_gear_b = mu.Hardware("inner_chamber_bevel_gear_b", "CRSPGR022-BG-M2-T22W23S10-P15H0C45-B0")
bevel_gear_c = mu.Hardware("inner_chamber_bevel_gear_c", "CRSPGR022-BG-M2-T34W23S10-P15H0C45-B0")
bevel_gear_d = mu.Hardware("inner_chamber_bevel_gear_d", "CRSPGR022-BG-M3-T55W23S10-P15H0C45-B0")

bearing_a = mu.Hardware("bearing_a", "bearing.stl")
bearing_b = mu.Hardware("bearing_b", "bearing.stl")
bearing_c = mu.Hardware("bearing_c", "bearing.stl")
bearing_d = mu.Hardware("bearing_d", "bearing.stl")

panel_a = mu.Hardware("panel_a", "CUBX0177-BPAN-B25SR2P5-X8Y8P18-RT-SX25Y25-X8Y8-X20Y20Z5")
panel_b = mu.Hardware("panel_b", "CUBX0177-BPAN-B25SR2P5-X8Y8P18-RT-SX25Y25-X8Y8-X20Y20Z5")
panel_c = mu.Hardware("panel_c", "CUBX0177-BPAN-B25SR2P5-X8Y8P18-RT-SX25Y25-X8Y8-X20Y20Z5")
panel_d = mu.Hardware("panel_d", "CUBX0177-BPAN-B25SR2P5-X8Y8P18-RT-SX25Y25-X8Y8-X20Y20Z5")
panel_e = mu.Hardware("panel_e", "CUBX0177-BPAN-B25SR2P5-X8Y8P18-RT-SX25Y25-X8Y8-X20Y20Z5")
panel_f = mu.Hardware("panel_f", "CUBX0177-BPAN-B25SR2P5-X8Y8P18-RT-SX25Y25-X8Y8-X20Y20Z5")

flywheel_adapter_a = mu.Hardware("flywheel_adapter_a", "CUBX0177-BPAN-B25SR2P5-X3Y7P18-RT-SX25Y25-X8Y8-X20Y2010Z5")
flywheel_adapter_b = mu.Hardware("flywheel_adapter_b", "CUBX0177-BPAN-B25SR2P5-X3Y7P18-RT-SX25Y25-X8Y8-X20Y2010Z5")

axle_adapter_a = mu.Hardware("axle_adapter_a", "CUBX0177-BPAN-B25SR2P5-X3Y7P18-RT-SX25Y25-X8Y8-X20Y2010Z5")
axle_adapter_b = mu.Hardware("axle_adapter_b", "CUBX0177-BPAN-B25SR2P5-X3Y7P18-RT-SX25Y25-X8Y8-X20Y2010Z5")

axle_adapter_bolt_a_1 = mu.Hardware("axle_adapter_bolt_a_1", "CUBX0177-BPAN-B25SR2P5-X3Y7P18-RT-SX25Y25-X8Y8-X20Y2010Z5")
axle_adapter_bolt_a_2 = mu.Hardware("axle_adapter_bolt_a_2", "CUBX0177-BPAN-B25SR2P5-X3Y7P18-RT-SX25Y25-X8Y8-X20Y2010Z5")
axle_adapter_bolt_a_3 = mu.Hardware("axle_adapter_bolt_a_3", "CUBX0177-BPAN-B25SR2P5-X3Y7P18-RT-SX25Y25-X8Y8-X20Y2010Z5")
axle_adapter_bolt_a_4 = mu.Hardware("axle_adapter_bolt_a_4", "CUBX0177-BPAN-B25SR2P5-X3Y7P18-RT-SX25Y25-X8Y8-X20Y2010Z5")

axle_adapter_bolt_b_1 = mu.Hardware("axle_adapter_bolt_b_1", "CUBX0177-BPAN-B25SR2P5-X3Y7P18-RT-SX25Y25-X8Y8-X20Y2010Z5")
axle_adapter_bolt_b_2 = mu.Hardware("axle_adapter_bolt_b_2", "CUBX0177-BPAN-B25SR2P5-X3Y7P18-RT-SX25Y25-X8Y8-X20Y2010Z5")
axle_adapter_bolt_b_3 = mu.Hardware("axle_adapter_bolt_b_3", "CUBX0177-BPAN-B25SR2P5-X3Y7P18-RT-SX25Y25-X8Y8-X20Y2010Z5")
axle_adapter_bolt_b_4 = mu.Hardware("axle_adapter_bolt_b_4", "CUBX0177-BPAN-B25SR2P5-X3Y7P18-RT-SX25Y25-X8Y8-X20Y2010Z5")

boltshaft_a = mu.Hardware("boltshaft_a", "CUBX0177-BPAN-B25SR2P5-X3Y7P18-RT-SX25Y25-X8Y8-X20Y2010Z5")
boltshaft_b = mu.Hardware("boltshaft_a", "CUBX0177-BPAN-B25SR2P5-X3Y7P18-RT-SX25Y25-X8Y8-X20Y2010Z5")

gear_top_lock_washer_a = mu.Hardware("gear_top_lock_washer_a","CUBX0177-BPAN-B25SR2P5-X3Y7P18-RT-SX25Y25-X8Y8-X20Y2010Z5") 
gear_top_lock_washer_b = mu.Hardware("gear_top_lock_washer_b","CUBX0177-BPAN-B25SR2P5-X3Y7P18-RT-SX25Y25-X8Y8-X20Y2010Z5")

gear_top_washer_a = mu.Hardware("gear_top_washer_a","CUBX0177-BPAN-B25SR2P5-X3Y7P18-RT-SX25Y25-X8Y8-X20Y2010Z5")
gear_top_washer_b = mu.Hardware("gear_top_washer_b","CUBX0177-BPAN-B25SR2P5-X3Y7P18-RT-SX25Y25-X8Y8-X20Y2010Z5")

gear_top_nut_a = mu.Hardware("gear_top_nut_a","CUBX0177-BPAN-B25SR2P5-X3Y7P18-RT-SX25Y25-X8Y8-X20Y2010Z5")
gear_top_nut_b = mu.Hardware("gear_top_nut_b","CUBX0177-BPAN-B25SR2P5-X3Y7P18-RT-SX25Y25-X8Y8-X20Y2010Z5")

gear_bottom_lock_washer_a = mu.Hardware("gear_bottom_lock_washer_a","CUBX0177-BPAN-B25SR2P5-X3Y7P18-RT-SX25Y25-X8Y8-X20Y2010Z5")
gear_bottom_lock_washer_b = mu.Hardware("gear_bottom_lock_washer_b","CUBX0177-BPAN-B25SR2P5-X3Y7P18-RT-SX25Y25-X8Y8-X20Y2010Z5")

gear_bottom_washer_a = mu.Hardware("gear_bottom_washer_a","CUBX0177-BPAN-B25SR2P5-X3Y7P18-RT-SX25Y25-X8Y8-X20Y2010Z5")
gear_bottom_washer_b = mu.Hardware("gear_bottom_washer_b","CUBX0177-BPAN-B25SR2P5-X3Y7P18-RT-SX25Y25-X8Y8-X20Y2010Z5")

gear_bottom_nut_a = mu.Hardware("gear_bottom_nut_a","CUBX0177-BPAN-B25SR2P5-X3Y7P18-RT-SX25Y25-X8Y8-X20Y2010Z5")
gear_bottom_nut_b = mu.Hardware("gear_bottom_nut_b","CUBX0177-BPAN-B25SR2P5-X3Y7P18-RT-SX25Y25-X8Y8-X20Y2010Z5")

bearing_top_lock_washer_a = mu.Hardware("bearing_top_lock_washer_a","CUBX0177-BPAN-B25SR2P5-X3Y7P18-RT-SX25Y25-X8Y8-X20Y2010Z5") 
bearing_top_lock_washer_b = mu.Hardware("bearing_top_lock_washer_b","CUBX0177-BPAN-B25SR2P5-X3Y7P18-RT-SX25Y25-X8Y8-X20Y2010Z5")

bearing_top_washer_a = mu.Hardware("bearing_top_washer_a","CUBX0177-BPAN-B25SR2P5-X3Y7P18-RT-SX25Y25-X8Y8-X20Y2010Z5")
bearing_top_washer_b = mu.Hardware("bearing_top_washer_b","CUBX0177-BPAN-B25SR2P5-X3Y7P18-RT-SX25Y25-X8Y8-X20Y2010Z5")

bearing_top_nut_a = mu.Hardware("bearing_top_nut_a","CUBX0177-BPAN-B25SR2P5-X3Y7P18-RT-SX25Y25-X8Y8-X20Y2010Z5")
bearing_top_nut_b = mu.Hardware("bearing_top_nut_b","CUBX0177-BPAN-B25SR2P5-X3Y7P18-RT-SX25Y25-X8Y8-X20Y2010Z5")

bearing_bottom_lock_washer_a = mu.Hardware("bearing_bottom_lock_washer_a","CUBX0177-BPAN-B25SR2P5-X3Y7P18-RT-SX25Y25-X8Y8-X20Y2010Z5")
bearing_bottom_lock_washer_b = mu.Hardware("bearing_bottom_lock_washer_b","CUBX0177-BPAN-B25SR2P5-X3Y7P18-RT-SX25Y25-X8Y8-X20Y2010Z5")

bearing_bottom_washer_a = mu.Hardware("bearing_bottom_washer_a","CUBX0177-BPAN-B25SR2P5-X3Y7P18-RT-SX25Y25-X8Y8-X20Y2010Z5")
bearing_bottom_washer_b = mu.Hardware("bearing_bottom_washer_b","CUBX0177-BPAN-B25SR2P5-X3Y7P18-RT-SX25Y25-X8Y8-X20Y2010Z5")

bearing_bottom_nut_a = mu.Hardware("bearing_bottom_nut_a","CUBX0177-BPAN-B25SR2P5-X3Y7P18-RT-SX25Y25-X8Y8-X20Y2010Z5")
bearing_bottom_nut_b = mu.Hardware("bearing_bottom_nut_b","CUBX0177-BPAN-B25SR2P5-X3Y7P18-RT-SX25Y25-X8Y8-X20Y2010Z5")

bearing_adapter_top_nut_a = mu.Hardware("bearing_bottom_nut_a","CUBX0177-BPAN-B25SR2P5-X3Y7P18-RT-SX25Y25-X8Y8-X20Y2010Z5")
bearing_adapter_top_nut_b = mu.Hardware("bearing_bottom_nut_a","CUBX0177-BPAN-B25SR2P5-X3Y7P18-RT-SX25Y25-X8Y8-X20Y2010Z5")

bearing_adapter_top_lockwasher_a = mu.Hardware("bearing_bottom_nut_a","CUBX0177-BPAN-B25SR2P5-X3Y7P18-RT-SX25Y25-X8Y8-X20Y2010Z5")
bearing_adapter_top_lockwasher_b = mu.Hardware("bearing_bottom_nut_a","CUBX0177-BPAN-B25SR2P5-X3Y7P18-RT-SX25Y25-X8Y8-X20Y2010Z5")

bearing_adapter_top_washer_a = mu.Hardware("bearing_bottom_nut_a","CUBX0177-BPAN-B25SR2P5-X3Y7P18-RT-SX25Y25-X8Y8-X20Y2010Z5")
bearing_adapter_top_washer_b = mu.Hardware("bearing_bottom_nut_a","CUBX0177-BPAN-B25SR2P5-X3Y7P18-RT-SX25Y25-X8Y8-X20Y2010Z5")

bearing_adapter = mu.Hardware("bearing_bottom_nut_a","CUBX0177-BPAN-B25SR2P5-X3Y7P18-RT-SX25Y25-X8Y8-X20Y2010Z5")
bearing_adapter = mu.Hardware("bearing_bottom_nut_a","CUBX0177-BPAN-B25SR2P5-X3Y7P18-RT-SX25Y25-X8Y8-X20Y2010Z5")

bearing_adapter_bottom_washer_a = mu.Hardware("bearing_bottom_nut_a","CUBX0177-BPAN-B25SR2P5-X3Y7P18-RT-SX25Y25-X8Y8-X20Y2010Z5")
bearing_adapter_bottom_washer_b = mu.Hardware("bearing_bottom_nut_a","CUBX0177-BPAN-B25SR2P5-X3Y7P18-RT-SX25Y25-X8Y8-X20Y2010Z5")

bearing_adapter_bottom_lockwasher_a = mu.Hardware("bearing_bottom_nut_a","CUBX0177-BPAN-B25SR2P5-X3Y7P18-RT-SX25Y25-X8Y8-X20Y2010Z5")
bearing_adapter_bottom_lockwasher_b = mu.Hardware("bearing_bottom_nut_a","CUBX0177-BPAN-B25SR2P5-X3Y7P18-RT-SX25Y25-X8Y8-X20Y2010Z5")

bearing_adapter_bottom_nut_a = mu.Hardware("bearing_bottom_nut_a","CUBX0177-BPAN-B25SR2P5-X3Y7P18-RT-SX25Y25-X8Y8-X20Y2010Z5")
bearing_adapter_bottom_nut_b = mu.Hardware("bearing_bottom_nut_a","CUBX0177-BPAN-B25SR2P5-X3Y7P18-RT-SX25Y25-X8Y8-X20Y2010Z5")

""" Assemblies """
bearing_panel_a = mu.Assembly("bearing_panel_a")
#bearing_panel_a.include(panel_a, Coordinates(0,1,[-999,-999,999],[10,10,10],[0,0,0],[10,10,10]))
bearing_panel_a.include(bearing_a, mu.Coordinates(0,1,[-999,-999,999],[10,10,10],[0,0,0],[10,10,10]))

gear_axle_assembly_a = mu.Assembly("gear_axle_assembly_a")
gear_axle_assembly_a.include(boltshaft_a, mu.Coordinates(0,1,[-999,-999,999],[10,10,10],[0,0,0],[10,10,10]))
gear_axle_assembly_a.include(gear_top_lock_washer_a, mu.Coordinates(0,1,[-999,-999,999],[10,10,10],[0,0,0],[10,10,10]))
gear_axle_assembly_a.include(gear_top_washer_a, mu.Coordinates(0,1,[-999,-999,999],[10,10,10],[0,0,0],[10,10,10]))
gear_axle_assembly_a.include(bevel_gear_a, mu.Coordinates(0,1,[-999,-999,999],[10,10,10],[0,0,0],[10,10,10]))
gear_axle_assembly_a.include(gear_bottom_washer_a, mu.Coordinates(0,1,[-999,-999,999],[10,10,10],[0,0,0],[10,10,10]))
gear_axle_assembly_a.include(gear_bottom_lock_washer_a, mu.Coordinates(0,1,[-999,-999,999],[10,10,10],[0,0,0],[10,10,10]))
gear_axle_assembly_a.include(gear_bottom_nut_a, mu.Coordinates(0,1,[-999,-999,999],[10,10,10],[0,0,0],[10,10,10]))
gear_axle_assembly_a.include(bearing_top_nut_a, mu.Coordinates(0,1,[-999,-999,999],[10,10,10],[0,0,0],[10,10,10]))
gear_axle_assembly_a.include(bearing_top_lock_washer_a, mu.Coordinates(0,1,[-999,-999,999],[10,10,10],[0,0,0],[10,10,10]))
gear_axle_assembly_a.include(bearing_top_washer_a, mu.Coordinates(0,1,[-999,-999,999],[10,10,10],[0,0,0],[10,10,10]))
gear_axle_assembly_a.include(bearing_panel_a, mu.Coordinates(0,1,[-999,-999,999],[10,10,10],[0,0,0],[10,10,10]))
gear_axle_assembly_a.include(bearing_bottom_washer_a, mu.Coordinates(0,1,[-999,-999,999],[10,10,10],[0,0,0],[10,10,10]))
gear_axle_assembly_a.include(bearing_bottom_lock_washer_a, mu.Coordinates(0,1,[-999,-999,999],[10,10,10],[0,0,0],[10,10,10]))
gear_axle_assembly_a.include(bearing_bottom_nut_a, mu.Coordinates(0,1,[-999,-999,999],[10,10,10],[0,0,0],[10,10,10]))
gear_axle_assembly_a.include(bearing_adapter_top_nut_a, mu.Coordinates(0,1,[-999,-999,999],[10,10,10],[0,0,0],[10,10,10]))
gear_axle_assembly_a.include(bearing_adapter_top_lockwasher_a, mu.Coordinates(0,1,[-999,-999,999],[10,10,10],[0,0,0],[10,10,10]))
gear_axle_assembly_a.include(bearing_adapter_top_washer_a, mu.Coordinates(0,1,[-999,-999,999],[10,10,10],[0,0,0],[10,10,10]))
gear_axle_assembly_a.include(bearing_adapter, mu.Coordinates(0,1,[-999,-999,999],[10,10,10],[0,0,0],[10,10,10]))
gear_axle_assembly_a.include(bearing_adapter_bottom_washer_a, mu.Coordinates(0,1,[-999,-999,999],[10,10,10],[0,0,0],[10,10,10]))
gear_axle_assembly_a.include(bearing_adapter_bottom_lockwasher_a, mu.Coordinates(0,1,[-999,-999,999],[10,10,10],[0,0,0],[10,10,10]))
gear_axle_assembly_a.include(bearing_adapter_bottom_nut_a, mu.Coordinates(0,1,[-999,-999,999],[10,10,10],[0,0,0],[10,10,10]))

system_a = mu.Assembly("system_a")
system_a.include(gear_axle_assembly_a, mu.Coordinates(0,1,[-999,-999,999],[10,10,10],[0,0,0],[10,10,10]))
system_a.include(axle_adapter_a, mu.Coordinates(0,1,[-999,-999,999],[10,10,10],[0,0,0],[10,10,10]))


bearing_panel_b = mu.Assembly("bearing_panel_b")
#bearing_panel_b.include(panel_b, Coordinates(0,1,[-999,-999,999],[10,10,10],[0,0,0],[10,10,10]))
bearing_panel_b.include(bearing_b, mu.Coordinates(0,1,[-999,-999,999],[10,10,10],[0,0,0],[10,10,10]))

gear_axle_assembly_b = mu.Assembly("gear_axle_assembly_b")
gear_axle_assembly_b.include(boltshaft_b, mu.Coordinates(0,1,[-999,-999,999],[10,10,10],[0,0,0],[10,10,10]))
gear_axle_assembly_b.include(gear_top_lock_washer_b, mu.Coordinates(0,1,[-999,-999,999],[10,10,10],[0,0,0],[10,10,10]))
gear_axle_assembly_b.include(gear_top_washer_b, mu.Coordinates(0,1,[-999,-999,999],[10,10,10],[0,0,0],[10,10,10]))
gear_axle_assembly_b.include(bevel_gear_b, mu.Coordinates(0,1,[-999,-999,999],[10,10,10],[0,0,0],[10,10,10]))
gear_axle_assembly_b.include(gear_bottom_washer_b, mu.Coordinates(0,1,[-999,-999,999],[10,10,10],[0,0,0],[10,10,10]))
gear_axle_assembly_b.include(gear_bottom_lock_washer_b, mu.Coordinates(0,1,[-999,-999,999],[10,10,10],[0,0,0],[10,10,10]))
gear_axle_assembly_b.include(gear_bottom_nut_b, mu.Coordinates(0,1,[-999,-999,999],[10,10,10],[0,0,0],[10,10,10]))
gear_axle_assembly_b.include(bearing_top_nut_b, mu.Coordinates(0,1,[-999,-999,999],[10,10,10],[0,0,0],[10,10,10]))
gear_axle_assembly_b.include(bearing_top_lock_washer_b, mu.Coordinates(0,1,[-999,-999,999],[10,10,10],[0,0,0],[10,10,10]))
gear_axle_assembly_b.include(bearing_top_washer_b, mu.Coordinates(0,1,[-999,-999,999],[10,10,10],[0,0,0],[10,10,10]))
gear_axle_assembly_b.include(bearing_panel_b, mu.Coordinates(0,1,[-999,-999,999],[10,10,10],[0,0,0],[10,10,10]))
gear_axle_assembly_b.include(bearing_bottom_washer_b, mu.Coordinates(0,1,[-999,-999,999],[10,10,10],[0,0,0],[10,10,10]))
gear_axle_assembly_b.include(bearing_bottom_lock_washer_b, mu.Coordinates(0,1,[-999,-999,999],[10,10,10],[0,0,0],[10,10,10]))
gear_axle_assembly_b.include(bearing_bottom_nut_b, mu.Coordinates(0,1,[-999,-999,999],[10,10,10],[0,0,0],[10,10,10]))
gear_axle_assembly_b.include(bearing_adapter_top_nut_b, mu.Coordinates(0,1,[-999,-999,999],[10,10,10],[0,0,0],[10,10,10]))
gear_axle_assembly_b.include(bearing_adapter_top_lockwasher_b, mu.Coordinates(0,1,[-999,-999,999],[10,10,10],[0,0,0],[10,10,10]))
gear_axle_assembly_b.include(bearing_adapter_top_washer_b, mu.Coordinates(0,1,[-999,-999,999],[10,10,10],[0,0,0],[10,10,10]))
gear_axle_assembly_b.include(bearing_adapter, mu.Coordinates(0,1,[-999,-999,999],[10,10,10],[0,0,0],[10,10,10]))
gear_axle_assembly_b.include(bearing_adapter_bottom_washer_b, mu.Coordinates(0,1,[-999,-999,999],[10,10,10],[0,0,0],[10,10,10]))
gear_axle_assembly_b.include(bearing_adapter_bottom_lockwasher_b, mu.Coordinates(0,1,[-999,-999,999],[10,10,10],[0,0,0],[10,10,10]))
gear_axle_assembly_b.include(bearing_adapter_bottom_nut_b, mu.Coordinates(0,1,[-999,-999,999],[10,10,10],[0,0,0],[10,10,10]))

system_b = mu.Assembly("system_b")
system_b.include(gear_axle_assembly_b, mu.Coordinates(0,1,[-999,-999,999],[10,10,10],[0,0,0],[10,10,10]))
system_b.include(axle_adapter_b, mu.Coordinates(0,1,[-999,-999,999],[10,10,10],[0,0,0],[10,10,10]))

system_c = mu.Assembly("system_c")
system_c.include(bevel_gear_b, mu.Coordinates(0,1,[-999,-999,999],[10,10,10],[0,0,0],[10,10,10]))
system_c.include(bevel_gear_b, mu.Coordinates(0,1,[-999,-999,999],[10,10,10],[0,0,0],[10,10,10]))

system_d = mu.Assembly("system_d")
system_d.include(bevel_gear_b, mu.Coordinates(0,1,[-999,-999,999],[10,10,10],[0,0,0],[10,10,10]))
system_d.include(axle_adapter_b, mu.Coordinates(0,1,[-999,-999,999],[10,10,10],[0,0,0],[10,10,10]))


""" This is a cubic gearbox. Its should be noted that this assembly can infact be made as a class and a """

#panel_a = Part("panel_a", "CUBX0177-BPAN-B25SR2P5-X8Y8P18-RT-SX25Y25-X8Y8-X20Y20Z5")

alpha = 200 
chamber_assembly = mu.Assembly("chamber_assembly")
chamber_assembly.include(panel_a, mu.Coordinates(0,1,[0, 0 , 8 * 25 / 2 + alpha],[0, 0 , 8 * 25 / 2 ],[0,0,1000],[0,0,0])) # Coordinates complete!
chamber_assembly.include(panel_b, mu.Coordinates(0,1,[0, 8 * 25 / 2 + alpha, 0],[0, 8 * 25 / 2, 0],[0,0,1000],[-90,0,0])) # Coordinates complete!
chamber_assembly.include(panel_c, mu.Coordinates(0,1,[ - 8 * 25 / 2 - alpha, 0, 0 ],[ - 8 * 25 / 2, 0, 0 ],[0,0,1000],[0,-90,0])) # Coordinates complete!
chamber_assembly.include(panel_d, mu.Coordinates(0,1,[0 , 0, -8 * 25 / 2 - alpha],[0 , 0, -8 * 25 / 2 ],[0,0,1000],[0,180,0])) # Coordinates complete!
chamber_assembly.include(panel_e, mu.Coordinates(0,1,[0, - 8 * 25 / 2 - alpha, 0 ],[0, - 8 * 25 / 2, 0 ],[0,0,1000],[90,0,0])) # Coordinates complete!
chamber_assembly.include(panel_f, mu.Coordinates(0,1,[8 * 25 / 2 + alpha, 0 , 0],[8 * 25 / 2, 0 , 0],[0,0,1000],[90,0,90])) # Coordinates complete!


workspace.run(chamber_assembly, mu.Coordinates(0,1,[0,0,0],[0,0,0],[0,0,0],[0,0,0]))

#print(json.dumps(workspace.__dict__, indent=4, sort_keys=True))
