#!/usr/bin/env python3

import mupy.core as mu


# A workspace represents a virtual 3D spce which serves as a virtual workbench except it is not a surface but a space.
""" Workspace """

workspace = WorkSpace("/home/mryan/Desktop/psi/modular_gearboxes/")

""" Hardware """


bevel_gear_a = Hardware("inner_chamber_bevel_gear_a", "CRSPGR022-BG-M1-T34W23S10-P15H0C45-B0") # Declare bevel gear of 
bevel_gear_b = Hardware("inner_chamber_bevel_gear_b", "CRSPGR022-BG-M2-T22W23S10-P15H0C45-B0")
bevel_gear_c = Hardware("inner_chamber_bevel_gear_c", "CRSPGR022-BG-M2-T34W23S10-P15H0C45-B0")
bevel_gear_d = Hardware("inner_chamber_bevel_gear_d", "CRSPGR022-BG-M3-T55W23S10-P15H0C45-B0")

bearing_a = Hardware("bearing_a", "bearing.stl")
bearing_b = Hardware("bearing_b", "bearing.stl")
bearing_c = Hardware("bearing_c", "bearing.stl")
bearing_d = Hardware("bearing_d", "bearing.stl")

panel_a = Hardware("panel_a", "CUBX0177-BPAN-B25SR2P5-X8Y8P18-RT-SX25Y25-X8Y8-X20Y20Z5")
panel_b = Hardware("panel_b", "CUBX0177-BPAN-B25SR2P5-X8Y8P18-RT-SX25Y25-X8Y8-X20Y20Z5")
panel_c = Hardware("panel_c", "CUBX0177-BPAN-B25SR2P5-X8Y8P18-RT-SX25Y25-X8Y8-X20Y20Z5")
panel_d = Hardware("panel_d", "CUBX0177-BPAN-B25SR2P5-X8Y8P18-RT-SX25Y25-X8Y8-X20Y20Z5")
panel_e = Hardware("panel_e", "CUBX0177-BPAN-B25SR2P5-X8Y8P18-RT-SX25Y25-X8Y8-X20Y20Z5")
panel_f = Hardware("panel_f", "CUBX0177-BPAN-B25SR2P5-X8Y8P18-RT-SX25Y25-X8Y8-X20Y20Z5")

flywheel_adapter_a = Hardware("flywheel_adapter_a", "CUBX0177-BPAN-B25SR2P5-X3Y7P18-RT-SX25Y25-X8Y8-X20Y2010Z5")
flywheel_adapter_b = Hardware("flywheel_adapter_b", "CUBX0177-BPAN-B25SR2P5-X3Y7P18-RT-SX25Y25-X8Y8-X20Y2010Z5")

axle_adapter_a = Hardware("axle_adapter_a", "CUBX0177-BPAN-B25SR2P5-X3Y7P18-RT-SX25Y25-X8Y8-X20Y2010Z5")
axle_adapter_b = Hardware("axle_adapter_b", "CUBX0177-BPAN-B25SR2P5-X3Y7P18-RT-SX25Y25-X8Y8-X20Y2010Z5")

axle_adapter_bolt_a_1 = Hardware("axle_adapter_bolt_a_1", "CUBX0177-BPAN-B25SR2P5-X3Y7P18-RT-SX25Y25-X8Y8-X20Y2010Z5")
axle_adapter_bolt_a_2 = Hardware("axle_adapter_bolt_a_2", "CUBX0177-BPAN-B25SR2P5-X3Y7P18-RT-SX25Y25-X8Y8-X20Y2010Z5")
axle_adapter_bolt_a_3 = Hardware("axle_adapter_bolt_a_3", "CUBX0177-BPAN-B25SR2P5-X3Y7P18-RT-SX25Y25-X8Y8-X20Y2010Z5")
axle_adapter_bolt_a_4 = Hardware("axle_adapter_bolt_a_4", "CUBX0177-BPAN-B25SR2P5-X3Y7P18-RT-SX25Y25-X8Y8-X20Y2010Z5")

