# CRSPGR022
The CRSPGR022 family was developed for gear production. You can find the original repo at https://github.com/chrisspen/gears.

### Manufacturing Reccomendations
It is reccomended that CRSPGR022 parts be 3D printed.

## R - Rack

### Example(s)

    μ:# CRSPGR022-R-M1-L100H5W25-P15H0

### System Schema

    μ:# CRSPGR022-R-M<modul>-L<rack_length_in_mm>H<rack_height_in_mm>W<rack_width_in_mm>-P<pressure_angle>H<helix_angle>


| Parameter             | Description                    |        Type       |    Units    |
| --------------------- | ------------------------------ | ------------------|--------------
| modul  | Height of the tooth tip above the rolling line. | int, float  |  mm    |
| rack_length_in_mm  |  Length of rack. | int, float  |     mm      |
| rack_height_in_mm  |  Height of rack. | int, float  |     mm      |
| rack_width_in_mm  |  Width of rack. | int, float  |     mm      |
| pressure_angle  |  Pressure Angle, standard = 20° according to DIN 867. Should not exceed 45°. | int, float  |     degrees      |
| helix_angle  |  Helix angle of the rack transverse axis; 0° = Spur Teeth. | int, float  |     degrees      |

## MR - Mountable Rack

### Example(s)

    μ:# CRSPGR022-MR-M2-L34H34W23-P15H20-P4-PH-F3

### System Schema

    μ:# CRSPGR022-R-M<modul>-L<rack_length_in_mm>H<rack_height_in_mm>W<rack_width_in_mm>-P<pressure_angle>H<helix_angle>


| Parameter             | Description                    |        Type       |    Units    |
| --------------------- | ------------------------------ | ------------------|--------------
| modul  | Height of the tooth tip above the rolling line. | int, float  |  mm    |
| rack_length_in_mm  |  Length of rack. | int, float  |     mm      |
| rack_height_in_mm  |  Height of rack. | int, float  |     mm      |
| rack_width_in_mm  |  Width of rack. | int, float  |     mm      |
| pressure_angle  |  Pressure Angle, standard = 20° according to DIN 867. Should not exceed 45°. | int, float  |     degrees      |
| helix_angle  |  Helix angle of the rack transverse axis; 0° = Spur Teeth. | int, float  |     degrees      |
| profile  |  bolting. | int, float  |     mm      |
| head  |  bolting. | int, float  |     mm      |
| fastners  |  bolting. | boolean (T - true, F - false)  |     state      |


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

### Example(s)

    μ:# CRSPGR022-RG-M1-T34W23R23-P15H20

### System Schema

    μ:# 


## HRG - Herringbone Ring Gear

### Example(s)

    μ:# CRSPGR022-HRG-M1-T34W23R23-P15H20

### System Schema

    μ:# 


## PG - Planetary Gear

### Example(s)

    μ:# CRSPGR022-PG-M1-S34P34N3W23R23-P15H20-B2-T-T

### System Schema

    μ:# 


## BG - Bevel Gear

### Example(s)

    μ:# CRSPGR022-BG-M1-T34W23S10-P15H20C15-B3

### System Schema

    μ:# 


## BHG - Bevel Herringbone Gear - Issues with render

### Example(s)

    μ:# CRSPGR022-BHG-M1-T34W23-P15H20C15-B3

### System Schema

    μ:# 


## W - Worm Gear

### Example(s)

    μ:# CRSPGR022-W-M1-TH34L23-P15L20-B3

### System Schema

    μ:# 

