# CUBX0177
The CUBX0177 family was developed for simple prototyping and construction. Joinery and bolting based binding. This particular family is really really fun for prototyping. These parts are like legos in some ways but are unlike legos in other ways. 

### Manufacturing Reccomendations
For smaller parts it is reccomended that CUBX0177 parts be 3D printed. If larger utilize any manufacturing method that which suites your needs.

## BPAN

### Example(s)

    μ:# CUBX0177-BPAN-B12SR3-X10Y10PP12-RT-SX10Y10-X1Y1-XO0YO0-X70Y70Z10-S

### System Schema

    μ:# CUBX0177-BPAN-B<block_unit_length>SR<shaft_radius>-X<x_block_unit_count>Y<y_block_unit_count>P<teeth_padding>-R<orientation>T<teeth_present>-SX<x_cavity_spacing>Y<y_cavity_spacing>-X<x_cavity_count>Y<y_cavity_count>-XO<x_offset>YO<y_offset>-X<x_cavity_dimensions>Y<y_cavity_dimensions>Z<z_cavity_dimensions>-<cavity_type>

### Parameterization Table

| script / directory            | Description                    |        Status       |
| --------------------- | ------------------------------ | ------------------------|
| hardware.py  | Python class for building digital twin representations of hardware for a given system code. |  This class is fundemental to the mupy-model currently.  |
| assembly.py  | Radius of bolt shaft. | number (Use 'P' to indicate decimal within numerical string)  |     This class is fundemental to the mupy-model currently.       |
| coordinates.py  | Radius of bolt shaft. | number (Use 'P' to indicate decimal within numerical string)  |     mm      |
| workspace.py  | Radius of bolt shaft. | number (Use 'P' to indicate decimal within numerical string)  |     mm      |
| core.py  | Radius of bolt shaft. | number (Use 'P' to indicate decimal within numerical string)  |     mm      |
| decode.py  | Radius of bolt shaft. | number (Use 'P' to indicate decimal within numerical string)  |     This class will be phased out for a sub-system that works more like an FTP / namespace or a better library structure.      |