axle_adapter_bolt_b_1 = Hardware("axle_adapter_bolt_b_1", "CUBX0177-BPAN-B25SR2P5-X3Y7P18-RT-SX25Y25-X8Y8-X20Y2010Z5")
axle_adapter_bolt_b_2 = Hardware("axle_adapter_bolt_b_2", "CUBX0177-BPAN-B25SR2P5-X3Y7P18-RT-SX25Y25-X8Y8-X20Y2010Z5")
axle_adapter_bolt_b_3 = Hardware("axle_adapter_bolt_b_3", "CUBX0177-BPAN-B25SR2P5-X3Y7P18-RT-SX25Y25-X8Y8-X20Y2010Z5")
axle_adapter_bolt_b_4 = Hardware("axle_adapter_bolt_b_4", "CUBX0177-BPAN-B25SR2P5-X3Y7P18-RT-SX25Y25-X8Y8-X20Y2010Z5")

boltshaft_a = Hardware("boltshaft_a", "CUBX0177-BPAN-B25SR2P5-X3Y7P18-RT-SX25Y25-X8Y8-X20Y2010Z5")
boltshaft_b = Hardware("boltshaft_a", "CUBX0177-BPAN-B25SR2P5-X3Y7P18-RT-SX25Y25-X8Y8-X20Y2010Z5")

gear_top_lock_washer_a = Hardware("gear_top_lock_washer_a","CUBX0177-BPAN-B25SR2P5-X3Y7P18-RT-SX25Y25-X8Y8-X20Y2010Z5") 
gear_top_lock_washer_b = Hardware("gear_top_lock_washer_b","CUBX0177-BPAN-B25SR2P5-X3Y7P18-RT-SX25Y25-X8Y8-X20Y2010Z5")

gear_top_washer_a = Hardware("gear_top_washer_a","CUBX0177-BPAN-B25SR2P5-X3Y7P18-RT-SX25Y25-X8Y8-X20Y2010Z5")
gear_top_washer_b = Hardware("gear_top_washer_b","CUBX0177-BPAN-B25SR2P5-X3Y7P18-RT-SX25Y25-X8Y8-X20Y2010Z5")

gear_top_nut_a = Hardware("gear_top_nut_a","CUBX0177-BPAN-B25SR2P5-X3Y7P18-RT-SX25Y25-X8Y8-X20Y2010Z5")
gear_top_nut_b = Hardware("gear_top_nut_b","CUBX0177-BPAN-B25SR2P5-X3Y7P18-RT-SX25Y25-X8Y8-X20Y2010Z5")

gear_bottom_lock_washer_a = Hardware("gear_bottom_lock_washer_a","CUBX0177-BPAN-B25SR2P5-X3Y7P18-RT-SX25Y25-X8Y8-X20Y2010Z5")
gear_bottom_lock_washer_b = Hardware("gear_bottom_lock_washer_b","CUBX0177-BPAN-B25SR2P5-X3Y7P18-RT-SX25Y25-X8Y8-X20Y2010Z5")

gear_bottom_washer_a = Hardware("gear_bottom_washer_a","CUBX0177-BPAN-B25SR2P5-X3Y7P18-RT-SX25Y25-X8Y8-X20Y2010Z5")
gear_bottom_washer_b = Hardware("gear_bottom_washer_b","CUBX0177-BPAN-B25SR2P5-X3Y7P18-RT-SX25Y25-X8Y8-X20Y2010Z5")

gear_bottom_nut_a = Hardware("gear_bottom_nut_a","CUBX0177-BPAN-B25SR2P5-X3Y7P18-RT-SX25Y25-X8Y8-X20Y2010Z5")
gear_bottom_nut_b = Hardware("gear_bottom_nut_b","CUBX0177-BPAN-B25SR2P5-X3Y7P18-RT-SX25Y25-X8Y8-X20Y2010Z5")

bearing_top_lock_washer_a = Hardware("bearing_top_lock_washer_a","CUBX0177-BPAN-B25SR2P5-X3Y7P18-RT-SX25Y25-X8Y8-X20Y2010Z5") 
bearing_top_lock_washer_b = Hardware("bearing_top_lock_washer_b","CUBX0177-BPAN-B25SR2P5-X3Y7P18-RT-SX25Y25-X8Y8-X20Y2010Z5")

