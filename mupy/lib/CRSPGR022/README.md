# CRSPGR022
The CRSPGR022 family was developed for gear production. You can find the original repo at https://github.com/chrisspen/gears.

### Manufacturing Reccomendations
It is reccomended that CRSPGR022 parts be 3D printed.

## R - Rack
A gear rack has straight teeth cut into one surface of a square or round section of rod and operates with a pinion, which is a small cylindrical gear meshing with the gear rack.
### Example(s)

    μ:# CRSPGR022-R-M1-L100H5W25-P15H0

### System Schema

    μ:# CRSPGR022-R-M<modul>-L<rack_length_in_mm>H<rack_height_in_mm>W<rack_width_in_mm>-P<pressure_angle>H<helix_angle>


| Parameter             | Description                    |        Type       |    Units    |     Example    |
| --------------------- | ------------------------------ | ------------------|-------------|------------------|
| modul  | Height of the tooth tip above the rolling line. | number  |  mm   |   3    |
| rack_length_in_mm  |  Length of rack. | number (use 'P' to represent a decimal point)  |     mm      |    100     |
| rack_height_in_mm  |  Height of rack. | number (use 'P' to represent a decimal point)  |     mm      |    5     |
| rack_width_in_mm  |  Width of rack. | number (use 'P' to represent a decimal point)  |     mm      |     25   |
| pressure_angle  |  Pressure Angle, standard = 20° according to DIN 867. Should not exceed 45°. | number |     degrees      |   15   |
| helix_angle  |  Helix angle of the rack transverse axis; 0° = Spur Teeth. | number (use 'P' to represent a decimal point) |     degrees    |     0     |

## MR - Mountable Rack
A gear rack has straight teeth cut into one surface of a square or round section of rod and operates with a pinion, which is a small cylindrical gear meshing with the gear rack.
### Example(s)

    μ:# CRSPGR022-MR-M2-L34H34W23-P15H20-P4-PH-F3

### System Schema

    μ:# CRSPGR022-R-M<modul>-L<rack_length_in_mm>H<rack_height_in_mm>W<rack_width_in_mm>-P<pressure_angle>H<helix_angle>

### Parameterization Table

| Parameter             | Description                    |        Type       |    Units    |
| --------------------- | ------------------------------ | ------------------|--------------
| modul  | Height of the tooth tip above the rolling line. | int, float  |  mm    |
| rack_length_in_mm  |  Length of rack. | int, float  |     mm      |
| rack_height_in_mm  |  Height of rack. | int, float  |     mm      |
| rack_width_in_mm  |  Width of rack. | int, float  |     mm      |
| pressure_angle  |  Pressure Angle, standard = 20° according to DIN 867. Should not exceed 45°. | int, float  |     degrees      |
| helix_angle  |  Helix angle of the rack transverse axis; 0° = Spur Teeth. | int, float  |     degrees      |
| profile  |  Metric standard profile for fastners (ISO machine screws), M4 = 4, M6 = 6 etc. | int, float  |     mm      |
| head  |  Style of fastner to accomodate. | int, float  |     mm      |
| fastners  |  Total number of fastners. | boolean (T - true, F - false)  |     state      |


## HR - Herringbone Rack

### Example(s)

    μ:# CRSPGR022-HR-M1-L100H5W25-P15H0

### System Schema

    μ:# 

| Parameter             | Description                    |        Type       |    Units    |
| --------------------- | ------------------------------ | ------------------|--------------
| modul  | Height of the tooth tip above the rolling line. | int, float  |  mm    |
| rack_length_in_mm  |  Length of rack. | int, float  |     mm      |
| rack_height_in_mm  |  Height of rack. | int, float  |     mm      |
| rack_width_in_mm  |  Width of rack. | int, float  |     mm      |
| pressure_angle  |  Pressure Angle, standard = 20° according to DIN 867. Should not exceed 45°. | int, float  |     degrees      |
| helix_angle  |  Helix angle of the rack transverse axis; 0° = Spur Teeth. | int, float  |     degrees      |


## MHR - Mountable Herringbone Rack

### Example(s)

    μ:# CRSPGR022-MHR-M1-L34H34W23-P15H20-P4-PH-F2

### System Schema

    μ:# 

