# CUBX0177
The CUBX0177 family was developed for simple prototyping and construction. Joinery and bolting based binding. This particular family is really really fun for prototyping. These parts are like legos in some ways but are unlike legos in other ways. 

![Alt Text](resources/cubx0177_0.png)

### Manufacturing Reccomendations
For smaller parts it is reccomended that CUBX0177 parts be 3D printed. If larger utilize any manufacturing method that which suites your needs.

## BPAN

### Example(s)

    μ:# CUBX0177-BPAN-B12SR3-X10Y10PP12-RT-SX10Y10-X1Y1-XO0YO0-X70Y70Z10-S

### System Schema

    μ:# CUBX0177-BPAN-B<block_unit_length>SR<shaft_radius>-X<x_block_unit_count>Y<y_block_unit_count>P<teeth_padding>-R<orientation>T<teeth_present>-SX<x_cavity_spacing>Y<y_cavity_spacing>-X<x_cavity_count>Y<y_cavity_count>-XO<x_offset>YO<y_offset>-X<x_cavity_dimensions>Y<y_cavity_dimensions>Z<z_cavity_dimensions>-<cavity_type>

### Parameterization Table

| Parameter             | Description                    |        Input Type       |    Input Units    |    Input Example  |
| --------------------- | ------------------------------ | ------------------------|-------------------|-------------------|
| block_unit_length  | Each part exists as an array of 'unit_blocks' which are perfect cubes. This parameter describes the unit_blocks unit-length, unit-width & unit-height (which shall always be the same). | number (Use 'P' to indicate decimal within numerical string)  |    mm    |      15       |
| shaft_radius  | Radius of bolt shaft. | number (Use 'P' to indicate decimal within numerical string)  |     mm      |      3       |
| x_block_unit_count  | Block units in x dimension. | number (Use 'P' to indicate decimal within numerical string)  |     block_unit      |      10       |
| y_block_unit_count  |  Block units in y dimension. | number (Use 'P' to indicate decimal within numerical string)  |     block_unit     |      12       |
| teeth_padding  | Interteeth padding distance. Recommended is '0.12' or 'P12' or '0P12' but this is kept variable due to variance in 3D printer quality. Increase to loosen. Decrease to tighten.| number (Use 'P' to indicate decimal within numerical string)  |     block_unit      |      0P12  ( = 0.12)     |
| orientation  | For box panel hardware components there is an orientation variable which refers to the way the side teeth are placed with respect to the bulk of the panel. There are 4 states however this reduces to two states if the top and bottom sides are identical ; If no top-teeth are added.| R - regular, I - inverted, C - chimera, X - inverted chimera  |     topological state      |       I       |
| teeth_present  | Are top teeth present. These are nessecary in order to join CUBX0177 complete boxes to one another. | boolean (T - true, F - false)  |     state      |      T       |
| x_cavity_spacing  | Inter-cavity spacing in the x dimesnsion. | number (Use 'P' to indicate decimal within numerical string)  |     mm      |      10       |
| x_cavity_count  | x dimesnsion cavity count. | number (Use 'P' to indicate decimal within numerical string)  |     mm      |      2       |
| y_cavity_count  | y dimesnsion cavity count. | number (Use 'P' to indicate decimal within numerical string)  |     mm      |      1       |
| x_offset  | x dimensions cavity array offset from center. | number (Use 'P' to indicate decimal within numerical string)  |     mm      |      5       |
| y_offset  | y dimensions cavity array offset from center. | number (Use 'P' to indicate decimal within numerical string)  |     mm      |      10       |
| x_cavity_dimensions  | x dimensions of the cavities. | number (Use 'P' to indicate decimal within numerical string)  |     mm      |      10       |
| y_cavity_dimensions  | y dimensions of the cavities. | number (Use 'P' to indicate decimal within numerical string)  |     mm      |      5       |
| z_cavity_dimensions  | z dimensions of the cavities. | number (Use 'P' to indicate decimal within numerical string)  |     mm      |      20       |
| cavity_type  | For the cavity array embedded on the panel, specifies if the cavities are circular (C) or square (S). | letter (C - circular, S - square) |     state      |      S       |


CUBX0177-BPAN-B12SR3-X10Y10PP12-RF-SX10Y10-X1Y1-XO0YO0-X70Y70Z10-C