bearing_top_washer_a = Hardware("bearing_top_washer_a","CUBX0177-BPAN-B25SR2P5-X3Y7P18-RT-SX25Y25-X8Y8-X20Y2010Z5")
bearing_top_washer_b = Hardware("bearing_top_washer_b","CUBX0177-BPAN-B25SR2P5-X3Y7P18-RT-SX25Y25-X8Y8-X20Y2010Z5")

bearing_top_nut_a = Hardware("bearing_top_nut_a","CUBX0177-BPAN-B25SR2P5-X3Y7P18-RT-SX25Y25-X8Y8-X20Y2010Z5")
bearing_top_nut_b = Hardware("bearing_top_nut_b","CUBX0177-BPAN-B25SR2P5-X3Y7P18-RT-SX25Y25-X8Y8-X20Y2010Z5")

bearing_bottom_lock_washer_a = Hardware("bearing_bottom_lock_washer_a","CUBX0177-BPAN-B25SR2P5-X3Y7P18-RT-SX25Y25-X8Y8-X20Y2010Z5")
bearing_bottom_lock_washer_b = Hardware("bearing_bottom_lock_washer_b","CUBX0177-BPAN-B25SR2P5-X3Y7P18-RT-SX25Y25-X8Y8-X20Y2010Z5")

bearing_bottom_washer_a = Hardware("bearing_bottom_washer_a","CUBX0177-BPAN-B25SR2P5-X3Y7P18-RT-SX25Y25-X8Y8-X20Y2010Z5")
bearing_bottom_washer_b = Hardware("bearing_bottom_washer_b","CUBX0177-BPAN-B25SR2P5-X3Y7P18-RT-SX25Y25-X8Y8-X20Y2010Z5")

bearing_bottom_nut_a = Hardware("bearing_bottom_nut_a","CUBX0177-BPAN-B25SR2P5-X3Y7P18-RT-SX25Y25-X8Y8-X20Y2010Z5")
bearing_bottom_nut_b = Hardware("bearing_bottom_nut_b","CUBX0177-BPAN-B25SR2P5-X3Y7P18-RT-SX25Y25-X8Y8-X20Y2010Z5")

bearing_adapter_top_nut_a = Hardware("bearing_bottom_nut_a","CUBX0177-BPAN-B25SR2P5-X3Y7P18-RT-SX25Y25-X8Y8-X20Y2010Z5")
bearing_adapter_top_nut_b = Hardware("bearing_bottom_nut_a","CUBX0177-BPAN-B25SR2P5-X3Y7P18-RT-SX25Y25-X8Y8-X20Y2010Z5")

bearing_adapter_top_lockwasher_a = Hardware("bearing_bottom_nut_a","CUBX0177-BPAN-B25SR2P5-X3Y7P18-RT-SX25Y25-X8Y8-X20Y2010Z5")
bearing_adapter_top_lockwasher_b = Hardware("bearing_bottom_nut_a","CUBX0177-BPAN-B25SR2P5-X3Y7P18-RT-SX25Y25-X8Y8-X20Y2010Z5")

bearing_adapter_top_washer_a = Hardware("bearing_bottom_nut_a","CUBX0177-BPAN-B25SR2P5-X3Y7P18-RT-SX25Y25-X8Y8-X20Y2010Z5")
bearing_adapter_top_washer_b = Hardware("bearing_bottom_nut_a","CUBX0177-BPAN-B25SR2P5-X3Y7P18-RT-SX25Y25-X8Y8-X20Y2010Z5")

bearing_adapter = Hardware("bearing_bottom_nut_a","CUBX0177-BPAN-B25SR2P5-X3Y7P18-RT-SX25Y25-X8Y8-X20Y2010Z5")
bearing_adapter = Hardware("bearing_bottom_nut_a","CUBX0177-BPAN-B25SR2P5-X3Y7P18-RT-SX25Y25-X8Y8-X20Y2010Z5")

bearing_adapter_bottom_washer_a = Hardware("bearing_bottom_nut_a","CUBX0177-BPAN-B25SR2P5-X3Y7P18-RT-SX25Y25-X8Y8-X20Y2010Z5")
bearing_adapter_bottom_washer_b = Hardware("bearing_bottom_nut_a","CUBX0177-BPAN-B25SR2P5-X3Y7P18-RT-SX25Y25-X8Y8-X20Y2010Z5")