| Parameter             | Description                    |        Type       |    Units    |
| --------------------- | ------------------------------ | ------------------|--------------
| modul  | Height of the tooth tip above the rolling line. | int, float  |  mm    |
| rack_length_in_mm  |  Length of rack. | int, float  |     mm      |
| rack_height_in_mm  |  Height of rack. | int, float  |     mm      |
| rack_width_in_mm  |  Width of rack. | int, float  |     mm      |
| pressure_angle  |  Pressure Angle, standard = 20° according to DIN 867. Should not exceed 45°. | int, float  |     degrees      |
| helix_angle  |  Helix angle of the rack transverse axis; 0° = Spur Teeth. | int, float  |     degrees      |


## SG - Spur Gear
Spur gears or straight-cut gears are the simplest type of gear. They consist of a cylinder or disk with teeth projecting radially. Viewing the gear at 90 degrees from the shaft length (side on) the tooth faces are straight and aligned parallel to the axis of rotation.

### Example(s)

    μ:# CRSPGR022-SG-M1-T34W23-P15H20-B4-T

### System Schema

    μ:# 

| Parameter             | Description                    |        Type       |    Units    |
| --------------------- | ------------------------------ | ------------------|--------------
| modul  | Height of the tooth tip above the rolling line. | int, float  |  mm    |
| tooth_number  |  Number of gear teeth. | int, float  |     mm      |
| width  |  Tooth width. | int, float  |     mm      |
| bore  |  Width of rack. | int, float  |     mm      |
| pressure_angle  |  Pressure Angle, standard = 20° according to DIN 867. Should not exceed 45°. | int, float  |     degrees      |
| helix_angle  |  Helix angle of the rack transverse axis; 0° = Spur Teeth. | int, float  |     degrees      |
| optimized  |  Create holes for material-/weight-saving or surface enhancements where geometry allows. | boolean (T - true, F - false) |     state      |

## HG - Herringbone Gear
A herringbone gear, a specific type of double helical gear, is a special type of gear that is a side-to-side (not face-to-face) combination of two helical gears of opposite hands.

### Example(s)

    μ:# CRSPGR022-HG-M1-T34W23-P15H20-B4-T

### System Schema

    μ:# 

| Parameter             | Description                    |        Type       |    Units    |
| --------------------- | ------------------------------ | ------------------|--------------
| modul  | Height of the tooth tip above the rolling line. | int, float  |  mm    |
| tooth_number  |  Number of gear teeth. | int, float  |     mm      |
| width  |  Tooth width. | int, float  |     mm      |
| bore  |  Width of rack. | int, float  |     mm      |
| pressure_angle  |  Pressure Angle, standard = 20° according to DIN 867. Should not exceed 45°. | int, float  |     degrees      |
| helix_angle  |  Helix angle of the rack transverse axis; 0° = Spur Teeth. | int, float  |     degrees      |
| optimized  |  Create holes for material-/weight-saving or surface enhancements where geometry allows. | boolean (T - true, F - false) |     state      |

## RG - Ring Gear
A ring gear is a gear ring shaped gear with teeth on the inside. It is a component of a planetary gearset.
### Example(s)

    μ:# CRSPGR022-RG-M1-T34W23R23-P15H20

### System Schema

    μ:# 


## HRG - Herringbone Ring Gear
A herringbone ring gear, a specific type of double helical ring gear, is a special type of ring gear that is a side-to-side (not face-to-face) combination of two helical gears of opposite hands.

### Example(s)

    μ:# CRSPGR022-HRG-M1-T34W23R23-P15H20

### System Schema

    μ:# 


## PG - Planetary Gear
A Planetary gearing is a gear system consisting of one or more planet gears revolving about a central sun gear.

### Example(s)

    μ:# CRSPGR022-PG-M1-S34P34N3W23R23-P15H20-B2-T-T

### System Schema

    μ:# 


## BG - Bevel Gear
Bevel gears are gears where the axes of the two shafts intersect and the tooth-bearing faces of the gears themselves are conically shaped
### Example(s)

    μ:# CRSPGR022-BG-M1-T34W23S10-P15H20C15-B3

### System Schema

    μ:# 


## BHG - Bevel Herringbone Gear - Issues with render
A herringbone gear, a specific type of double helical gear, is a special type of gear that is a side-to-side (not face-to-face) combination of two helical gears of opposite hands.
### Example(s)

    μ:# CRSPGR022-BHG-M1-T34W23-P15H20C15-B3

### System Schema

    μ:# 


## W - Worm Gear
A worm gear is a gear consisting of a shaft with a spiral thread that engages with and drives a toothed wheel.
### Example(s)

    μ:# CRSPGR022-W-M1-TH34L23-P15L20-B3

### System Schema

    μ:# 