bearing_adapter_bottom_lockwasher_a = Hardware("bearing_bottom_nut_a","CUBX0177-BPAN-B25SR2P5-X3Y7P18-RT-SX25Y25-X8Y8-X20Y2010Z5")
bearing_adapter_bottom_lockwasher_b = Hardware("bearing_bottom_nut_a","CUBX0177-BPAN-B25SR2P5-X3Y7P18-RT-SX25Y25-X8Y8-X20Y2010Z5")

bearing_adapter_bottom_nut_a = Hardware("bearing_bottom_nut_a","CUBX0177-BPAN-B25SR2P5-X3Y7P18-RT-SX25Y25-X8Y8-X20Y2010Z5")
bearing_adapter_bottom_nut_b = Hardware("bearing_bottom_nut_a","CUBX0177-BPAN-B25SR2P5-X3Y7P18-RT-SX25Y25-X8Y8-X20Y2010Z5")



""" Assemblies """

bearing_panel_a = Assembly("bearing_panel_a")
#bearing_panel_a.include(panel_a, Coordinates(0,1,[-999,-999,999],[10,10,10],[0,0,0],[10,10,10]))
bearing_panel_a.include(bearing_a, Coordinates(0,1,[-999,-999,999],[10,10,10],[0,0,0],[10,10,10]))

gear_axle_assembly_a = Assembly("gear_axle_assembly_a")
gear_axle_assembly_a.include(boltshaft_a, Coordinates(0,1,[-999,-999,999],[10,10,10],[0,0,0],[10,10,10]))
gear_axle_assembly_a.include(gear_top_lock_washer_a, Coordinates(0,1,[-999,-999,999],[10,10,10],[0,0,0],[10,10,10]))
gear_axle_assembly_a.include(gear_top_washer_a, Coordinates(0,1,[-999,-999,999],[10,10,10],[0,0,0],[10,10,10]))
gear_axle_assembly_a.include(bevel_gear_a, Coordinates(0,1,[-999,-999,999],[10,10,10],[0,0,0],[10,10,10]))
gear_axle_assembly_a.include(gear_bottom_washer_a, Coordinates(0,1,[-999,-999,999],[10,10,10],[0,0,0],[10,10,10]))
gear_axle_assembly_a.include(gear_bottom_lock_washer_a, Coordinates(0,1,[-999,-999,999],[10,10,10],[0,0,0],[10,10,10]))
gear_axle_assembly_a.include(gear_bottom_nut_a, Coordinates(0,1,[-999,-999,999],[10,10,10],[0,0,0],[10,10,10]))
gear_axle_assembly_a.include(bearing_top_nut_a, Coordinates(0,1,[-999,-999,999],[10,10,10],[0,0,0],[10,10,10]))
gear_axle_assembly_a.include(bearing_top_lock_washer_a, Coordinates(0,1,[-999,-999,999],[10,10,10],[0,0,0],[10,10,10]))
gear_axle_assembly_a.include(bearing_top_washer_a, Coordinates(0,1,[-999,-999,999],[10,10,10],[0,0,0],[10,10,10]))
gear_axle_assembly_a.include(bearing_panel_a, Coordinates(0,1,[-999,-999,999],[10,10,10],[0,0,0],[10,10,10]))
gear_axle_assembly_a.include(bearing_bottom_washer_a, Coordinates(0,1,[-999,-999,999],[10,10,10],[0,0,0],[10,10,10]))
gear_axle_assembly_a.include(bearing_bottom_lock_washer_a, Coordinates(0,1,[-999,-999,999],[10,10,10],[0,0,0],[10,10,10]))
gear_axle_assembly_a.include(bearing_bottom_nut_a, Coordinates(0,1,[-999,-999,999],[10,10,10],[0,0,0],[10,10,10]))
gear_axle_assembly_a.include(bearing_adapter_top_nut_a, Coordinates(0,1,[-999,-999,999],[10,10,10],[0,0,0],[10,10,10]))
gear_axle_assembly_a.include(bearing_adapter_top_lockwasher_a, Coordinates(0,1,[-999,-999,999],[10,10,10],[0,0,0],[10,10,10]))
gear_axle_assembly_a.include(bearing_adapter_top_washer_a, Coordinates(0,1,[-999,-999,999],[10,10,10],[0,0,0],[10,10,10]))
gear_axle_assembly_a.include(bearing_adapter, Coordinates(0,1,[-999,-999,999],[10,10,10],[0,0,0],[10,10,10]))
gear_axle_assembly_a.include(bearing_adapter_bottom_washer_a, Coordinates(0,1,[-999,-999,999],[10,10,10],[0,0,0],[10,10,10]))
gear_axle_assembly_a.include(bearing_adapter_bottom_lockwasher_a, Coordinates(0,1,[-999,-999,999],[10,10,10],[0,0,0],[10,10,10]))
gear_axle_assembly_a.include(bearing_adapter_bottom_nut_a, Coordinates(0,1,[-999,-999,999],[10,10,10],[0,0,0],[10,10,10]))

system_a = Assembly("system_a")
system_a.include(gear_axle_assembly_a, Coordinates(0,1,[-999,-999,999],[10,10,10],[0,0,0],[10,10,10]))
system_a.include(axle_adapter_a, Coordinates(0,1,[-999,-999,999],[10,10,10],[0,0,0],[10,10,10]))


bearing_panel_b = Assembly("bearing_panel_b")
#bearing_panel_b.include(panel_b, Coordinates(0,1,[-999,-999,999],[10,10,10],[0,0,0],[10,10,10]))
bearing_panel_b.include(bearing_b, Coordinates(0,1,[-999,-999,999],[10,10,10],[0,0,0],[10,10,10]))

gear_axle_assembly_b = Assembly("gear_axle_assembly_b")
gear_axle_assembly_b.include(boltshaft_b, Coordinates(0,1,[-999,-999,999],[10,10,10],[0,0,0],[10,10,10]))
gear_axle_assembly_b.include(gear_top_lock_washer_b, Coordinates(0,1,[-999,-999,999],[10,10,10],[0,0,0],[10,10,10]))
gear_axle_assembly_b.include(gear_top_washer_b, Coordinates(0,1,[-999,-999,999],[10,10,10],[0,0,0],[10,10,10]))
gear_axle_assembly_b.include(bevel_gear_b, Coordinates(0,1,[-999,-999,999],[10,10,10],[0,0,0],[10,10,10]))
gear_axle_assembly_b.include(gear_bottom_washer_b, Coordinates(0,1,[-999,-999,999],[10,10,10],[0,0,0],[10,10,10]))
gear_axle_assembly_b.include(gear_bottom_lock_washer_b, Coordinates(0,1,[-999,-999,999],[10,10,10],[0,0,0],[10,10,10]))
gear_axle_assembly_b.include(gear_bottom_nut_b, Coordinates(0,1,[-999,-999,999],[10,10,10],[0,0,0],[10,10,10]))
gear_axle_assembly_b.include(bearing_top_nut_b, Coordinates(0,1,[-999,-999,999],[10,10,10],[0,0,0],[10,10,10]))
gear_axle_assembly_b.include(bearing_top_lock_washer_b, Coordinates(0,1,[-999,-999,999],[10,10,10],[0,0,0],[10,10,10]))
gear_axle_assembly_b.include(bearing_top_washer_b, Coordinates(0,1,[-999,-999,999],[10,10,10],[0,0,0],[10,10,10]))
gear_axle_assembly_b.include(bearing_panel_b, Coordinates(0,1,[-999,-999,999],[10,10,10],[0,0,0],[10,10,10]))
gear_axle_assembly_b.include(bearing_bottom_washer_b, Coordinates(0,1,[-999,-999,999],[10,10,10],[0,0,0],[10,10,10]))
gear_axle_assembly_b.include(bearing_bottom_lock_washer_b, Coordinates(0,1,[-999,-999,999],[10,10,10],[0,0,0],[10,10,10]))
gear_axle_assembly_b.include(bearing_bottom_nut_b, Coordinates(0,1,[-999,-999,999],[10,10,10],[0,0,0],[10,10,10]))
gear_axle_assembly_b.include(bearing_adapter_top_nut_b, Coordinates(0,1,[-999,-999,999],[10,10,10],[0,0,0],[10,10,10]))
gear_axle_assembly_b.include(bearing_adapter_top_lockwasher_b, Coordinates(0,1,[-999,-999,999],[10,10,10],[0,0,0],[10,10,10]))
gear_axle_assembly_b.include(bearing_adapter_top_washer_b, Coordinates(0,1,[-999,-999,999],[10,10,10],[0,0,0],[10,10,10]))
gear_axle_assembly_b.include(bearing_adapter, Coordinates(0,1,[-999,-999,999],[10,10,10],[0,0,0],[10,10,10]))
gear_axle_assembly_b.include(bearing_adapter_bottom_washer_b, Coordinates(0,1,[-999,-999,999],[10,10,10],[0,0,0],[10,10,10]))
gear_axle_assembly_b.include(bearing_adapter_bottom_lockwasher_b, Coordinates(0,1,[-999,-999,999],[10,10,10],[0,0,0],[10,10,10]))
gear_axle_assembly_b.include(bearing_adapter_bottom_nut_b, Coordinates(0,1,[-999,-999,999],[10,10,10],[0,0,0],[10,10,10]))

system_b = Assembly("system_b")
system_b.include(gear_axle_assembly_b, Coordinates(0,1,[-999,-999,999],[10,10,10],[0,0,0],[10,10,10]))
system_b.include(axle_adapter_b, Coordinates(0,1,[-999,-999,999],[10,10,10],[0,0,0],[10,10,10]))

system_c = Assembly("system_c")
system_c.include(bevel_gear_b, Coordinates(0,1,[-999,-999,999],[10,10,10],[0,0,0],[10,10,10]))
system_c.include(bevel_gear_b, Coordinates(0,1,[-999,-999,999],[10,10,10],[0,0,0],[10,10,10]))

system_d = Assembly("system_d")
system_d.include(bevel_gear_b, Coordinates(0,1,[-999,-999,999],[10,10,10],[0,0,0],[10,10,10]))
system_d.include(axle_adapter_b, Coordinates(0,1,[-999,-999,999],[10,10,10],[0,0,0],[10,10,10]))


""" This is a cubic gearbox. Its should be noted that this assembly can infact be made as a class and a """

#panel_a = Part("panel_a", "CUBX0177-BPAN-B25SR2P5-X8Y8P18-RT-SX25Y25-X8Y8-X20Y20Z5")

alpha = 200 
chamber_assembly = Assembly("chamber_assembly")
chamber_assembly.include(panel_a, Coordinates(0,1,[0, 0 , 8 * 25 / 2 + alpha],[0, 0 , 8 * 25 / 2 ],[0,0,1000],[0,0,0])) # Coordinates complete!
chamber_assembly.include(panel_b, Coordinates(0,1,[0, 8 * 25 / 2 + alpha, 0],[0, 8 * 25 / 2, 0],[0,0,1000],[-90,0,0])) # Coordinates complete!
chamber_assembly.include(panel_c, Coordinates(0,1,[ - 8 * 25 / 2 - alpha, 0, 0 ],[ - 8 * 25 / 2, 0, 0 ],[0,0,1000],[0,-90,0])) # Coordinates complete!
chamber_assembly.include(panel_d, Coordinates(0,1,[0 , 0, -8 * 25 / 2 - alpha],[0 , 0, -8 * 25 / 2 ],[0,0,1000],[0,180,0])) # Coordinates complete!
chamber_assembly.include(panel_e, Coordinates(0,1,[0, - 8 * 25 / 2 - alpha, 0 ],[0, - 8 * 25 / 2, 0 ],[0,0,1000],[90,0,0])) # Coordinates complete!
chamber_assembly.include(panel_f, Coordinates(0,1,[8 * 25 / 2 + alpha, 0 , 0],[8 * 25 / 2, 0 , 0],[0,0,1000],[90,0,90])) # Coordinates complete!


workspace.run(chamber_assembly, Coordinates(0,1,[0,0,0],[0,0,0],[0,0,0],[0,0,0]))

#print(json.dumps(workspace.__dict__, indent=4, sort_keys=True))
